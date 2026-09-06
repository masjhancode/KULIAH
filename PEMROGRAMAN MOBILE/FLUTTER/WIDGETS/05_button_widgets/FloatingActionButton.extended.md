# Dokumentasi Widget: FloatingActionButton.extended

## 1. Penjelasan Singkat & Fungsi
Konstruktor `FloatingActionButton.extended` membuat tombol melayang berbentuk lonjong oval yang dilengkapi dengan kombinasi label teks dan ikon.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onPressed` | `VoidCallback` | Callback fungsi saat tombol ditekan. |
| `label` | `Widget` | Widget teks penjelas aksi. |
| `icon` | `Widget` | Widget ikon pendamping label. |
| `backgroundColor` | `Color` | Warna latar belakang FAB Extended. |
| `elevation` | `double` | Tingkat penonjolan bayangan. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FabExtendedDemoApp());
}

class FabExtendedDemoApp extends StatelessWidget {
  const FabExtendedDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FAB Extended')),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Tambah Data'),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tombol Ajukan Judul Skripsi / TA Baru)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ProposalFabExtendedApp());
}

class ProposalFabExtendedApp extends StatelessWidget {
  const ProposalFabExtendedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Modul Tugas Akhir / Skripsi'), backgroundColor: Colors.indigo),
        body: const Center(child: Text('Daftar proposal skripsi Anda.')),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.indigo,
          onPressed: () {},
          icon: const Icon(Icons.note_add, color: Colors.white),
          label: const Text('Ajukan Judul Skripsi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
```
