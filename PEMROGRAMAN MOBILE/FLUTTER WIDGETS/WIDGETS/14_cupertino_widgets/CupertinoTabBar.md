# Dokumentasi Widget: CupertinoTabBar

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoTabBar` adalah bilah navigasi bawah khas iOS (*iOS bottom tab bar*) yang menampilkan item ikon dan label.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `items` | `List<BottomNavigationBarItem>` | Daftar item tab navigasi (wajib). |
| `currentIndex` | `int` | Indeks tab yang sedang aktif saat ini (default: 0). |
| `onTap` | `ValueChanged<int>?` | Callback saat item tab diklik. |
| `activeColor` | `Color?` | Warna ikon/label tab saat aktif. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoTabBarDemoApp());
}

class CupertinoTabBarDemoApp extends StatefulWidget {
  const CupertinoTabBarDemoApp({super.key});

  @override
  State<CupertinoTabBarDemoApp> createState() => _CupertinoTabBarDemoAppState();
}

class _CupertinoTabBarDemoAppState extends State<CupertinoTabBarDemoApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('Demo CupertinoTabBar')),
        bottomBar: CupertinoTabBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Beranda'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Profil'),
          ],
        ),
        child: Center(child: Text('Tab Terpilih: $_currentIndex')),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Navigasi Tab Bawah Menu Dasbor Utama SIAKAD iOS Edition)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const SiakadIosBottomTabBarApp());
}

class SiakadIosBottomTabBarApp extends StatefulWidget {
  const SiakadIosBottomTabBarApp({super.key});

  @override
  State<SiakadIosBottomTabBarApp> createState() => _SiakadIosBottomTabBarAppState();
}

class _SiakadIosBottomTabBarAppState extends State<SiakadIosBottomTabBarApp> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('Portal SIAKAD iOS')),
        bottomBar: CupertinoTabBar(
          activeColor: CupertinoColors.activeBlue,
          currentIndex: _tabIndex,
          onTap: (idx) => setState(() => _tabIndex = idx),
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.house_fill), label: 'Beranda'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.book_fill), label: 'KRS'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_crop_circle), label: 'Profil'),
          ],
        ),
        child: Center(child: Text('Konten Halaman Menu Tab Ke-$_tabIndex')),
      ),
    );
  }
}
```
