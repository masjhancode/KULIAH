# Dokumentasi Widget: RotationTransition

## 1. Penjelasan Singkat & Fungsi
Widget `RotationTransition` menganimasikan putaran derajat rotasi (*rotational spin*) dari widget anak menggunakan `Animation<double>`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `turns` | `Animation<double>` | Objek animasi jumlah putaran rotasi (1.0 = 360 derajat) (wajib). |
| `child` | `Widget` | Widget anak teranimasi. |
| `alignment` | `Alignment` | Titik pusat poros putaran rotasi. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RotationTransitionDemoApp());
}

class RotationTransitionDemoApp extends StatefulWidget {
  const RotationTransitionDemoApp({super.key});

  @override
  State<RotationTransitionDemoApp> createState() => _RotationTransitionDemoAppState();
}

class _RotationTransitionDemoAppState extends State<RotationTransitionDemoApp> with SingleTickerProviderStateMixin {
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
        appBar: AppBar(title: const Text('Demo RotationTransition')),
        body: Center(
          child: RotationTransition(turns: _controller, child: const FlutterLogo(size: 100)),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Animasi Putaran Ikon Refresh Sinkronisasi Data Akademik)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SyncRotationApp());
}

class SyncRotationApp extends StatefulWidget {
  const SyncRotationApp({super.key});

  @override
  State<SyncRotationApp> createState() => _SyncRotationAppState();
}

class _SyncRotationAppState extends State<SyncRotationApp> with SingleTickerProviderStateMixin {
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
        appBar: AppBar(title: const Text('Sinkronisasi Data'), backgroundColor: Colors.indigo),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _controller,
                child: const Icon(Icons.sync, size: 64, color: Colors.indigo),
              ),
              const SizedBox(height: 16),
              const Text('Menyinkronkan Data Akademik PDDikti...'),
            ],
          ),
        ),
      ),
    );
  }
}
```
