# Dokumentasi Widget: Container

## 1. Penjelasan Singkat & Fungsi
Widget `Container` digunakan sebagai wadah serbaguna yang mengombinasikan penataan ukuran, dekorasi visual (warna latar, border, radius, shadow), margin, padding, dan perataan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Komponen anak tunggal yang dibungkus di dalam wadah. |
| `padding` | `EdgeInsetsGeometry` | Jarak internal antara batas wadah dengan komponen child. |
| `margin` | `EdgeInsetsGeometry` | Jarak eksternal antara batas wadah dengan elemen di luar. |
| `decoration` | `Decoration` | Objek BoxDecoration untuk warna latar, border, radius, dan shadow. |
| `width` | `double` | Lebar konstan wadah dalam piksel logis. |
| `height` | `double` | Tinggi konstan wadah dalam piksel logis. |
| `alignment` | `AlignmentGeometry` | Posisi perataan child di dalam wadah Container. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ContainerDemoApp());
}

class ContainerDemoApp extends StatelessWidget {
  const ContainerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Container Widget')),
        body: Center(
          child: Container(
            width: 250,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.indigo),
            ),
            child: const Text('Kartu Informasi Akademik'),
          ),
        ),
      ),
    );
  }
}
```
