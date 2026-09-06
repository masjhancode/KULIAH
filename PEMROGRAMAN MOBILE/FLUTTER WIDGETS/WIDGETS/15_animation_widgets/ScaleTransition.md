# Dokumentasi Widget: ScaleTransition

## 1. Penjelasan Singkat & Fungsi
Widget `ScaleTransition` menganimasikan skala pembesaran/pengecilan (*scale effect*) dari widget anak menggunakan `Animation<double>`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `scale` | `Animation<double>` | Objek animasi nilai skala pembesaran (wajib). |
| `child` | `Widget` | Widget anak teranimasi. |
| `alignment` | `Alignment` | Titik tumpu pembesaran skala (default: Alignment.center). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ScaleTransitionDemoApp());
}

class ScaleTransitionDemoApp extends StatefulWidget {
  const ScaleTransitionDemoApp({super.key});

  @override
  State<ScaleTransitionDemoApp> createState() => _ScaleTransitionDemoAppState();
}

class _ScaleTransitionDemoAppState extends State<ScaleTransitionDemoApp> with SingleTickerProviderStateMixin {
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
        appBar: AppBar(title: const Text('Demo ScaleTransition')),
        body: Center(
          child: ScaleTransition(scale: _controller, child: const FlutterLogo(size: 100)),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Efek Animasi Popup Pencapaian Medali Prestasi Akademik)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MedalScaleApp());
}

class MedalScaleApp extends StatefulWidget {
  const MedalScaleApp({super.key});

  @override
  State<MedalScaleApp> createState() => _MedalScaleAppState();
}

class _MedalScaleAppState extends State<MedalScaleApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 800), vsync: this)..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
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
        appBar: AppBar(title: const Text('Penghargaan Akademik'), backgroundColor: Colors.indigo),
        body: Center(
          child: ScaleTransition(
            scale: _animation,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.workspace_premium, size: 100, color: Colors.amber),
                SizedBox(height: 12),
                Text('Mahasiswa Berprestasi IPK 4.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
