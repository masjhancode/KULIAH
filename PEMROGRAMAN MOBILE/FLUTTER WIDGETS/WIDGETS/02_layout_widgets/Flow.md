# Dokumentasi Widget: Flow

## 1. Penjelasan Singkat & Fungsi
Widget `Flow` digunakan untuk mengatur posisi dan ukuran anak-anaknya secara efisien menggunakan transformasi matriks (*matrix transformation*) melalui `FlowDelegate` kustom.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `delegate` | `FlowDelegate` | Objek delegate kustom yang mengontrol tata letak dan transformasi anak. |
| `children` | `List<Widget>` | Daftar widget turunan yang diposisikan oleh delegate. |
| `clipBehavior` | `Clip` | Perilaku pemotongan jika anak melebihi batas area wadah Flow. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FlowDemoApp());
}

class FlowDemoApp extends StatelessWidget {
  const FlowDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Flow Widget')),
        body: Flow(
          delegate: SimpleFlowDelegate(),
          children: [
            IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            IconButton(icon: const Icon(Icons.home), onPressed: () {}),
            IconButton(icon: const Icon(Icons.person), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class SimpleFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 16.0;
    for (int i = 0; i < context.childCount; i++) {
      context.paintChild(i, transform: Matrix4.translationValues(x, 16.0, 0.0));
      x += (context.getChildSize(i)?.width ?? 0) + 16.0;
    }
  }

  @override
  bool shouldRepaint(covariant SimpleFlowDelegate oldDelegate) => false;
}
```
