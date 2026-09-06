## 1. Penjelasan Singkat & Fungsi
Widget `AnimatedAlign` menganimasikan perubahan posisi penjajaran (*alignment*) anak dari satu titik ke titik lain di dalam kontainernya.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `alignment` | `AlignmentGeometry` | Posisi penjajaran anak teranimasi. |
| `duration` | `Duration` | Durasi pergeseran alignment. |
| `curve` | `Curve` | Kurva gerakan. |
| `child` | `Widget` | Widget anak. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimatedAlignDemoApp());
}

class AnimatedAlignDemoApp extends StatefulWidget {
  const AnimatedAlignDemoApp({super.key});

  @override
  State<AnimatedAlignDemoApp> createState() => _AnimatedAlignDemoAppState();
}

class _AnimatedAlignDemoAppState extends State<AnimatedAlignDemoApp> {
  Alignment _alignment = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo AnimatedAlign')),
        body: GestureDetector(
          onTap: () => setState(() => _alignment = _alignment == Alignment.topLeft ? Alignment.bottomRight : Alignment.topLeft),
          child: Container(
            color: Colors.grey.shade200,
            child: AnimatedAlign(
              alignment: _alignment,
              duration: const Duration(seconds: 1),
              child: const FlutterLogo(size: 50),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Indikator Geser Status Kehadiran Presensi Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AttendanceAlignApp());
}

class AttendanceAlignApp extends StatefulWidget {
  const AttendanceAlignApp({super.key});

  @override
  State<AttendanceAlignApp> createState() => _AttendanceAlignAppState();
}

class _AttendanceAlignAppState extends State<AttendanceAlignApp> {
  bool _isPresent = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Presensi Keluar/Masuk'), backgroundColor: Colors.indigo),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 60,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(30)),
                child: AnimatedAlign(
                  alignment: _isPresent ? Alignment.centerLeft : Alignment.centerRight,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: 120,
                    height: 52,
                    decoration: BoxDecoration(color: _isPresent ? Colors.green : Colors.red, borderRadius: BorderRadius.circular(26)),
                    child: Center(child: Text(_isPresent ? 'HADIR' : 'IZIN', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () => setState(() => _isPresent = !_isPresent), child: const Text('Ubah Status')),
            ],
          ),
        ),
      ),
    );
  }
}
```
