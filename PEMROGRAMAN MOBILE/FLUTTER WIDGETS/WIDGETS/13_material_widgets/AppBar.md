# Dokumentasi Widget: AppBar

## 1. Penjelasan Singkat & Fungsi
Widget `AppBar` merupakan bilah navigasi utama yang diletakkan di bagian atas layar `Scaffold`. Digunakan untuk menampilkan judul halaman, tombol navigasi (*leading*), dan aksi cepat (*actions*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `title` | `Widget` | Judul utama yang ditampilkan di tengah atau kiri AppBar. |
| `leading` | `Widget` | Widget di sebelah kiri judul (umumnya tombol menu atau back button). |
| `actions` | `List<Widget>` | Daftar widget tombol aksi cepat di sebelah kanan AppBar. |
| `backgroundColor` | `Color` | Warna latar belakang bilah AppBar. |
| `elevation` | `double` | Tingkat bayangan penonjolan AppBar dari latar belakang. |
| `centerTitle` | `bool` | Menentukan apakah judul ditempatkan tepat di titik tengah horizontal. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AppBarDemoApp());
}

class AppBarDemoApp extends StatelessWidget {
  const AppBarDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo AppBar'),
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
        ),
        body: const Center(child: Text('Konten Utama')),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Header Dasbor Utama SIAKAD Mobile)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadAppBarApp());
}

class SiakadAppBarApp extends StatelessWidget {
  const SiakadAppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 4,
          centerTitle: false,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.indigo),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Ahmad Fauzi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              Text('NIM: 2026090123', style: TextStyle(fontSize: 11, color: Colors.white70)),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: const Center(child: Text('Dasbor Akademik Mahasiswa')),
      ),
    );
  }
}
```
