# Dokumentasi Widget: SliverAppBar

## 1. Deskripsi & Fungsi Modul

Widget `SliverAppBar` merupakan bilah navigasi atas khusus berbasis sliver pada Flutter yang dapat membesar (*expand*), mengecil (*collapse*), atau melayang (*float*) secara dinamis sesuai pergeseran gulir layar. Widget ini umumnya dilengkapi dengan `FlexibleSpaceBar` untuk menampilkan gambar sampul profil kampus atau spanduk pengumuman yang menyusut menjadi `AppBar` standar saat digulir ke bawah.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `expandedHeight` | `double?` | Ketinggian maksimal bilah navigasi saat posisi gulir berada paling atas. |
| `pinned` | `bool` | Jika `true`, bilah navigasi akan tetap terkunci di bagian atas layar meskipun halaman digulir. |
| `floating` | `bool` | Jika `true`, bilah navigasi akan langsung muncul kembali begitu layar digulir sedikit ke atas. |
| `snap` | `bool` | Jika `true` (bersama `floating: true`), bilah navigasi akan langsung terbuka penuh secara otomatis. |
| `flexibleSpace` | `Widget?` | Widget latar belakang fleksibel (biasanya `FlexibleSpaceBar`) yang memberikan efek animasi susut. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicSliverAppBarApp());
}

class BasicSliverAppBarApp extends StatelessWidget {
  const BasicSliverAppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Basic SliverAppBar'),
                background: Image.network(
                  'https://via.placeholder.com/500x200',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Baris ke-$index')),
                childCount: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Header Collapsing Sampul Kampus SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadCollapsingHeaderApp());
}

class SiakadCollapsingHeaderApp extends StatelessWidget {
  const SiakadCollapsingHeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Header Collapsing SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const CollapsingHeaderScreen(),
    );
  }
}

class CollapsingHeaderScreen extends StatelessWidget {
  const CollapsingHeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220.0,
            pinned: true,
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            actions: [
              IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('PORTAL MAHASISWA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.blueAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_balance, size: 60, color: Colors.white),
                      SizedBox(height: 8),
                      Text('SIAKAD Universitas Utama', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.announcement, color: Colors.indigo),
                  title: Text('Pengumuman Akademik #$index'),
                  subtitle: const Text('Diunggah oleh Biro Akademik Kampus'),
                ),
              ),
              childCount: 12,
            ),
          ),
        ],
      ),
    );
  }
}
```
