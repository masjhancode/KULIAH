# Dokumentasi Widget: FloatingActionButton

## 1. Penjelasan Singkat & Fungsi
Widget `FloatingActionButton` (FAB) merupakan tombol melayang melingkar yang menonjolkan aksi utama (*primary action*) pada halaman aplikasi.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onPressed` | `VoidCallback` | Callback fungsi yang dieksekusi saat tombol FAB ditekan. |
| `child` | `Widget` | Widget di dalam tombol (umumnya Icon atau Text pada FAB Extended). |
| `backgroundColor` | `Color` | Warna latar belakang tombol FAB. |
| `tooltip` | `String` | Teks pembantu aksesibilitas yang muncul saat tombol ditahan. |
| `elevation` | `double` | Tingkat bayangan penonjolan tombol melayang. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FabDemoApp());
}

class FabDemoApp extends StatelessWidget {
  const FabDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FAB')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tombol Pengajuan Bimbingan Baru (FAB.extended))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BimbinganFabApp());
}

class BimbinganFabApp extends StatelessWidget {
  const BimbinganFabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Daftar Konsultasi PA'), backgroundColor: Colors.indigo),
        body: const Center(child: Text('Belum ada jadwal bimbingan baru.')),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.indigo,
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text('Buat Bimbingan PA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
```
