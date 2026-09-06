# Dokumentasi Widget: SizeTransition

## 1. Penjelasan Singkat & Fungsi
Widget `SizeTransition` menganimasikan ekspansi clipping dimensi ukuran anak secara bertahap menggunakan `Animation<double>`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `sizeFactor` | `Animation<double>` | Objek animasi rasio faktor ekspansi ukuran (wajib). |
| `axis` | `Axis` | Sumbu ekspansi (Axis.vertical atau Axis.horizontal). |
| `child` | `Widget` | Widget anak teranimasi. |
| `axisAlignment` | `double` | Titik tumpu penjajaran ekspansi sumbu. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SizeTransitionDemoApp());
}

class SizeTransitionDemoApp extends StatefulWidget {
  const SizeTransitionDemoApp({super.key});

  @override
  State<SizeTransitionDemoApp> createState() => _SizeTransitionDemoAppState();
}

class _SizeTransitionDemoAppState extends State<SizeTransitionDemoApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this)..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo SizeTransition')),
        body: Center(
          child: SizeTransition(
            sizeFactor: _controller,
            axis: Axis.vertical,
            child: Container(width: 200, height: 100, color: Colors.indigo),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Animasi Membuka Lembar Accordion Silabus Mata Kuliah)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SyllabusSizeTransitionApp());
}

class SyllabusSizeTransitionApp extends StatefulWidget {
  const SyllabusSizeTransitionApp({super.key});

  @override
  State<SyllabusSizeTransitionApp> createState() => _SyllabusSizeTransitionAppState();
}

class _SyllabusSizeTransitionAppState extends State<SyllabusSizeTransitionApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Silabus Kuliah'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                title: const Text('Pertemuan 1: Pengenalan Flutter'),
                trailing: IconButton(
                  icon: const Icon(Icons.expand_more),
                  onPressed: () {
                    if (_controller.isCompleted) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                  },
                ),
              ),
              SizeTransition(
                sizeFactor: _controller,
                axis: Axis.vertical,
                child: Container(
                  color: Colors.indigo.shade50,
                  padding: const EdgeInsets.all(16),
                  child: const Text('Materi memuat pengenalan Widget, State, dan Tata Letak Dasar dalam Flutter SDK.'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
