# Dokumentasi Widget: Placeholder

## 1. Penjelasan Singkat & Fungsi
Widget `Placeholder` digunakan sebagai penanda area sementara (wireframe/dummy) dengan visualisasi kotak bersilang garis diagonal pada tahap perancangan antarmuka.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `color` | `Color` | Warna garis silang pembentuk placeholder. |
| `strokeWidth` | `double` | Ketebalan garis silang placeholder. |
| `fallbackWidth` | `double` | Lebar default jika wadah induk tidak memberikan batasan lebar. |
| `fallbackHeight` | `double` | Tinggi default jika wadah induk tidak memberikan batasan tinggi. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PlaceholderDemoApp());
}

class PlaceholderDemoApp extends StatelessWidget {
  const PlaceholderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Placeholder Widget')),
        body: const Center(
          child: SizedBox(
            width: 200,
            height: 150,
            child: Placeholder(
              color: Colors.blueGrey,
              strokeWidth: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
```
