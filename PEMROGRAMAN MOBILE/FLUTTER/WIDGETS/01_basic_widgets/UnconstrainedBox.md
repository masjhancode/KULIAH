# Dokumentasi Widget: UnconstrainedBox

## 1. Penjelasan Singkat & Fungsi
Widget `UnconstrainedBox` digunakan untuk menghilangkan batasan dari wadah induk sehingga widget anak dapat dirender sesuai dengan ukuran aslinya (intrinsic size).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget turunan yang dibebaskan dari kendala ukuran induk. |
| `alignment` | `AlignmentGeometry` | Posisi perataan child di dalam UnconstrainedBox. |
| `constrainedAxis` | `Axis` | Sumbu yang tetap diberi batasan (Axis.horizontal atau Axis.vertical). |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const UnconstrainedBoxDemoApp());
}

class UnconstrainedBoxDemoApp extends StatelessWidget {
  const UnconstrainedBoxDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo UnconstrainedBox Widget')),
        body: Container(
          width: 150,
          height: 100,
          color: Colors.blue.shade100,
          child: const UnconstrainedBox(
            child: ElevatedButton(
              onPressed: null,
              child: Text('Ukuran Alami Tombol'),
            ),
          ),
        ),
      ),
    );
  }
}
```
