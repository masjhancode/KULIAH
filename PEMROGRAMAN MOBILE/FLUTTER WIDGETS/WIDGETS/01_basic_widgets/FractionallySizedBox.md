# Dokumentasi Widget: FractionallySizedBox

## 1. Penjelasan Singkat & Fungsi
Widget `FractionallySizedBox` digunakan untuk menentukan ukuran lebar dan/atau tinggi child berdasarkan persentase atau fraksi proporsi dari wadah induk.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `widthFactor` | `double` | Fraksi persentase lebar dari induk (misal 0.8 untuk 80%). |
| `heightFactor` | `double` | Fraksi persentase tinggi dari induk (misal 0.5 untuk 50%). |
| `alignment` | `AlignmentGeometry` | Posisi perataan child di dalam wadah FractionallySizedBox. |
| `child` | `Widget` | Widget turunan yang ukurannya disesuaikan secara proporsional. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FractionallySizedBoxDemoApp());
}

class FractionallySizedBoxDemoApp extends StatelessWidget {
  const FractionallySizedBoxDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FractionallySizedBox Widget')),
        body: Center(
          child: Container(
            width: 300,
            height: 150,
            color: Colors.grey.shade200,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.5,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('80% Lebar x 50% Tinggi'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
