# Dokumentasi Widget: FittedBox

## 1. Penjelasan Singkat & Fungsi
Widget `FittedBox` menyatukan dan menyesuaikan skala dimensi (*scaling*) widget anak agar dapat muat di dalam ruang kontainer yang tersedia tanpa mengalami *overflow*.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `fit` | `BoxFit` | Modus skala penyesuaian (contain, cover, fill, fitWidth, fitHeight, scaleDown) (default: BoxFit.contain). |
| `alignment` | `AlignmentGeometry` | Penjajaran posisi anak. |
| `clipBehavior` | `Clip` | Perilaku pemotongan batas. |
| `child` | `Widget` | Widget anak terukur. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FittedBoxDemoApp());
}

class FittedBoxDemoApp extends StatelessWidget {
  const FittedBoxDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FittedBox')),
        body: Center(
          child: Container(
            width: 150,
            height: 50,
            color: Colors.amber,
            child: const FittedBox(
              child: Text('Teks Panjang Yang Otomatis Pengecilan Skala'),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Penyesuaian Otomatis Teks Nama Mata Kuliah Panjang pada Baris Jadwal)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CourseTitleFittedBoxApp());
}

class CourseTitleFittedBoxApp extends StatelessWidget {
  const CourseTitleFittedBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Jadwal Ujian'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    color: Colors.indigo.shade50,
                    padding: const EdgeInsets.all(4),
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('Analisis dan Perancangan Sistem Informasi II', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text('Ruang LAB 03'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
