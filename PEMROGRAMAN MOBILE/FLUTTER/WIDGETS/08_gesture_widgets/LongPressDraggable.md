# Dokumentasi Widget: LongPressDraggable

## 1. Penjelasan Singkat & Fungsi
Widget `LongPressDraggable` merupakan varian `Draggable` yang baru dapat diseret (*dragged*) setelah pengguna menahan sentuhan (*long press*) beberapa saat.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `data` | `T` | Data objek yang dibawa saat diseret. |
| `child` | `Widget` | Widget posisi awal. |
| `feedback` | `Widget` | Widget penanda visual saat diseret. |
| `hapticFeedbackOnStart` | `bool` | Menentukan apakah memberikan getaran haptik saat drag dimulai. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const LongPressDraggableDemoApp());
}

class LongPressDraggableDemoApp extends StatelessWidget {
  const LongPressDraggableDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo LongPressDraggable')),
        body: Center(
          child: LongPressDraggable<String>(
            data: 'Item',
            feedback: Material(child: Container(padding: const EdgeInsets.all(8), color: Colors.orange, child: const Text('Item'))),
            child: Container(padding: const EdgeInsets.all(12), color: Colors.deepOrange, child: const Text('Tahan & Seret', style: TextStyle(color: Colors.white))),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Penyusunan Ulang Widget Kartu Dasbor Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ReorderDashboardApp());
}

class ReorderDashboardApp extends StatelessWidget {
  const ReorderDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Atur Dasbor'), backgroundColor: Colors.indigo),
        body: Center(
          child: LongPressDraggable<String>(
            data: 'Kartu IPK',
            feedback: Material(
              elevation: 6,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.indigo,
                child: const Text('Kartu IPK (Seret)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            child: Card(
              color: Colors.indigo.shade50,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Tahan Lama Untuk Menggeser Kartu Dasbor', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
