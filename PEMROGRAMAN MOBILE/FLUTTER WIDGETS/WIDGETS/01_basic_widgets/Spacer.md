# Dokumentasi Widget: Spacer

## 1. Penjelasan Singkat & Fungsi
Widget `Spacer` digunakan di dalam Row atau Column untuk menyisipkan ruang kosong fleksibel yang dapat mengembang mendorong widget di sekitarnya sejauh mungkin.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `flex` | `int` | Faktor fleksibilitas pembagian sisa ruang kosong (default: 1). |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SpacerDemoApp());
}

class SpacerDemoApp extends StatelessWidget {
  const SpacerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Spacer Widget')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: const [
              Text('Kiri'),
              Spacer(), // Mendorong teks Kiri ke paling kiri dan Kanan ke paling kanan
              Text('Kanan'),
            ],
          ),
        ),
      ),
    );
  }
}
```
