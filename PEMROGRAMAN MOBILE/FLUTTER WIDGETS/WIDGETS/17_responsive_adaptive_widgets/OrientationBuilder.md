# Dokumentasi Widget: OrientationBuilder

## 1. Penjelasan Singkat & Fungsi
Widget `OrientationBuilder` membangun tata letak antarmuka yang dinamis berdasarkan status perubahan orientasi perangkat (*portrait* atau *landscape*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `builder` | `Widget Function(BuildContext, Orientation)` | Callback pembuat widget yang menerima konteks dan enum status Orientation (portrait atau landscape). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const OrientationBuilderDemoApp());
}

class OrientationBuilderDemoApp extends StatelessWidget {
  const OrientationBuilderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo OrientationBuilder')),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return Center(
              child: Text(
                'Orientasi: ${orientation == Orientation.portrait ? "Portrait" : "Landscape"}',
                style: const TextStyle(fontSize: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tampilan Split Screen Video Perkuliahan & Catatan dalam Mode Landscape)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const LectureVideoOrientationApp());
}

class LectureVideoOrientationApp extends StatelessWidget {
  const LectureVideoOrientationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Ruang Kuliah Online'), backgroundColor: Colors.indigo),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return Row(
                children: [
                  Expanded(child: Container(color: Colors.black, child: const Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 64)))),
                  Expanded(child: Container(color: Colors.indigo.shade50, child: const Center(child: Text('Catatan & Diskusi Kuliah')))),
                ],
              );
            } else {
              return Column(
                children: [
                  Container(height: 220, color: Colors.black, child: const Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 64))),
                  Expanded(child: Container(color: Colors.indigo.shade50, child: const Center(child: Text('Catatan & Diskusi Kuliah')))),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
```
