# Dokumentasi Widget: IconButton

## 1. Penjelasan Singkat & Fungsi
Widget `IconButton` merupakan tombol berukuran ringkas berupa ikon simbolik yang merespon sentuhan pengguna (*ink splash*). Digunakan pada AppBar atau aksi tabel/list item.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `icon` | `Widget` | Widget ikon utama yang ditampilkan. |
| `onPressed` | `VoidCallback` | Callback respon sentuhan tombol. |
| `iconSize` | `double` | Ukuran besar dimensi ikon. |
| `color` | `Color` | Warna pewarnaan ikon. |
| `tooltip` | `String` | Teks keterangan pembantu saat ikon ditahan. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const IconButtonDemoApp());
}

class IconButtonDemoApp extends StatelessWidget {
  const IconButtonDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo IconButton'),
          actions: [
            IconButton(icon: const Icon(Icons.favorite), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tombol Aksi Filter & Search Jadwal Kuliah)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ScheduleFilterIconButtonApp());
}

class ScheduleFilterIconButtonApp extends StatelessWidget {
  const ScheduleFilterIconButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('Jadwal Kuliah Hari Ini'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              tooltip: 'Cari Mata Kuliah',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.white),
              tooltip: 'Filter Ruangan',
              onPressed: () {},
            ),
          ],
        ),
        body: const Center(child: Text('Tampilan Jadwal Perkuliahan')),
      ),
    );
  }
}
```
