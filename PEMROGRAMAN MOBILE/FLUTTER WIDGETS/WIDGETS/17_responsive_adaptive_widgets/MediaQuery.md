# Dokumentasi Widget: MediaQuery

## 1. Penjelasan Singkat & Fungsi
Widget `MediaQuery` memberikan informasi dimensi fisik layar (*device screen size*), orientasi, piksel rasio, serta inset bantalan sistem (seperti padding keyboard/status bar).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `MediaQuery.of(context).size` | `Size` | Mendapatkan ukuran fisik lebar dan tinggi layar perangkat (Size(width, height)). |
| `MediaQuery.of(context).orientation` | `Orientation` | Mendapatkan status orientasi perangkat (Orientation.portrait atau Orientation.landscape). |
| `MediaQuery.of(context).padding` | `EdgeInsets` | Mendapatkan inset bantalan sistem (misal padding atas untuk status bar/notch). |
| `MediaQuery.of(context).devicePixelRatio` | `double` | Mendapatkan rasio kepadatan piksel perangkat. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MediaQueryDemoApp());
}

class MediaQueryDemoApp extends StatelessWidget {
  const MediaQueryDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo MediaQuery')),
        body: Center(
          child: Text('Lebar Layar: ${screenSize.width} px
Tinggi Layar: ${screenSize.height} px'),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Penyesuaian Tata Letak Responsif Berdasarkan Ukuran Layar HP / Tablet)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AdaptiveDashboardApp());
}

class AdaptiveDashboardApp extends StatelessWidget {
  const AdaptiveDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width > 600;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(isTablet ? 'Dasbor SIAKAD Tablet' : 'Dasbor SIAKAD Mobile'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isTablet
              ? Row(
                  children: [
                    Expanded(child: Card(color: Colors.indigo.shade50, child: const Center(child: Text('Menu Navigasi Samping (Tablet)')))),
                    const SizedBox(width: 16),
                    Expanded(flex: 2, child: Card(color: Colors.white, child: const Center(child: Text('Konten Akademik Utama')))),
                  ],
                )
              : Column(
                  children: [
                    Expanded(child: Card(color: Colors.indigo.shade50, child: const Center(child: Text('Konten Akademik Utama (Mobile)')))),
                  ],
                ),
        ),
      ),
    );
  }
}
```
