# Dokumentasi Widget: Route

## 1. Penjelasan Singkat & Fungsi
Kelas abstrak `Route` menggambarkan abstraksi representasi dari sebuah rute halaman antarmuka yang dikelola oleh `Navigator`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `settings` | `RouteSettings` | Objek konfigurasi informasi rute seperti nama `name` dan `arguments`. |
| `isCurrent` | `bool` | Menandakan apakah rute ini sedang berada di puncak tumpukan navigasi. |
| `isActive` | `bool` | Menandakan apakah rute ini sedang aktif di dalam tumpukan navigasi. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RouteDemoApp());
}

class RouteDemoApp extends StatelessWidget {
  const RouteDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Route')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/details', arguments: 'Data Argumen Route');
          },
          child: const Text('Pindah Rute Nama'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(title: const Text('Details Route')),
      body: Center(child: Text('Argumen: $args')),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pengiriman Parameter RouteSettings (NIM & Kode Matkul))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RouteSettingsSiakadApp());
}

class RouteSettingsSiakadApp extends StatelessWidget {
  const RouteSettingsSiakadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CourseListPage(),
    );
  }
}

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pilih Mata Kuliah'), backgroundColor: Colors.indigo),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Pemrograman Seluler (IF2026)'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CourseDetailPage(),
                  settings: const RouteSettings(
                    name: '/course-detail',
                    arguments: {'kode': 'IF2026', 'nama': 'Pemrograman Seluler'},
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    return Scaffold(
      appBar: AppBar(title: Text(args?['nama'] ?? 'Detail'), backgroundColor: Colors.indigo),
      body: Center(
        child: Text('Kode Matkul: ${args?['kode']}'),
      ),
    );
  }
}
```
