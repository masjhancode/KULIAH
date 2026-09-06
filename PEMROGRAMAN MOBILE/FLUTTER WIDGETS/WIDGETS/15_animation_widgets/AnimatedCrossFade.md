# Dokumentasi Widget: AnimatedCrossFade

## 1. Penjelasan Singkat & Fungsi
Widget `AnimatedCrossFade` menganimasikan transisi silang (*cross-fade*) antara dua widget anak yang memiliki ukuran berbeda.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `firstChild` | `Widget` | Widget anak pertama. |
| `secondChild` | `Widget` | Widget anak kedua. |
| `crossFadeState` | `CrossFadeState` | State penentu anak yang aktif (showFirst atau showSecond). |
| `duration` | `Duration` | Durasi transisi silang. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedCrossFadeDemoApp());
}

class AnimatedCrossFadeDemoApp extends StatefulWidget {
  const AnimatedCrossFadeDemoApp({super.key});

  @override
  State<AnimatedCrossFadeDemoApp> createState() => _AnimatedCrossFadeDemoAppState();
}

class _AnimatedCrossFadeDemoAppState extends State<AnimatedCrossFadeDemoApp> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo AnimatedCrossFade')),
        body: Center(
          child: GestureDetector(
            onTap: () => setState(() => _showFirst = !_showFirst),
            child: AnimatedCrossFade(
              firstChild: Container(width: 100, height: 100, color: Colors.blue),
              secondChild: Container(width: 200, height: 200, color: Colors.green),
              crossFadeState: _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Transisi Antara Mode Ringkasan KHS dan Mode Rincian SKS)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KhsCrossFadeApp());
}

class KhsCrossFadeApp extends StatefulWidget {
  const KhsCrossFadeApp({super.key});

  @override
  State<KhsCrossFadeApp> createState() => _KhsCrossFadeAppState();
}

class _KhsCrossFadeAppState extends State<KhsCrossFadeApp> {
  bool _showSummary = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('KHS Semester Ganjil'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ElevatedButton(onPressed: () => setState(() => _showSummary = !_showSummary), child: const Text('Toggle Detail')),
              const SizedBox(height: 20),
              AnimatedCrossFade(
                firstChild: Card(color: Colors.indigo.shade50, child: const Padding(padding: EdgeInsets.all(20), child: Text('IPK Semester: 3.85 (Ringkasan)'))),
                secondChild: Card(color: Colors.indigo.shade100, child: const Padding(padding: EdgeInsets.all(30), child: Text('Detail: 24 SKS Lulus, 0 SKS Gagal, IPS 3.90'))),
                crossFadeState: _showSummary ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
