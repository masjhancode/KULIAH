# Dokumentasi Widget: Align

## 1. Penjelasan Singkat & Fungsi
Widget `Align` digunakan untuk menempatkan widget anaknya di lokasi posisi spesifik (seperti kanan-atas, kiri-bawah, tengah-kanan) di dalam area induknya.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `alignment` | `AlignmentGeometry` | Posisi perataan (Alignment.topRight, Alignment.bottomLeft, dsb). |
| `child` | `Widget` | Widget turunan yang diposisikan. |
| `widthFactor` | `double` | Faktor pengali lebar child terhadap wadah Align. |
| `heightFactor` | `double` | Faktor pengali tinggi child terhadap wadah Align. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AlignDemoApp());
}

class AlignDemoApp extends StatelessWidget {
  const AlignDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Align Widget')),
        body: Container(
          width: 200,
          height: 100,
          color: Colors.grey.shade300,
          child: const Align(
            alignment: Alignment.bottomRight,
            child: Text('Kanan Bawah'),
          ),
        ),
      ),
    );
  }
}
```
