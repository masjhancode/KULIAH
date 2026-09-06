# Dokumentasi Widget: FittedBox

## 1. Penjelasan Singkat & Fungsi
Widget `FittedBox` digunakan untuk menskalakan (scale) dan memosisikan anak agar pas muat di dalam area ruang yang tersedia tanpa mengalami overflow.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `fit` | `BoxFit` | Strategi penskalaan ukuran child (contain, cover, fill, scaleDown). |
| `alignment` | `AlignmentGeometry` | Posisi perataan child di dalam area wadah FittedBox. |
| `child` | `Widget` | Widget turunan yang akan diskalakan ukurannya. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FittedBoxDemoApp());
}

class FittedBoxDemoApp extends StatelessWidget {
  const FittedBoxDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FittedBox Widget')),
        body: Center(
          child: Container(
            width: 150,
            height: 40,
            color: Colors.amber.shade100,
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Teks Panjang Yang Otomatis Menyesuaikan Skala',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
