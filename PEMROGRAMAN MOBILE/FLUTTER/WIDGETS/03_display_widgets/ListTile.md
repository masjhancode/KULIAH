# Dokumentasi Widget: ListTile

## 1. Penjelasan Singkat & Fungsi
Widget `ListTile` menyusun baris item berstandar Material Design yang terdiri dari ikon depan (*leading*), judul utama, sub-judul, dan tombol/ikon belakang (*trailing*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `leading` | `Widget` | Widget di sebelah kiri (umumnya Icon atau CircleAvatar). |
| `title` | `Widget` | Widget judul utama baris. |
| `subtitle` | `Widget` | Widget deskripsi sekunder. |
| `trailing` | `Widget` | Widget di sebelah kanan (umumnya Icon panah atau Badge). |
| `onTap` | `VoidCallback` | Callback fungsi saat baris ListTile ditekan. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ListTileDemoApp());
}

class ListTileDemoApp extends StatelessWidget {
  const ListTileDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ListTile')),
        body: ListTile(
          leading: const Icon(Icons.book),
          title: const Text('Pemrograman Seluler II'),
          subtitle: const Text('3 SKS - Ruang Lab 3'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Daftar Mata Kuliah Semester Ini)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MatkulListTileApp());
}

class MatkulListTileApp extends StatelessWidget {
  const MatkulListTileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Jadwal Mata Kuliah'), backgroundColor: Colors.indigo),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            Card(
              child: ListTile(
                leading: const CircleAvatar(backgroundColor: Colors.indigo, child: Icon(Icons.code, color: Colors.white)),
                title: const Text('Pemrograman Seluler II', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Senin, 08:00 WIB • Lab Komputer 3'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
