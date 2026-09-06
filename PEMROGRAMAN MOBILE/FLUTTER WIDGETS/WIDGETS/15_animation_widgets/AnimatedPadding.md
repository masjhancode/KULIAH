# Dokumentasi Widget: AnimatedPadding

## 1. Penjelasan Singkat & Fungsi
Widget `AnimatedPadding` secara otomatis menganimasikan perubahan marjin dalam (*padding*) anak saat nilai properti padding diperbarui.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `padding` | `EdgeInsetsGeometry` | Nilai jarak bantalan padding teranimasi. |
| `duration` | `Duration` | Durasi waktu transisi padding. |
| `curve` | `Curve` | Kurva kelajuan animasi. |
| `child` | `Widget` | Widget anak penampung. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedPaddingDemoApp());
}

class AnimatedPaddingDemoApp extends StatefulWidget {
  const AnimatedPaddingDemoApp({super.key});

  @override
  State<AnimatedPaddingDemoApp> createState() => _AnimatedPaddingDemoAppState();
}

class _AnimatedPaddingDemoAppState extends State<AnimatedPaddingDemoApp> {
  double _padding = 10.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo AnimatedPadding')),
        body: Center(
          child: GestureDetector(
            onTap: () => setState(() => _padding = _padding == 10.0 ? 40.0 : 10.0),
            child: AnimatedPadding(
              padding: EdgeInsets.all(_padding),
              duration: const Duration(seconds: 1),
              child: Container(color: Colors.indigo, child: const Text('Tap Padding', style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Animasi Pemegangan Jarak Antar Kartu Modul Akademik)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ModulePaddingApp());
}

class ModulePaddingApp extends StatefulWidget {
  const ModulePaddingApp({super.key});

  @override
  State<ModulePaddingApp> createState() => _ModulePaddingAppState();
}

class _ModulePaddingAppState extends State<ModulePaddingApp> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Modul Kuliah'), backgroundColor: Colors.indigo),
        body: Center(
          child: GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: AnimatedPadding(
              padding: EdgeInsets.symmetric(horizontal: _expanded ? 32.0 : 8.0, vertical: 12.0),
              duration: const Duration(milliseconds: 400),
              child: Card(
                color: Colors.indigo.shade100,
                child: const ListTile(
                  title: Text('Modul 04: Stateful Widget Animation'),
                  subtitle: Text('Ketuk untuk mengubah inset padding'),
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
