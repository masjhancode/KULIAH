# Dokumentasi Widget: Draggable

## 1. Penjelasan Singkat & Fungsi
Widget `Draggable` memungkinkan komponen widget diseret (*dragged*) oleh pengguna dari posisi asalnya menuju `DragTarget`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `data` | `T` | Data objek yang dibawa saat widget diseret. |
| `child` | `Widget` | Widget posisi awal sebelum diseret. |
| `feedback` | `Widget` | Widget rupa visual yang mengikuti pergerakan jari saat diseret. |
| `childWhenDragging` | `Widget` | Widget pengganti di posisi asal saat sedang diseret. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DraggableDemoApp());
}

class DraggableDemoApp extends StatelessWidget {
  const DraggableDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Draggable')),
        body: Center(
          child: Draggable<String>(
            data: 'DataItem',
            feedback: Material(
              color: Colors.transparent,
              child: Container(padding: const EdgeInsets.all(8), color: Colors.indigo, child: const Text('Item', style: TextStyle(color: Colors.white))),
            ),
            child: Container(padding: const EdgeInsets.all(12), color: Colors.blue, child: const Text('Seret Saya', style: TextStyle(color: Colors.white))),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Drag-and-Drop Penyusunan Prioritas Kelompok Praktikum)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const LabDraggableApp());
}

class LabDraggableApp extends StatelessWidget {
  const LabDraggableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pilih Sesi Praktikum'), backgroundColor: Colors.indigo),
        body: Center(
          child: Draggable<String>(
            data: 'Kelompok Praktikum A',
            feedback: Material(
              elevation: 4,
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.indigo,
                child: const Text('Praktikum Mobile A (Senin)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            childWhenDragging: Opacity(
              opacity: 0.4,
              child: Container(padding: const EdgeInsets.all(16), color: Colors.grey, child: const Text('Praktikum Mobile A')),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.indigo,
              child: const Text('Seret Ke Kotak Konfirmasi >', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}
```
