## 1. Penjelasan Singkat & Fungsi
Widget `AnimatedContainer` secara otomatis menganimasikan perubahan nilai propertinya (warna, ukuran, batas, padding, margin) selama durasi tertentu saat terjadi perubahan state.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `duration` | `Duration` | Durasi waktu animasi berlangsung (wajib). |
| `curve` | `Curve` | Kurva kecepatan animasi (misal: Curves.easeInOut). |
| `width` | `double` | Lebar kontainer teranimasi. |
| `height` | `double` | Tinggi kontainer teranimasi. |
| `decoration` | `Decoration` | Dekorasi latar belakang dan batas teranimasi. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedContainerDemoApp());
}

class AnimatedContainerDemoApp extends StatefulWidget {
  const AnimatedContainerDemoApp({super.key});

  @override
  State<AnimatedContainerDemoApp> createState() => _AnimatedContainerDemoAppState();
}

class _AnimatedContainerDemoAppState extends State<AnimatedContainerDemoApp> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo AnimatedContainer')),
        body: Center(
          child: GestureDetector(
            onTap: () => setState(() => _selected = !_selected),
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: _selected ? 200 : 100,
              height: _selected ? 100 : 200,
              color: _selected ? Colors.blue : Colors.red,
              alignment: _selected ? Alignment.center : Alignment.topCenter,
              curve: Curves.fastOutSlowIn,
              child: const FlutterLogo(size: 75),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Animasi Transisi Perubahan Kartu Status SPP (Belum Lunas ke Lunas))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SppStatusAnimationApp());
}

class SppStatusAnimationApp extends StatefulWidget {
  const SppStatusAnimationApp({super.key});

  @override
  State<SppStatusAnimationApp> createState() => _SppStatusAnimationAppState();
}

class _SppStatusAnimationAppState extends State<SppStatusAnimationApp> {
  bool _isPaid = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Status SPP'), backgroundColor: Colors.indigo),
        body: Center(
          child: GestureDetector(
            onTap: () => setState(() => _isPaid = !_isPaid),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _isPaid ? Colors.green.shade600 : Colors.orange.shade700,
                borderRadius: BorderRadius.circular(_isPaid ? 20 : 8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_isPaid ? Icons.check_circle : Icons.pending, color: Colors.white, size: 48),
                  const SizedBox(height: 12),
                  Text(_isPaid ? 'SPP LUNAS' : 'MENUNGGU PEMBAYARAN', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Ketuk untuk mensimulasikan konfirmasi bank', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
