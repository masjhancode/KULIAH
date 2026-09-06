# Dokumentasi Widget: Column

## 1. Penjelasan Singkat & Fungsi
Widget `Column` digunakan untuk menyusun daftar widget turunan (*children*) secara berurutan pada sumbu vertikal (atas ke bawah).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `children` | `List<Widget>` | Daftar widget turunan yang disusun secara vertikal. |
| `mainAxisAlignment` | `MainAxisAlignment` | Mengatur perataan posisi anak pada sumbu utama vertikal (start, center, end, spaceBetween, spaceAround, spaceEvenly). |
| `crossAxisAlignment` | `CrossAxisAlignment` | Mengatur perataan posisi anak pada sumbu silang horizontal (start, center, end, stretch). |
| `mainAxisSize` | `MainAxisSize` | Menentukan seberapa besar ruang sumbu utama yang diambil oleh Column (max atau min). |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ColumnDemoApp());
}

class ColumnDemoApp extends StatelessWidget {
  const ColumnDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Column Widget')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Profil Mahasiswa', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('NIM: 2026090123'),
              Text('Program Studi: Pemrograman Seluler'),
            ],
          ),
        ),
      ),
    );
  }
}
```
