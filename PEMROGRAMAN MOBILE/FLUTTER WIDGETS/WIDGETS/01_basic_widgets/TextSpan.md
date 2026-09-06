# Dokumentasi Widget: TextSpan

## 1. Penjelasan Singkat & Fungsi
`TextSpan` merupakan objek `InlineSpan` immutable yang merepresentasikan segmen teks beserta atribut gaya visualnya. Digunakan di dalam widget `RichText` atau `Text.rich` untuk membentuk paragraf kaya format.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `text` | `String` | Potongan string teks untuk segmen spesifik. |
| `style` | `TextStyle` | Gaya visual khusus yang diterapkan pada segmen teks ini. |
| `children` | `List<InlineSpan>` | Daftar segmen TextSpan turunan yang mewarisi atau menimpa style induk. |
| `recognizer` | `GestureRecognizer` | Penangan interaksi sentuhan (misal TapGestureRecognizer) pada segmen teks. |
| `semanticsLabel` | `String` | Label aksesibilitas untuk pembaca layar bagi penyandang disabilitas. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TextSpanDemoApp());
}

class TextSpanDemoApp extends StatelessWidget {
  const TextSpanDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo TextSpan Class')),
        body: Center(
          child: Text.rich(
            TextSpan(
              text: 'Setuju dengan ',
              children: [
                TextSpan(
                  text: 'Syarat & Ketentuan',
                  style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
