# Dokumentasi Widget: CupertinoActivityIndicator

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoActivityIndicator` menampilkan indikator pemuatan melingkar khas iOS (*iOS spinner*) dengan jari-jari bilah radial memudar.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `color` | `Color?` | Warna bilah spinner memutar. |
| `radius` | `double` | Jari-jari ukuran lingkar indikator (default: 10.0). |
| `animating` | `bool` | Menentukan apakah animasi pemutaran aktif (default: true). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoActivityDemoApp());
}

class CupertinoActivityDemoApp extends StatelessWidget {
  const CupertinoActivityDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: CupertinoActivityIndicator(radius: 15.0),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Indikator Pemuatan Data Transkrip Nilai Akademik pada iPhone)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const TranskripIosLoaderApp());
}

class TranskripIosLoaderApp extends StatelessWidget {
  const TranskripIosLoaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Transkrip Nilai')),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(radius: 18.0),
              SizedBox(height: 12),
              Text('Memuat Transkrip dari Server PDDikti...', style: TextStyle(color: CupertinoColors.secondaryLabel)),
            ],
          ),
        ),
      ),
    );
  }
}
```
