# Dokumentasi Widget: AnimatedPositioned

## 1. Penjelasan Singkat & Fungsi
Widget `AnimatedPositioned` menganimasikan perubahan koordinat posisi (`top`, `bottom`, `left`, `right`) anak di dalam widget `Stack`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `duration` | `Duration` | Durasi waktu pergeseran posisi (wajib). |
| `top` | `double?` | Koordinat atas. |
| `bottom` | `double?` | Koordinat bawah. |
| `left` | `double?` | Koordinat kiri. |
| `right` | `double?` | Koordinat kanan. |
| `curve` | `Curve` | Kurva gerakan. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedPositionedDemoApp());
}

class AnimatedPositionedDemoApp extends StatefulWidget {
  const AnimatedPositionedDemoApp({super.key});

  @override
  State<AnimatedPositionedDemoApp> createState() => _AnimatedPositionedDemoAppState();
}

class _AnimatedPositionedDemoAppState extends State<AnimatedPositionedDemoApp> {
  bool _moved = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo AnimatedPositioned')),
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              top: _moved ? 200 : 50,
              left: _moved ? 200 : 50,
              child: ElevatedButton(
                onPressed: () => setState(() => _moved = !_moved),
                child: const Text('Geser'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Floating Badge Peringatan Jadwal UTS yang Meluncur dari Atas)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ExamBannerSlideApp());
}

class ExamBannerSlideApp extends StatefulWidget {
  const ExamBannerSlideApp({super.key});

  @override
  State<ExamBannerSlideApp> createState() => _ExamBannerSlideAppState();
}

class _ExamBannerSlideAppState extends State<ExamBannerSlideApp> {
  bool _showNotice = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Dasbor Akademik'), backgroundColor: Colors.indigo),
        body: Stack(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () => setState(() => _showNotice = !_showNotice),
                child: const Text('Toggle Pengingat Ujian'),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutBack,
              top: _showNotice ? 20 : -100,
              left: 20,
              right: 20,
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(12),
                color: Colors.orange.shade800,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.warning, color: Colors.white),
                      SizedBox(width: 12),
                      Text('Ujian UTS Seluler Dimulai Esok Hari!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
