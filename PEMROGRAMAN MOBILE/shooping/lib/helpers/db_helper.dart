import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'shopping.db');

    final db = await openDatabase(
      path,
      version: 3,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );

    // Memastikan tabel cart_items selalu ada
    await _createCartTable(db);

    // Migrasi defensif untuk memastikan kolom image ada di products dan cart_items
    try {
      await db.execute('ALTER TABLE products ADD COLUMN image TEXT');
    } catch (_) {}
    try {
      await db.execute('ALTER TABLE cart_items ADD COLUMN image TEXT');
    } catch (_) {}

    return db;
  }

  Future<void> _createCartTable(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS cart_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        product_id INTEGER NOT NULL,
        name TEXT NOT NULL,
        category TEXT NOT NULL,
        price REAL NOT NULL,
        quantity INTEGER NOT NULL,
        image TEXT
      )
    ''');
  }

  Future<void> _onCreate(Database db, int version) async {
    // 1. Tabel Users untuk Autentikasi
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');

    // 2. Tabel Products untuk Katalog Belanja
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        category TEXT NOT NULL,
        price REAL NOT NULL,
        stock INTEGER NOT NULL,
        description TEXT NOT NULL,
        image TEXT
      )
    ''');

    // 3. Tabel Cart Items untuk Keranjang Belanja
    await _createCartTable(db);

    // 4. Penyemaian Data Awal (Data Seeding)
    await _seedInitialData(db);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await _createCartTable(db);
    }
    if (oldVersion < 3) {
      try {
        await db.execute('ALTER TABLE products ADD COLUMN image TEXT');
      } catch (_) {}
      try {
        await db.execute('ALTER TABLE cart_items ADD COLUMN image TEXT');
      } catch (_) {}
    }
  }

  Future<void> _seedInitialData(Database db) async {
    // Akun Pengguna Contoh
    await db.insert('users', {
      'name': 'Mahasiswa Praktikan',
      'email': 'mahasiswa@kampus.ac.id',
      'password': 'password123',
    });

    // Produk Belanja Contoh
    final initialProducts = [
      {
        'name': 'Laptop ASUS Vivobook 14',
        'category': 'Elektronik',
        'price': 8500000.0,
        'stock': 12,
        'description': 'Laptop ringkas dengan prosesor Core i5, RAM 16GB, dan layar NanoEdge Full HD.',
      },
      {
        'name': 'Kemeja Flanel Casual Pria',
        'category': 'Pakaian',
        'price': 185000.0,
        'stock': 35,
        'description': 'Kemeja bahan katun wol lembut bermotif kotak-kotak modern.',
      },
      {
        'name': 'Sepatu Sneakers Running Pro',
        'category': 'Olahraga',
        'price': 420000.0,
        'stock': 20,
        'description': 'Sepatu lari ringan bersol bantalan empuk dan sirkulasi udara optimal.',
      },
      {
        'name': 'Tumbler Stainless Vacuum 500ml',
        'category': 'Aksesoris',
        'price': 95000.0,
        'stock': 50,
        'description': 'Botol minum tahan suhu panas dan dingin hingga 12 jam berbahan food-grade 304.',
      },
    ];

    for (final prod in initialProducts) {
      await db.insert('products', prod);
    }
  }

  // ==================== OPERASI TABEL USERS ====================

  Future<int> registerUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> loginUser(String email, String password) async {
    final db = await database;
    final res = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email.trim(), password],
    );

    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }

  Future<bool> isEmailRegistered(String email) async {
    final db = await database;
    final res = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email.trim()],
    );
    return res.isNotEmpty;
  }

  // ==================== OPERASI TABEL PRODUCTS ====================

  Future<int> insertProduct(Product product) async {
    final db = await database;
    return await db.insert('products', product.toMap());
  }

  Future<List<Product>> getAllProducts() async {
    final db = await database;
    final res = await db.query('products', orderBy: 'id DESC');
    return res.map((item) => Product.fromMap(item)).toList();
  }

  Future<Product?> getProductById(int id) async {
    final db = await database;
    final res = await db.query(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (res.isNotEmpty) {
      return Product.fromMap(res.first);
    }
    return null;
  }

  Future<int> updateProduct(Product product) async {
    final db = await database;
    return await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> deleteProduct(int id) async {
    final db = await database;
    return await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ==================== OPERASI TABEL CART_ITEMS ====================

  Future<void> addToCart(Product product, {int quantity = 1}) async {
    final db = await database;
    final existing = await db.query(
      'cart_items',
      where: 'product_id = ?',
      whereArgs: [product.id],
    );

    if (existing.isNotEmpty) {
      final currentQty = existing.first['quantity'] as int;
      await db.update(
        'cart_items',
        {'quantity': currentQty + quantity},
        where: 'product_id = ?',
        whereArgs: [product.id],
      );
    } else {
      await db.insert('cart_items', {
        'product_id': product.id ?? 0,
        'name': product.name,
        'category': product.category,
        'price': product.price,
        'quantity': quantity,
        'image': product.image ?? product.assetImage,
      });
    }
  }

  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final res = await db.query('cart_items', orderBy: 'id DESC');
    return res.map((item) => CartItem.fromMap(item)).toList();
  }

  Future<int> updateCartQuantity(int id, int quantity) async {
    final db = await database;
    if (quantity <= 0) {
      return await removeFromCart(id);
    }
    return await db.update(
      'cart_items',
      {'quantity': quantity},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> removeFromCart(int id) async {
    final db = await database;
    return await db.delete(
      'cart_items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> clearCart() async {
    final db = await database;
    return await db.delete('cart_items');
  }
}
