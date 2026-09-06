# Dokumentasi Widget: Padding

## 1. Penjelasan Singkat & Fungsi
Widget `Padding` digunakan untuk memberikan jarak/ruang kosong internal (inset) di sekeliling widget anaknya agar tidak menempel pada batas wadah atau layar.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `padding` | `EdgeInsetsGeometry` | Besar jarak inset pada sisi-sisi (EdgeInsets.all, symmetric, only). |
| `child` | `Widget` | Widget turunan yang dibungkus oleh ruang padding. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PaddingDemoApp());
}

class PaddingDemoApp extends StatelessWidget {
  const PaddingDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Padding Widget')),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text('Konten dengan jarak batas internal 20px'),
        ),
      ),
    );
  }
}
```
