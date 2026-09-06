# Dokumentasi Widget: IndexedStack

## 1. Penjelasan Singkat & Fungsi
Widget `IndexedStack` merupakan varian dari `Stack` yang hanya menampilkan satu widget anak pada satu waktu berdasarkan atribut `index`, sementara keadaan (*state*) anak lainnya tetap dipertahankan di memori.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `index` | `int` | Indeks posisi anak yang sedang ditampilkan pada layar (default: 0). |
| `children` | `List<Widget>` | Daftar widget turunan yang dikelola di dalam tumpukan. |
| `alignment` | `AlignmentGeometry` | Perataan posisi anak di dalam area IndexedStack. |
| `sizing` | `StackFit` | Strategi penyesuaian ukuran area tumpukan. |

## 3. Contoh Kode Flutter

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const IndexedStackDemoApp());
}

class IndexedStackDemoApp extends StatefulWidget {
  const IndexedStackDemoApp({super.key});

  @override
  State<IndexedStackDemoApp> createState() => _IndexedStackDemoAppState();
}

class _IndexedStackDemoAppState extends State<IndexedStackDemoApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo IndexedStack Widget')),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            Center(child: Text('Halaman Beranda Akademik', style: TextStyle(fontSize: 18))),
            Center(child: Text('Halaman Jadwal Kuliah', style: TextStyle(fontSize: 18))),
            Center(child: Text('Halaman Profil Saya', style: TextStyle(fontSize: 18))),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Jadwal'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}
```
