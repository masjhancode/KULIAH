# Dokumentasi Widget: DragTarget

## 1. Penjelasan Singkat & Fungsi
Widget `DragTarget` bertindak sebagai zona penerima (*drop target*) bagi widget `Draggable` yang diseret oleh pengguna.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `builder` | `DragTargetBuilder<T>` | Fungsi perender tampilan target berdasarkan status penerimaan data. |
| `onAcceptWithDetails` | `DragTargetAcceptWithDetails<T>` | Callback saat data Draggable dilepas (dropped) di area target. |
| `onWillAcceptWithDetails` | `DragTargetWillAcceptWithDetails<T>` | Callback untuk memeriksa apakah data yang diseret layak diterima. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DragTargetDemoApp());
}

class DragTargetDemoApp extends StatelessWidget {
  const DragTargetDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo DragTarget')),
        body: Center(
          child: DragTarget<String>(
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 150,
                height: 150,
                color: candidateData.isNotEmpty ? Colors.green : Colors.grey.shade300,
                child: const Center(child: Text('Lepaskan di sini')),
              );
            },
            onAcceptWithDetails: (details) {},
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Zona Target Penerima Pengedropan Matkul KRS)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KrsDragTargetApp());
}

class KrsDragTargetApp extends StatefulWidget {
  const KrsDragTargetApp({super.key});

  @override
  State<KrsDragTargetApp> createState() => _KrsDragTargetAppState();
}

class _KrsDragTargetAppState extends State<KrsDragTargetApp> {
  final List<String> _droppedItems = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Keranjang KRS'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DragTarget<String>(
            builder: (context, candidateData, rejectedData) {
              return Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: candidateData.isNotEmpty ? Colors.indigo.shade50 : Colors.grey.shade100,
                  border: Border.all(color: candidateData.isNotEmpty ? Colors.indigo : Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    _droppedItems.isEmpty ? 'Lepaskan Mata Kuliah di Sini' : 'Matkul Terdaftar: ${_droppedItems.join(", ")}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
            onAcceptWithDetails: (details) {
              setState(() => _droppedItems.add(details.data));
            },
          ),
        ),
      ),
    );
  }
}
```
