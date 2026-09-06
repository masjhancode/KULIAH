# Dokumentasi Widget: AnimatedSize

## 1. Penjelasan Singkat & Fungsi
Widget `AnimatedSize` menganimasikan perubahan dimensi fisik (lebar dan tinggi) dari anak secara otomatis saat ukurannya berubah.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `duration` | `Duration` | Durasi waktu penyesuaian ukuran (wajib). |
| `curve` | `Curve` | Kurva kecepatan animasi. |
| `child` | `Widget` | Widget anak teranimasi. |
| `alignment` | `AlignmentGeometry` | Titik tumpu ekspansi ukuran. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedSizeDemoApp());
}

class AnimatedSizeDemoApp extends StatefulWidget {
  const AnimatedSizeDemoApp({super.key});

  @override
  State<AnimatedSizeDemoApp> createState() => _AnimatedSizeDemoAppState();
}

class _AnimatedSizeDemoAppState extends State<AnimatedSizeDemoApp> {
  bool _large = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo AnimatedSize')),
        body: Center(
          child: GestureDetector(
            onTap: () => setState(() => _large = !_large),
            child: AnimatedSize(
              duration: const Duration(seconds: 1),
              child: Container(
                color: Colors.indigo,
                width: _large ? 200 : 100,
                height: _large ? 200 : 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Ekspansi Rincian Nilai Komponen Matkul Mengembang Halus)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const GradeDetailExpandApp());
}

class GradeDetailExpandApp extends StatefulWidget {
  const GradeDetailExpandApp({super.key});

  @override
  State<GradeDetailExpandApp> createState() => _GradeDetailExpandAppState();
}

class _GradeDetailExpandAppState extends State<GradeDetailExpandApp> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Rincian Nilai'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: InkWell(
              onTap: () => setState(() => _expanded = !_expanded),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pemrograman Seluler', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Nilai Akhir: A', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      child: _expanded
                          ? const Column(
                              children: [
                                Divider(),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Tugas: 90'), Text('UTS: 85'), Text('UAS: 88')]),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
