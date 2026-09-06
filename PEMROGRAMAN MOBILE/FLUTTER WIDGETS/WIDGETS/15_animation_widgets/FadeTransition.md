# Dokumentasi Widget: FadeTransition

## 1. Penjelasan Singkat & Fungsi
Widget `FadeTransition` menganimasikan transparansi opacity dari widget anak menggunakan pengontrol `Animation<double>` eksplisit.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `opacity` | `Animation<double>` | Objek animasi nilai transparansi (wajib). |
| `child` | `Widget` | Widget anak teranimasi. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FadeTransitionDemoApp());
}

class FadeTransitionDemoApp extends StatefulWidget {
  const FadeTransitionDemoApp({super.key});

  @override
  State<FadeTransitionDemoApp> createState() => _FadeTransitionDemoAppState();
}

class _FadeTransitionDemoAppState extends State<FadeTransitionDemoApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this)..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
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
        appBar: AppBar(title: const Text('Demo FadeTransition')),
        body: Center(
          child: FadeTransition(opacity: _animation, child: const FlutterLogo(size: 100)),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Animasi Kemunculan Pengumuman Kelulusan Skripsi)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SkripsiFadeApp());
}

class SkripsiFadeApp extends StatefulWidget {
  const SkripsiFadeApp({super.key});

  @override
  State<SkripsiFadeApp> createState() => _SkripsiFadeAppState();
}

class _SkripsiFadeAppState extends State<SkripsiFadeApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this)..forward();
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
        appBar: AppBar(title: const Text('Hasil Sidang Skripsi'), backgroundColor: Colors.indigo),
        body: Center(
          child: FadeTransition(
            opacity: _controller,
            child: Card(
              color: Colors.green.shade100,
              child: const Padding(
                padding: EdgeInsets.all(24.0),
                child: Text('SELAMAT! SIDANG SKRIPSI DINATAKAN LULUS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
