# Dokumentasi Widget: CupertinoPageScaffold

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoPageScaffold` menyediakan struktur halaman tata letak dasar khas iOS dengan `navigationBar` transparan/buram dan warna latar belakang `backgroundColor`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `navigationBar` | `ObstructingPreferredSizeWidget?` | Bilah navigasi atas (CupertinoNavigationBar). |
| `child` | `Widget` | Konten utama halaman (wajib). |
| `backgroundColor` | `Color?` | Warna latar belakang halaman khas iOS. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoScaffoldDemoApp());
}

class CupertinoScaffoldDemoApp extends StatelessWidget {
  const CupertinoScaffoldDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Header iOS')),
        child: Center(child: Text('Konten Dalam Scaffold iOS')),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tata Letak Halaman Utama Dasbor Akademik Bergaya iOS)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const AcademicIosScaffoldApp());
}

class AcademicIosScaffoldApp extends StatelessWidget {
  const AcademicIosScaffoldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        navigationBar: CupertinoNavigationBar(
          middle: Text('Dasbor Akademik'),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('IPK Kumulatif: 3.85', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
