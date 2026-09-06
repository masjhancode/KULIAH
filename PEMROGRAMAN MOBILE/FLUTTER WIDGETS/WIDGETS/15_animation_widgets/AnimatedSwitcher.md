# Dokumentasi Widget: AnimatedSwitcher

## 1. Penjelasan Singkat & Fungsi
Widget `AnimatedSwitcher` secara otomatis menjalankan transisi animasi pemudaran (*fade transition*) saat widget anak berganti ke widget lain.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget anak saat ini. Wajib memiliki Key unik jika tipe widget sama! |
| `duration` | `Duration` | Durasi waktu transisi perpindahan. |
| `switchInCurve` | `Curve` | Kurva masukan widget baru. |
| `switchOutCurve` | `Curve` | Kurva keluaran widget lama. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedSwitcherDemoApp());
}

class AnimatedSwitcherDemoApp extends StatefulWidget {
  const AnimatedSwitcherDemoApp({super.key});

  @override
  State<AnimatedSwitcherDemoApp> createState() => _AnimatedSwitcherDemoAppState();
}

class _AnimatedSwitcherDemoAppState extends State<AnimatedSwitcherDemoApp> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo AnimatedSwitcher')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Text('$_count', key: ValueKey<int>(_count), style: const TextStyle(fontSize: 40)),
              ),
              ElevatedButton(onPressed: () => setState(() => _count++), child: const Text('Tambah')),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Transisi Tampilan Mode Grafik vs Mode Daftar Transkrip IPK)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ViewSwitcherApp());
}

class ViewSwitcherApp extends StatefulWidget {
  const ViewSwitcherApp({super.key});

  @override
  State<ViewSwitcherApp> createState() => _ViewSwitcherAppState();
}

class _ViewSwitcherAppState extends State<ViewSwitcherApp> {
  bool _isGraphView = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Transkrip IPK'),
          backgroundColor: Colors.indigo,
          actions: [
            IconButton(
              icon: Icon(_isGraphView ? Icons.list : Icons.show_chart),
              onPressed: () => setState(() => _isGraphView = !_isGraphView),
            ),
          ],
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: _isGraphView
              ? Container(key: const ValueKey(1), color: Colors.indigo.shade50, child: const Center(child: Text('Tampilan Grafik Trend IPK (3.85)')))
              : Container(key: const ValueKey(2), color: Colors.white, child: const Center(child: Text('Tampilan Daftar Matkul Transkrip'))),
        ),
      ),
    );
  }
}
```
