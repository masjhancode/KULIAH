# Dokumentasi Widget: Icon

## 1. Penjelasan Singkat & Fungsi
Widget `Icon` digunakan untuk menampilkan simbol atau grafik vektor glyph dari pustaka ikon (seperti Material Icons) guna memperjelas navigasi, aksi, dan indikator status.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `icon` | `IconData` | Simbol ikon yang akan ditampilkan (misal Icons.school). |
| `size` | `double` | Ukuran tinggi dan lebar ikon dalam piksel logis. |
| `color` | `Color` | Warna visual pewarnaan ikon. |
| `semanticLabel` | `String` | Teks deskripsi aksesibilitas bagi pengguna pembaca layar. |
| `shadows` | `List<Shadow>` | Daftar efek bayangan yang diterapkan pada grafik ikon. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const IconDemoApp());
}

class IconDemoApp extends StatelessWidget {
  const IconDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Icon Widget')),
        body: const Center(
          child: Icon(
            Icons.school,
            size: 64,
            color: Colors.indigo,
            semanticLabel: 'Ikon Pendidikan',
          ),
        ),
      ),
    );
  }
}
```
