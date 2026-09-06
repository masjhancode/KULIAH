# Dokumentasi Widget: Center

## 1. Penjelasan Singkat & Fungsi
Widget `Center` digunakan untuk menempatkan widget anaknya tepat di titik tengah (tengah horizontal dan vertikal) dari area ruang wadah induknya.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget turunan yang diposisikan tepat di titik pusat area. |
| `widthFactor` | `double` | Faktor pengali lebar child untuk menentukan lebar Center. |
| `heightFactor` | `double` | Faktor pengali tinggi child untuk menentukan tinggi Center. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CenterDemoApp());
}

class CenterDemoApp extends StatelessWidget {
  const CenterDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Center Widget')),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
```
