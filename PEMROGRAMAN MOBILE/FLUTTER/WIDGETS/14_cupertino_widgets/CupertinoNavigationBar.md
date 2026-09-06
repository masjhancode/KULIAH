# Dokumentasi Widget: CupertinoNavigationBar

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoNavigationBar` adalah bilah navigasi atas khas iOS dengan efek blur *translucency*, tombol `leading`, `middle` (judul), dan tombol `trailing`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `leading` | `Widget?` | Widget di sisi kiri header (misal tombol kembali). |
| `middle` | `Widget?` | Widget di tengah header (judul halaman). |
| `trailing` | `Widget?` | Widget di sisi kanan header (misal tombol simpan / aksi). |
| `backgroundColor` | `Color?` | Warna latar belakang header dengan efek blur buram. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoNavBarDemoApp());
}

class CupertinoNavBarDemoApp extends StatelessWidget {
  const CupertinoNavBarDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Icon(CupertinoIcons.back),
          middle: Text('Nav Bar iOS'),
          trailing: Icon(CupertinoIcons.add),
        ),
        child: Center(child: Text('Konten Halaman')),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Header Navigasi Bergaya iOS pada Layar Informasi KHS Semester)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const KhsIosNavBarApp());
}

class KhsIosNavBarApp extends StatelessWidget {
  const KhsIosNavBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(CupertinoIcons.back), Text('Dasbor')],
            ),
          ),
          middle: const Text('KHS Semester Ganjil'),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(CupertinoIcons.share),
          ),
        ),
        child: const Center(child: Text('Rincian Nilai Matkul KHS iOS')),
      ),
    );
  }
}
```
