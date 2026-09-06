# Dokumentasi Widget: FadeInImage

## 1. Penjelasan Singkat & Fungsi
Widget `FadeInImage` menampilkan gambar tempatan (*placeholder*) terlebih dahulu lalu memudarkan (*fade-in*) gambar utama saat berhasil diunduh dari jaringan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `placeholder` | `ImageProvider` | Objek gambar tempatan sementara (seperti AssetImage lokal). |
| `image` | `ImageProvider` | Objek gambar sasaran utama yang akan dimuat dari internet. |
| `fadeInDuration` | `Duration` | Durasi waktu efek pemudaran transisi gambar. |
| `fit` | `BoxFit` | Pengaturan penyesuaian gambar pada bingkai. |
| `fadeOutDuration` | `Duration` | Durasi waktu penghilangan gambar placeholder. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FadeInImageDemoApp());
}

class FadeInImageDemoApp extends StatelessWidget {
  const FadeInImageDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FadeInImage')),
        body: Center(
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/placeholder.png',
            image: 'https://via.placeholder.com/200',
            fadeInDuration: const Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Galeri Dokumentasi Foto Kegiatan Kampus dengan Efek Fade-In)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CampusGalleryFadeApp());
}

class CampusGalleryFadeApp extends StatelessWidget {
  const CampusGalleryFadeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Galeri Dies Natalis Kampus'), backgroundColor: Colors.indigo),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(12),
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate(4, (index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: const NetworkImage('https://via.placeholder.com/150/EEEEEE/999999?text=Loading...'),
                image: NetworkImage('https://via.placeholder.com/300?text=Foto+Kegiatan+${index + 1}'),
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 600),
              ),
            );
          }),
        ),
      ),
    );
  }
}
```
