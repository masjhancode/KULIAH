# Dokumentasi Widget: AnimatedBuilder

## 1. Penjelasan Singkat & Fungsi
Widget `AnimatedBuilder` mengisolasi animasi agar hanya membendung dan merender ulang (*rebuild*) komponen yang bergerak berdasarkan perubahan `Listenable` animasi, mengoptimalkan kinerja performa visual.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `animation` | `Listenable` | Objek pendengar animasi (seperti AnimationController) (wajib). |
| `builder` | `TransitionBuilder` | Callback fungsi perender `Widget Function(BuildContext, Widget? child)`. |
| `child` | `Widget?` | Sub-pohon widget anak statis yang diisi ke parameter child builder. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const AnimatedBuilderDemoApp());
}

class AnimatedBuilderDemoApp extends StatefulWidget {
  const AnimatedBuilderDemoApp({super.key});

  @override
  State<AnimatedBuilderDemoApp> createState() => _AnimatedBuilderDemoAppState();
}

class _AnimatedBuilderDemoAppState extends State<AnimatedBuilderDemoApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 2), vsync: this)..repeat();
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
        appBar: AppBar(title: const Text('Demo AnimatedBuilder')),
        body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(angle: _controller.value * 2.0 * math.pi, child: child);
            },
            child: const FlutterLogo(size: 80),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Indikator Rotasi Halus Sinkronisasi Status Verifikasi DPA)

```dart
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const DpaSyncAnimatedBuilderApp());
}

class DpaSyncAnimatedBuilderApp extends StatefulWidget {
  const DpaSyncAnimatedBuilderApp({super.key});

  @override
  State<DpaSyncAnimatedBuilderApp> createState() => _DpaSyncAnimatedBuilderAppState();
}

class _DpaSyncAnimatedBuilderAppState extends State<DpaSyncAnimatedBuilderApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this)..repeat();
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
        appBar: AppBar(title: const Text('Verifikasi DPA'), backgroundColor: Colors.indigo),
        body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2.0 * math.pi,
                child: child,
              );
            },
            child: const Icon(Icons.sync, size: 60, color: Colors.indigo),
          ),
        ),
      ),
    );
  }
}
```
