# Dokumentasi Widget: SliverToBoxAdapter

## 1. Deskripsi & Fungsi Modul

Widget `SliverToBoxAdapter` merupakan pengadaptasi khusus pada Flutter yang menjembatani widget berbasis kotak standar (*box-based widget* seperti `Container`, `Card`, `Padding`, atau `ElevatedButton`) agar dapat dimasukkan secara sah ke dalam daftar `slivers` di `CustomScrollView`. Widget ini digunakan saat kita ingin menyelipkan spanduk pengumuman tunggal, ringkasan IPK, atau tombol aksi di antara `SliverAppBar` dan `SliverList`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget?` | Widget kotak standar (*render box*) yang ingin diadaptasikan menjadi elemen sliver. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicSliverToBoxAdapterApp());
}

class BasicSliverToBoxAdapterApp extends StatelessWidget {
  const BasicSliverToBoxAdapterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(title: Text('Basic Adapter')),
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                color: Colors.amber,
                child: const Center(child: Text('Widget Kotak Standar di Dalam Slivers')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Banner Pengumuman Darurat SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadAdapterApp());
}

class SiakadAdapterApp extends StatelessWidget {
  const SiakadAdapterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adapter SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const AdapterHomeScreen(),
    );
  }
}

class AdapterHomeScreen extends StatelessWidget {
  const AdapterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('INFORMASI KAMPUS'),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red),
              ),
              child: Row(
                children: const [
                  Icon(Icons.warning, color: Colors.red),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'PENTING: Batas Pengisian KRS Berakhir Hari Ini pukul 23.59 WIB!',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Pengumuman Tambahan #$index'),
              ),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
```
