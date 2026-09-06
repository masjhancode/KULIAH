# Dokumentasi Widget: BottomAppBar

## 1. Penjelasan Singkat & Fungsi
Widget `BottomAppBar` merupakan bilah navigasi bagian bawah layar `Scaffold` yang dapat menampung tombol aksi, menu, dan takik (*notch*) melengkung untuk meletakkan `FloatingActionButton`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget anak yang diletakkan di dalam BottomAppBar (umumnya Row berisi IconButton). |
| `color` | `Color` | Warna latar belakang bilah BottomAppBar. |
| `shape` | `NotchShape` | Bentuk potongan takik melengkung untuk wadah FloatingActionButton (misal CircularNotchedRectangle). |
| `elevation` | `double` | Tingkat bayangan penonjolan BottomAppBar. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BottomAppBarDemoApp());
}

class BottomAppBarDemoApp extends StatelessWidget {
  const BottomAppBarDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: const Icon(Icons.home, color: Colors.white), onPressed: () {}),
              IconButton(icon: const Icon(Icons.person, color: Colors.white), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Bilah Navigasi Bawah Ber-Notch dengan FAB QR Presensi)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadBottomAppBarApp());
}

class SiakadBottomAppBarApp extends StatelessWidget {
  const SiakadBottomAppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const Center(child: Text('Halaman Utama SIAKAD')),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: () {},
          child: const Icon(Icons.qr_code_scanner, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: Colors.indigo.shade50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: const Icon(Icons.home, color: Colors.indigo), onPressed: () {}),
              IconButton(icon: const Icon(Icons.assignment, color: Colors.indigo), onPressed: () {}),
              const SizedBox(width: 48), // Ruang kosong untuk FAB di tengah
              IconButton(icon: const Icon(Icons.grade, color: Colors.indigo), onPressed: () {}),
              IconButton(icon: const Icon(Icons.person, color: Colors.indigo), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
```
