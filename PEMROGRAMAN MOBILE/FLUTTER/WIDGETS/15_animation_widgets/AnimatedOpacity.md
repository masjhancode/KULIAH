# Dokumentasi Widget: AnimatedOpacity

## 1. Penjelasan Singkat & Fungsi
Widget `AnimatedOpacity` menganimasikan tingkat transparansi (*opacity*) anak secara halus selama durasi yang ditentukan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `opacity` | `double` | Nilai transparansi dari 0.0 (transparan penuh) hingga 1.0 (solid). |
| `duration` | `Duration` | Durasi waktu animasi pemudaran. |
| `curve` | `Curve` | Kurva akselerasi animasi. |
| `child` | `Widget` | Widget anak teranimasi. |
| `onEnd` | `VoidCallback` | Callback saat animasi pemudaran selesai. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedOpacityDemoApp());
}

class AnimatedOpacityDemoApp extends StatefulWidget {
  const AnimatedOpacityDemoApp({super.key});

  @override
  State<AnimatedOpacityDemoApp> createState() => _AnimatedOpacityDemoAppState();
}

class _AnimatedOpacityDemoAppState extends State<AnimatedOpacityDemoApp> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo AnimatedOpacity')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 1),
                child: const FlutterLogo(size: 100),
              ),
              ElevatedButton(
                onPressed: () => setState(() => _opacity = _opacity == 1.0 ? 0.0 : 1.0),
                child: const Text('Toggle Opacity'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Animasi Penampakan Halus Banner Kelulusan Matkul Prasyarat)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PrerequisiteBannerApp());
}

class PrerequisiteBannerApp extends StatefulWidget {
  const PrerequisiteBannerApp({super.key});

  @override
  State<PrerequisiteBannerApp> createState() => _PrerequisiteBannerAppState();
}

class _PrerequisiteBannerAppState extends State<PrerequisiteBannerApp> {
  bool _showBanner = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Prasyarat Matkul'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                onPressed: () => setState(() => _showBanner = !_showBanner),
                child: const Text('Cek Prasyarat', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _showBanner ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 600),
                child: Card(
                  color: Colors.green.shade50,
                  child: const ListTile(
                    leading: Icon(Icons.verified, color: Colors.green),
                    title: Text('Prasyarat Pemrograman Seluler I LULUS (Nilai: A)', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
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
