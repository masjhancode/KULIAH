# Dokumentasi Widget: OutlinedButton

## 1. Penjelasan Singkat & Fungsi
Widget `OutlinedButton` merupakan tombol berbasis garis tepi (*border*) dengan latar transparan, cocok untuk aksi sekunder dengan bobot penekanan sedang.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onPressed` | `VoidCallback` | Callback fungsi respon sentuhan tombol. |
| `child` | `Widget` | Widget label atau ikon di dalam tombol. |
| `style` | `ButtonStyle` | Pengaturan warna border, ketebalan, dan batas padding. |
| `onLongPress` | `VoidCallback` | Callback saat ditekan lama. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const OutlinedButtonDemoApp());
}

class OutlinedButtonDemoApp extends StatelessWidget {
  const OutlinedButtonDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo OutlinedButton')),
        body: Center(
          child: OutlinedButton(
            onPressed: () {},
            child: const Text('Edit Profil'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tombol Cetak Kartu Ujian Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PrintExamCardApp());
}

class PrintExamCardApp extends StatelessWidget {
  const PrintExamCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Kartu Ujian UTS/UAS'), backgroundColor: Colors.indigo),
        body: Center(
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.indigo,
              side: const BorderSide(color: Colors.indigo, width: 1.5),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () {},
            icon: const Icon(Icons.print),
            label: const Text('Cetak Kartu Ujian (PDF)', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
```
