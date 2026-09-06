# Dokumentasi Widget: Image

## 1. Penjelasan Singkat & Fungsi
Widget `Image` digunakan untuk memuat dan menampilkan gambar pada antarmuka Flutter. Flutter menyediakan beberapa konstruktor bernama (*named constructors*) utama sesuai dengan sumber asal gambar:
- **`Image.network`**: Memuat gambar dari URL publik/jaringan internet.
- **`Image.asset`**: Memuat gambar dari direktori aset lokal proyek yang terdaftar di `pubspec.yaml`.
- **`Image.file`**: Memuat gambar dari jalur penyimpanan lokal perangkat (`File`).
- **`Image.memory`**: Memuat gambar dari data biner memori (`Uint8List`).

## 2. Tabel Atribut & Penggunaannya

| Atribut / Konstruktor | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `src` / `name` / `file` | `String` / `File` / `Uint8List` | Parameter sumber gambar (URL untuk network, path untuk asset/file, byte data untuk memory). |
| `width` | `double` | Ukuran lebar area penayangan gambar dalam piksel logis. |
| `height` | `double` | Ukuran tinggi area penayangan gambar dalam piksel logis. |
| `fit` | `BoxFit` | Strategi penyesuaian gambar terhadap wadahnya (`cover`, `contain`, `fill`, `fitWidth`, `fitHeight`). |
| `alignment` | `AlignmentGeometry` | Posisi perataan gambar di dalam batas area wadah (default: `Alignment.center`). |
| `errorBuilder` | `ImageErrorWidgetBuilder` | Callback untuk merender widget pengganti jika proses pemuatan gambar mengalami kegagalan. |
| `loadingBuilder` | `ImageLoadingBuilder` | Callback untuk menampilkan indikator pemuatan (*progress indicator*) selama gambar diunduh dari jaringan. |

## 3. Contoh Kode Flutter

```dart
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

void main() {
  runApp(const ImageDemoApp());
}

class ImageDemoApp extends StatelessWidget {
  const ImageDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh byte gambar dummy untuk Image.memory
    final Uint8List memoryBytes = Uint8List.fromList([]);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Varian Widget Image')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Contoh Image.network (Gambar dari URL Jaringan)
              const Text('1. Image.network (Jaringan Internet):', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Image.network(
                'https://via.placeholder.com/150',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const CircularProgressIndicator();
                },
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 48, color: Colors.red),
              ),

              const Divider(height: 32),

              // 2. Contoh Image.asset (Gambar dari Aset Lokal pubspec.yaml)
              const Text('2. Image.asset (Aset Proyek Lokal):', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Image.asset(
                'assets/images/logo_kampus.png',
                width: 120,
                height: 120,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Text('Aset logo_kampus.png belum ditambahkan di pubspec.yaml'),
              ),

              const Divider(height: 32),

              // 3. Contoh Image.file (Gambar dari Berkas Penyimpanan Lokal Perangkat)
              const Text('3. Image.file (Berkas Penyimpanan Lokal):', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Image.file(
                File('/storage/emulated/0/Download/foto_mahasiswa.jpg'),
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Text('Berkas lokal tidak ditemukan'),
              ),

              const Divider(height: 32),

              // 4. Contoh Image.memory (Gambar dari Byte Data Memori)
              const Text('4. Image.memory (Byte Data Memori Uint8List):', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              memoryBytes.isNotEmpty
                  ? Image.memory(
                      memoryBytes,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    )
                  : const Text('Data byte memori kosong'),
            ],
          ),
        ),
      ),
    );
  }
}
```
