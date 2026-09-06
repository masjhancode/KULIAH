# Dokumentasi Widget: PositionedTransition

## 1. Penjelasan Singkat & Fungsi
Widget `PositionedTransition` merupakan versi teranimasi dari `Positioned` di dalam `Stack` yang dikendalikan oleh `Animation<RelativeRect>`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `rect` | `Animation<RelativeRect>` | Objek animasi persegi batas posisi relatif terhadap Stack (wajib). |
| `child` | `Widget` | Widget anak teranimasi. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PositionedTransitionDemoApp());
}

class PositionedTransitionDemoApp extends StatefulWidget {
  const PositionedTransitionDemoApp({super.key});

  @override
  State<PositionedTransitionDemoApp> createState() => _PositionedTransitionDemoAppState();
}

class _PositionedTransitionDemoAppState extends State<PositionedTransitionDemoApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _rectAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this)..repeat(reverse: true);
    _rectAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(10, 10, 10, 10),
      end: const RelativeRect.fromLTRB(100, 100, 100, 100),
    ).animate(_controller);
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
        appBar: AppBar(title: const Text('Demo PositionedTransition')),
        body: Stack(
          children: [
            PositionedTransition(rect: _rectAnimation, child: Container(color: Colors.indigo)),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Animasi Pergerakan Pin Ruang Ujian pada Peta Kampus)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ExamPinTransitionApp());
}

class ExamPinTransitionApp extends StatefulWidget {
  const ExamPinTransitionApp({super.key});

  @override
  State<ExamPinTransitionApp> createState() => _ExamPinTransitionAppState();
}

class _ExamPinTransitionAppState extends State<ExamPinTransitionApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _pinAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this)..forward();
    _pinAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(20, 20, 200, 400),
      end: const RelativeRect.fromLTRB(150, 200, 50, 100),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
        appBar: AppBar(title: const Text('Navigasi Ruang Ujian'), backgroundColor: Colors.indigo),
        body: Stack(
          children: [
            Container(color: Colors.grey.shade200, child: const Center(child: Text('Peta Lantai Gedung A'))),
            PositionedTransition(
              rect: _pinAnimation,
              child: const Icon(Icons.location_on, size: 48, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
```
