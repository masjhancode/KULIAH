# Dokumentasi Widget: SlideTransition

## 1. Penjelasan Singkat & Fungsi
Widget `SlideTransition` menganimasikan pergeseran koordinat vektor posisi `Offset` anak menggunakan `Animation<Offset>`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `position` | `Animation<Offset>` | Objek animasi pergeseran koordinat Offset (wajib). |
| `child` | `Widget` | Widget anak teranimasi. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SlideTransitionDemoApp());
}

class SlideTransitionDemoApp extends StatefulWidget {
  const SlideTransitionDemoApp({super.key});

  @override
  State<SlideTransitionDemoApp> createState() => _SlideTransitionDemoAppState();
}

class _SlideTransitionDemoAppState extends State<SlideTransitionDemoApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this)..forward();
    _offsetAnimation = Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(_controller);
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
        appBar: AppBar(title: const Text('Demo SlideTransition')),
        body: Center(
          child: SlideTransition(position: _offsetAnimation, child: const FlutterLogo(size: 100)),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Animasi Banner Peringatan SPP yang Meluncur Masuk)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SppSlideBannerApp());
}

class SppSlideBannerApp extends StatefulWidget {
  const SppSlideBannerApp({super.key});

  @override
  State<SppSlideBannerApp> createState() => _SppSlideBannerAppState();
}

class _SppSlideBannerAppState extends State<SppSlideBannerApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 700), vsync: this)..forward();
    _animation = Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
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
        appBar: AppBar(title: const Text('Dasbor Mahasiswa'), backgroundColor: Colors.indigo),
        body: SlideTransition(
          position: _animation,
          child: Container(
            color: Colors.amber,
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                Icon(Icons.payment),
                SizedBox(width: 12),
                Text('Batas Akhir Pembayaran SPP: 31 Agustus 2026', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
