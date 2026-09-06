# Dokumentasi Widget: ConstrainedBox

## 1. Penjelasan Singkat & Fungsi
Widget `ConstrainedBox` digunakan untuk memberikan batasan ukuran tambahan berupa batas lebar dan tinggi minimum/maksimum (BoxConstraints) pada widget anaknya.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `constraints` | `BoxConstraints` | Batas dimensi minimum dan maksimum (minWidth, maxWidth, minHeight, maxHeight). |
| `child` | `Widget` | Widget turunan yang dibatasi ukurannya. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ConstrainedBoxDemoApp());
}

class ConstrainedBoxDemoApp extends StatelessWidget {
  const ConstrainedBoxDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ConstrainedBox Widget')),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 120,
              maxWidth: 200,
              minHeight: 48,
              maxHeight: 80,
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Tombol Berbatasan Ukuran'),
            ),
          ),
        ),
      ),
    );
  }
}
```
