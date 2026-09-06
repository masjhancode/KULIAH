# Dokumentasi Widget: FlutterLogo

## 1. Penjelasan Singkat & Fungsi
Widget `FlutterLogo` digunakan untuk menampilkan logo resmi kerangka kerja Flutter pada halaman tentang aplikasi, splash screen, atau indikator teknologi pendukung.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `size` | `double` | Ukuran dimensi lebar dan tinggi logo dalam piksel logis. |
| `style` | `FlutterLogoStyle` | Tipe gaya tampilan logo (markOnly, horizontal, stacked). |
| `textColor` | `Color` | Warna teks kata Flutter jika menggunakan gaya horizontal/stacked. |
| `duration` | `Duration` | Durasi transisi animasi jika properti logo berubah. |
| `curve` | `Curve` | Kurva kecepatan transisi perubahan gaya logo. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterLogoDemoApp());
}

class FlutterLogoDemoApp extends StatelessWidget {
  const FlutterLogoDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FlutterLogo Widget')),
        body: const Center(
          child: FlutterLogo(
            size: 100,
            style: FlutterLogoStyle.horizontal,
            textColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
```
