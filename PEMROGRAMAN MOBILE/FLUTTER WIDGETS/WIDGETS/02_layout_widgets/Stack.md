# Dokumentasi Widget: Stack

## 1. Penjelasan Singkat & Fungsi
Widget `Stack` digunakan untuk menumpuk beberapa widget turunan secara berlapis (satu di atas yang lain) di dalam koordinat sumbu-z.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `children` | `List<Widget>` | Daftar widget turunan yang ditumpuk dari urutan terbawah ke teratas. |
| `alignment` | `AlignmentGeometry` | Perataan default untuk anak yang tidak diposisikan secara eksplisit. |
| `fit` | `StackFit` | Strategi penyesuaian ukuran anak yang tidak diposisikan (loose, expand, passthrough). |
| `clipBehavior` | `Clip` | Perilaku pemotongan jika anak meluap keluar dari batas area Stack. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const StackDemoApp());
}

class StackDemoApp extends StatelessWidget {
  const StackDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Stack Widget')),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.blue.shade100,
              ),
              const Positioned(
                top: 16,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 12,
                  child: Text('3', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
              const Text('Kartu Akademik'),
            ],
          ),
        ),
      ),
    );
  }
}
```
