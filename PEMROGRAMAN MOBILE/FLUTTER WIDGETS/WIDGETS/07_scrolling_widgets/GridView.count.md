# Dokumentasi Widget: GridView.count

## 1. Penjelasan Singkat & Fungsi
Konstruktor `GridView.count` membuat tata letak grid dengan menentukan jumlah tetap kolom (*crossAxisCount*) pada sumbu silang.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `crossAxisCount` | `int` | Jumlah kolom tetap pada sumbu silang. |
| `mainAxisSpacing` | `double` | Jarak spasi antar elemen pada sumbu utama (vertikal). |
| `crossAxisSpacing` | `double` | Jarak spasi antar elemen pada sumbu silang (horizontal). |
| `childAspectRatio` | `double` | Rasio perbandingan lebar terhadap tinggi setiap elemen grid. |
| `children` | `List<Widget>` | Daftar widget anak yang dimasukkan ke dalam grid. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const GridViewCountDemoApp());
}

class GridViewCountDemoApp extends StatelessWidget {
  const GridViewCountDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo GridView.count')),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          padding: const EdgeInsets.all(16),
          children: List.generate(
            9,
            (index) => Card(
              color: Colors.teal.shade100,
              child: Center(child: Text('Menu ${index + 1}')),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Katalog E-Book Perpustakaan Kampus)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const LibraryCatalogApp());
}

class LibraryCatalogApp extends StatelessWidget {
  const LibraryCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Katalog E-Book Kampus'),
          backgroundColor: Colors.indigo,
        ),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
          padding: const EdgeInsets.all(12),
          children: List.generate(6, (index) {
            return Card(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.indigo.shade50,
                      child: const Center(child: Icon(Icons.book, size: 40, color: Colors.indigo)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Buku #${index + 1}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
```
