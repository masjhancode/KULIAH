# Dokumentasi Widget: AspectRatio

## 1. Penjelasan Singkat & Fungsi
Widget `AspectRatio` digunakan untuk memaksa perbandingan rasio antara lebar (width) dan tinggi (height) pada widget anaknya.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `aspectRatio` | `double` | Nilai perbandingan rasio lebar terhadap tinggi (misal 16/9, 4/3, 1.0). |
| `child` | `Widget` | Widget turunan yang rasionya dikunci. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AspectRatioDemoApp());
}

class AspectRatioDemoApp extends StatelessWidget {
  const AspectRatioDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo AspectRatio Widget')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.deepOrangeAccent,
              child: const Center(
                child: Text('Wadah Berasio 16:9', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
