# Dokumentasi Widget: Row

## 1. Penjelasan Singkat & Fungsi
Widget `Row` digunakan untuk menyusun daftar widget turunan (*children*) secara berurutan pada sumbu horizontal (kiri ke kanan).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `children` | `List<Widget>` | Daftar widget turunan yang disusun secara horizontal. |
| `mainAxisAlignment` | `MainAxisAlignment` | Mengatur perataan posisi anak pada sumbu utama horizontal (start, center, end, spaceBetween, spaceAround, spaceEvenly). |
| `crossAxisAlignment` | `CrossAxisAlignment` | Mengatur perataan posisi anak pada sumbu silang vertikal (start, center, end, stretch, baseline). |
| `mainAxisSize` | `MainAxisSize` | Menentukan seberapa besar ruang sumbu utama yang diambil oleh Row (max atau min). |
| `textDirection` | `TextDirection` | Arah penyusunan urutan anak (left-to-right atau right-to-left). |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RowDemoApp());
}

class RowDemoApp extends StatelessWidget {
  const RowDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Row Widget')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.school, color: Colors.indigo),
              Text('Teknik Informatika', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Chip(label: Text('Aktif')),
            ],
          ),
        ),
      ),
    );
  }
}
```
