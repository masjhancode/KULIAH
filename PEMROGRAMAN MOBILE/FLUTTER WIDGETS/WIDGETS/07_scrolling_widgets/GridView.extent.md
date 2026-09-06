# Dokumentasi Widget: GridView.extent

## 1. Penjelasan Singkat & Fungsi
Konstruktor `GridView.extent` membuat tata letak grid dengan menentukan batas ukuran lebar/tinggi maksimum (*maxCrossAxisExtent*) untuk setiap elemen.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `maxCrossAxisExtent` | `double` | Ukuran maksimum lebar/tinggi elemen pada sumbu silang. |
| `mainAxisSpacing` | `double` | Jarak spasi antar elemen pada sumbu utama. |
| `crossAxisSpacing` | `double` | Jarak spasi antar elemen pada sumbu silang. |
| `childAspectRatio` | `double` | Rasio perbandingan lebar terhadap tinggi setiap elemen. |
| `children` | `List<Widget>` | Daftar widget anak yang diposisikan di dalam grid. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const GridViewExtentDemoApp());
}

class GridViewExtentDemoApp extends StatelessWidget {
  const GridViewExtentDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo GridView.extent')),
        body: GridView.extent(
          maxCrossAxisExtent: 150,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          padding: const EdgeInsets.all(16),
          children: List.generate(
            8,
            (index) => Container(
              color: Colors.orange.shade100,
              child: Center(child: Text('Kartu ${index + 1}')),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Galeri Foto Kegiatan Organisasi Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const OrmawaGalleryApp());
}

class OrmawaGalleryApp extends StatelessWidget {
  const OrmawaGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Galeri Ormawa'),
          backgroundColor: Colors.indigo,
        ),
        body: GridView.extent(
          maxCrossAxisExtent: 160,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          padding: const EdgeInsets.all(12),
          children: List.generate(6, (index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: Icon(Icons.photo, size: 36, color: Colors.amber.shade800)),
            );
          }),
        ),
      ),
    );
  }
}
```
