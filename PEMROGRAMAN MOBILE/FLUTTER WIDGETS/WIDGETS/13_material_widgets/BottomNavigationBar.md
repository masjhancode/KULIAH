# Dokumentasi Widget: BottomNavigationBar

## 1. Penjelasan Singkat & Fungsi
Widget `BottomNavigationBar` merupakan bilah navigasi bagian bawah layar yang memungkinkan pengalihan halaman antar 3 hingga 5 destinasi utama.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `items` | `List<BottomNavigationBarItem>` | Daftar item ikon dan label destinasi navigasi. |
| `currentIndex` | `int` | Indeks item yang saat ini aktif ditampilkan. |
| `onTap` | `ValueChanged<int>` | Callback respon saat salah satu item ditekan. |
| `selectedItemColor` | `Color` | Warna penyorot item yang sedang aktif dipilih. |
| `type` | `BottomNavigationBarType` | Tipe penampilan (fixed atau shifting). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BottomNavDemoApp());
}

class BottomNavDemoApp extends StatelessWidget {
  const BottomNavDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Bilah Navigasi Utama Tab Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadBottomNavApp());
}

class SiakadBottomNavApp extends StatefulWidget {
  const SiakadBottomNavApp({super.key});

  @override
  State<SiakadBottomNavApp> createState() => _SiakadBottomNavAppState();
}

class _SiakadBottomNavAppState extends State<SiakadBottomNavApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text('Halaman Beranda Akademik', style: TextStyle(fontSize: 18))),
    Center(child: Text('Halaman Jadwal Kuliah', style: TextStyle(fontSize: 18))),
    Center(child: Text('Halaman Transkrip Nilai', style: TextStyle(fontSize: 18))),
    Center(child: Text('Halaman Akun Mahasiswa', style: TextStyle(fontSize: 18))),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('SIAKAD Mobile'), backgroundColor: Colors.indigo),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Jadwal'),
            BottomNavigationBarItem(icon: Icon(Icons.grade), label: 'Nilai'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
          ],
        ),
      ),
    );
  }
}
```
