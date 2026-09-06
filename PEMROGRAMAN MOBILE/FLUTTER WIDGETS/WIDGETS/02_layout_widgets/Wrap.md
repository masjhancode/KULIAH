# Dokumentasi Widget: Wrap

## 1. Penjelasan Singkat & Fungsi
Widget `Wrap` digunakan untuk menyusun anak-anaknya secara berurutan dan otomatis berpindah (*wrap*) ke baris atau kolom berikutnya jika ruang pada baris/kolom saat ini sudah penuh.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `children` | `List<Widget>` | Daftar widget turunan yang akan dideretkan. |
| `direction` | `Axis` | Arah utama penyusunan anak (Axis.horizontal atau Axis.vertical). |
| `spacing` | `double` | Jarak ruang kosong antar anak pada sumbu utama. |
| `runSpacing` | `double` | Jarak ruang kosong antar baris/kolom (run). |
| `alignment` | `WrapAlignment` | Perataan anak di dalam setiap baris (start, center, end, spaceBetween). |
| `runAlignment` | `WrapAlignment` | Perataan antar baris/kolom secara keseluruhan. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const WrapDemoApp());
}

class WrapDemoApp extends StatelessWidget {
  const WrapDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Wrap Widget')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            alignment: WrapAlignment.start,
            children: const [
              Chip(label: Text('Pemrograman Flutter')),
              Chip(label: Text('Basis Data')),
              Chip(label: Text('Jaringan Komputer')),
              Chip(label: Text('Kecerdasan Buatan')),
              Chip(label: Text('Keamanan Siber')),
            ],
          ),
        ),
      ),
    );
  }
}
```
