# Dokumentasi Widget: SliverList & SliverGrid

## 1. Deskripsi & Fungsi Modul

Widget `SliverList` dan `SliverGrid` merupakan modul penyaji elemen daftar berurutan dan kisi multi-kolom berbasis sliver pada Flutter. Berbeda dari `ListView` atau `GridView` biasa, kedua widget ini dirancang khusus untuk berada langsung di dalam `CustomScrollView` dan menggunakan algoritma *lazy rendering* (pemuatan tunda saat terlihat saja) untuk menghemat memori saat merender dataset akademik masif.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `delegate` | `SliverChildDelegate` | **(WAJIB)** Pengelola pembuatan anak widget (`SliverChildBuilderDelegate` atau `SliverChildListDelegate`). |
| `gridDelegate` | `SliverGridDelegate` | **(WAJIB untuk `SliverGrid`)** Menentukan aturan matriks kisi (misal `SliverGridDelegateWithFixedCrossAxisCount`). |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicSliverListGridApp());
}

class BasicSliverListGridApp extends StatelessWidget {
  const BasicSliverListGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(child: Center(child: Text('Grid $index'))),
                childCount: 4,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('List $index')),
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Dasbor Fitur Quick Access SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadSliverListGridApp());
}

class SiakadSliverListGridApp extends StatelessWidget {
  const SiakadSliverListGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const MenuSliverScreen(),
    );
  }
}

class MenuSliverScreen extends StatelessWidget {
  const MenuSliverScreen({super.key});

  final List<Map<String, dynamic>> _menuItems = const [
    {'title': 'KRS Online', 'icon': Icons.edit_calendar, 'color': Colors.blue},
    {'title': 'Nilai KHS', 'icon': Icons.grade, 'color': Colors.green},
    {'title': 'Presensi QR', 'icon': Icons.qr_code_scanner, 'color': Colors.orange},
    {'title': 'Jadwal Kuliah', 'icon': Icons.schedule, 'color': Colors.purple},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DASBOR UTAMA SIAKAD'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Akses Cepat Layanan Akademik', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = _menuItems[index];
                return Card(
                  elevation: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item['icon'] as IconData, size: 36, color: item['color'] as Color),
                      const SizedBox(height: 8),
                      Text(item['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              },
              childCount: _menuItems.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Riwayat Pengumuman Terbaru', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: const CircleAvatar(backgroundColor: Colors.indigo, child: Icon(Icons.campaign, color: Colors.white)),
                  title: Text('Pengumuman Registrasi Ulang #$index'),
                  subtitle: const Text('Batas Pembayaran UKT Semester Ganjil'),
                );
              },
              childCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
```
