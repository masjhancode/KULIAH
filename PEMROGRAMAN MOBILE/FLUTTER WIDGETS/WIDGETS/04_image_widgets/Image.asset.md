# Dokumentasi Widget: Image.asset

## 1. Penjelasan Singkat & Fungsi
Konstruktor `Image.asset` memuat dan menampilkan gambar yang disimpan secara lokal di dalam direktori aset proyek (`pubspec.yaml`).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `name` | `String` | Jalur relatif berkas aset gambar (misal: "assets/images/logo.png"). |
| `width` | `double` | Lebar fisik gambar. |
| `height` | `double` | Tinggi fisik gambar. |
| `fit` | `BoxFit` | Pengaturan rasio penyesuaian gambar. |
| `package` | `String` | Nama paket asal tempat aset disimpan (jika dari pustaka luar). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ImageAssetDemoApp());
}

class ImageAssetDemoApp extends StatelessWidget {
  const ImageAssetDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Image.asset')),
        body: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 120,
            height: 120,
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Banner Banner Selamat Datang Mahasiswa Baru)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const WelcomeBannerAssetApp());
}

class WelcomeBannerAssetApp extends StatelessWidget {
  const WelcomeBannerAssetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Dasbor Mahasiswa'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/welcome_banner.png',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      color: Colors.indigo.shade100,
                      child: const Center(child: Text('Banner Akademik 2026/2027')),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
