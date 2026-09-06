# Dokumentasi Widget: SizedBox

## 1. Penjelasan Singkat & Fungsi
Widget `SizedBox` digunakan untuk memberikan batasan dimensi ukuran (lebar dan tinggi) yang konstan pada komponen anak, atau dipakai sebagai pemisah jarak (spacing) antar widget.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `width` | `double` | Ukuran lebar pasti dalam piksel logis. |
| `height` | `double` | Ukuran tinggi pasti dalam piksel logis. |
| `child` | `Widget` | Widget turunan yang dipaksa mengikuti dimensi lebar dan tinggi SizedBox. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SizedBoxDemoApp());
}

class SizedBoxDemoApp extends StatelessWidget {
  const SizedBoxDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo SizedBox Widget')),
        body: Column(
          children: const [
            ElevatedButton(onPressed: null, child: Text('Tombol A')),
            SizedBox(height: 16), // Jarak vertikal 16 piksel
            ElevatedButton(onPressed: null, child: Text('Tombol B')),
          ],
        ),
      ),
    );
  }
}
```
