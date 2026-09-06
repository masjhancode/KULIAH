# Dokumentasi Widget: NavigationDrawer

## 1. Penjelasan Singkat & Fungsi
Widget `NavigationDrawer` merupakan panel navigasi samping standar Material 3 yang memberikan daftar pilihan destinasi utama dengan indikator aktif berbentuk bentuk pil (*pill-shape*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `children` | `List<Widget>` | Daftar widget destinasi (NavigationDrawerDestination) dan pembatas. |
| `selectedIndex` | `int` | Indeks destinasi yang sedang aktif dipilihi. |
| `onDestinationSelected` | `ValueChanged<int>` | Callback fungsi saat pengguna memilih salah satu destinasi. |
| `backgroundColor` | `Color` | Warna latar belakang NavigationDrawer. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationDrawerDemoApp());
}

class NavigationDrawerDemoApp extends StatelessWidget {
  const NavigationDrawerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo NavigationDrawer')),
        drawer: NavigationDrawer(
          children: const [
            NavigationDrawerDestination(icon: Icon(Icons.home), label: Text('Beranda')),
            NavigationDrawerDestination(icon: Icon(Icons.settings), label: Text('Pengaturan')),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Navigasi Samping Material 3 Portal Kampus)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const M3NavigationDrawerApp());
}

class M3NavigationDrawerApp extends StatefulWidget {
  const M3NavigationDrawerApp({super.key});

  @override
  State<M3NavigationDrawerApp> createState() => _M3NavigationDrawerAppState();
}

class _M3NavigationDrawerAppState extends State<M3NavigationDrawerApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(title: const Text('Portal Material 3')),
        drawer: NavigationDrawer(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
              child: Text('Menu Utama', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.school_outlined),
              selectedIcon: Icon(Icons.school),
              label: Text('Perkuliahan'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.book_outlined),
              selectedIcon: Icon(Icons.book),
              label: Text('Perpustakaan'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.person_outlined),
              selectedIcon: Icon(Icons.person),
              label: Text('Profil Saya'),
            ),
          ],
        ),
        body: Center(child: Text('Destinasi Terpilih: Terpilih #$_selectedIndex')),
      ),
    );
  }
}
```
