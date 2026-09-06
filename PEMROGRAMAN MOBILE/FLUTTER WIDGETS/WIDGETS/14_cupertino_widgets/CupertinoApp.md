# Dokumentasi Widget: CupertinoApp

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoApp` adalah widget tingkat atas (*root*) yang menetapkan konfigurasi aplikasi bergaya iOS, termasuk tema `CupertinoThemeData`, navigasi, dan lokalisasi.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `home` | `Widget?` | Widget halaman utama aplikasi. |
| `theme` | `CupertinoThemeData?` | Pengaturan warna dasar, tipografi, dan gaya antarmuka iOS. |
| `routes` | `Map<String, WidgetBuilder>?` | Peta nama rute navigasi aplikasi. |
| `title` | `String` | Judul aplikasi untuk sistem OS. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoAppDemo());
}

class CupertinoAppDemo extends StatelessWidget {
  const CupertinoAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Demo CupertinoApp')),
        child: Center(child: Text('Aplikasi Bergaya iOS')),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Inisialisasi Root Aplikasi Portal SIAKAD Mobile iOS Edition)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const SiakadIosApp());
}

class SiakadIosApp extends StatelessWidget {
  const SiakadIosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'SIAKAD Mobile iOS',
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
      ),
      home: const SiakadIosDashboard(),
    );
  }
}

class SiakadIosDashboard extends StatelessWidget {
  const SiakadIosDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Portal SIAKAD iOS'),
      ),
      child: SafeArea(
        child: Center(
          child: Text('Selamat Datang di Portal Akademik Bergaya iOS Human Interface'),
        ),
      ),
    );
  }
}
```
