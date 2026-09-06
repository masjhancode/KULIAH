# Dokumentasi Widget: Chip

## 1. Penjelasan Singkat & Fungsi
Widget `Chip` menampilkan label informasi ringkas berbentuk kapsul kecil yang dapat dilengkapi ikon avatar atau tombol hapus.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `label` | `Widget` | Widget teks isi informasi chip. |
| `avatar` | `Widget` | Widget ikon/avatar di sebelah kiri label. |
| `backgroundColor` | `Color` | Warna latar belakang chip. |
| `onDeleted` | `VoidCallback` | Callback fungsi saat tombol hapus (X) ditekan. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ChipDemoApp());
}

class ChipDemoApp extends StatelessWidget {
  const ChipDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Chip')),
        body: Center(
          child: Chip(
            avatar: const Icon(Icons.school),
            label: const Text('Teknik Informatika'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tag Label Status Kelulusan Mata Kuliah)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MatkulStatusChipApp());
}

class MatkulStatusChipApp extends StatelessWidget {
  const MatkulStatusChipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Status Mata Kuliah'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 8,
            children: const [
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.check, size: 14, color: Colors.white)),
                label: Text('LULUS (3.85)'),
                backgroundColor: Colors.greenAccent,
              ),
              Chip(
                avatar: Icon(Icons.schedule, size: 16),
                label: Text('SEDANG TEMPUH'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
