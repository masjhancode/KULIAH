# Dokumentasi Widget: LimitedBox

## 1. Penjelasan Singkat & Fungsi
Widget `LimitedBox` digunakan untuk membatasi ukuran maksimum child hanya ketika berada di dalam wadah tanpa kendala ukuran (seperti ListView).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `maxHeight` | `double` | Batas tinggi maksimum jika kendala tinggi induk bernilai double.infinity. |
| `maxWidth` | `double` | Batas lebar maksimum jika kendala lebar induk bernilai double.infinity. |
| `child` | `Widget` | Widget turunan yang dibatasi ukurannya saat berada di ruang tak terbatas. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const LimitedBoxDemoApp());
}

class LimitedBoxDemoApp extends StatelessWidget {
  const LimitedBoxDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo LimitedBox Widget')),
        body: ListView(
          children: const [
            LimitedBox(
              maxHeight: 100,
              child: Card(
                child: Center(child: Text('Item Terbatas Tinggi 100px')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
