# Dokumentasi Widget: NavigationBar

## 1. Penjelasan Singkat & Fungsi
Widget `NavigationBar` merupakan komponen navigasi bawah standar Material 3 yang menggunakan efek animasi dan indikator bentuk lonjong (*pill-shaped indicator*) pada tab aktif.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `destinations` | `List<Widget>` | Daftar komponen NavigationDestination (icon, label). |
| `selectedIndex` | `int` | Indeks destinasi yang saat ini sedang dipilih. |
| `onDestinationSelected` | `ValueChanged<int>` | Callback respon saat destinasi ditekan. |
| `indicatorColor` | `Color` | Warna latar belakang indikator bentuk pil pada destinasi aktif. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationBarDemoApp());
}

class NavigationBarDemoApp extends StatelessWidget {
  const NavigationBarDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: 0,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Beranda'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Pengaturan'),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Bilah Navigasi Modern Material 3 Aplikasi Kampus)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const M3NavigationBarApp());
}

class M3NavigationBarApp extends StatefulWidget {
  const M3NavigationBarApp({super.key});

  @override
  State<M3NavigationBarApp> createState() => _M3NavigationBarAppState();
}

class _M3NavigationBarAppState extends State<M3NavigationBarApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(title: const Text('Navigasi Material 3')),
        body: Center(child: Text('Halaman Ke-$_selectedIndex', style: const TextStyle(fontSize: 20))),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Dasbor'),
            NavigationDestination(icon: Icon(Icons.class_outlined), selectedIcon: Icon(Icons.class_), label: 'Perkuliahan'),
            NavigationDestination(icon: Icon(Icons.notifications_outlined), selectedIcon: Icon(Icons.notifications), label: 'Notifikasi'),
          ],
        ),
      ),
    );
  }
}
```
