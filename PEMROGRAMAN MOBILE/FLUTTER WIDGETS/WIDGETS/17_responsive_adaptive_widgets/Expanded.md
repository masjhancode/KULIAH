# Dokumentasi Widget: Expanded

## 1. Penjelasan Singkat & Fungsi
Widget `Expanded` memaksa anak dari `Row`, `Column`, atau `Flex` mengembang untuk mengisi seluruh sisa ruang kosong yang tersedia di sepanjang sumbu utama.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `flex` | `int` | Faktor pembagi rasio pembagian ruang relatif dibanding item Expanded lainnya (default: 1). |
| `child` | `Widget` | Widget anak penampung (wajib). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpandedDemoApp());
}

class ExpandedDemoApp extends StatelessWidget {
  const ExpandedDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Expanded')),
        body: Row(
          children: [
            Expanded(flex: 2, child: Container(color: Colors.red, child: const Center(child: Text('Flex 2')))),
            Expanded(flex: 1, child: Container(color: Colors.green, child: const Center(child: Text('Flex 1')))),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pembagian Proporsional Ruang Antara Kolom Kode dan Nama Matkul)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CourseRowExpandedApp());
}

class CourseRowExpandedApp extends StatelessWidget {
  const CourseRowExpandedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Daftar Mata Kuliah'), backgroundColor: Colors.indigo),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.indigo.shade100,
                        child: Text('IF2026_$index', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 3,
                      child: Text('Pemrograman Seluler Terapan Ke-$index', style: const TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
```
