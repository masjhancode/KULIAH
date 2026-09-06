# Dokumentasi Widget: Image

## 1. Penjelasan Singkat & Fungsi
Widget `Image` merupakan widget dasar untuk memuat dan menampilkan gambar dari objek `ImageProvider` di dalam antarmuka aplikasi Flutter.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `image` | `ImageProvider` | Objek penyedia sumber gambar (seperti NetworkImage, AssetImage, MemoryImage). |
| `width` | `double` | Ukuran lebar fisik widget gambar. |
| `height` | `double` | Ukuran tinggi fisik widget gambar. |
| `fit` | `BoxFit` | Cara penuangan gambar dalam area kotak (fill, contain, cover, fitWidth, fitHeight). |
| `alignment` | `AlignmentGeometry` | Posisi penjajaran gambar di dalam batas kotak kontainer. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ImageBaseDemoApp());
}

class ImageBaseDemoApp extends StatelessWidget {
  const ImageBaseDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Base Image')),
        body: const Center(
          child: Image(
            image: NetworkImage('https://via.placeholder.com/150'),
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Perender Logo Kampus Resmi pada Header Portal SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CampusLogoApp());
}

class CampusLogoApp extends StatelessWidget {
  const CampusLogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Row(
            children: const [
              Image(
                image: NetworkImage('https://via.placeholder.com/40'),
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 12),
              Text('SIAKAD Mobile'),
            ],
          ),
        ),
        body: const Center(child: Text('Selamat Datang di Portal Akademik')),
      ),
    );
  }
}
```
