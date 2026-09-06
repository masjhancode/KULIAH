# Dokumentasi Widget: Image.file

## 1. Penjelasan Singkat & Fungsi
Konstruktor `Image.file` memuat dan menampilkan gambar dari berkas lokal penyimpanan perangkat pengguna (menggunakan objek `File` dari paket `dart:io`).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `file` | `File` | Objek File lokasi berkas gambar pada penyimpanan internal/eksternal HP. |
| `width` | `double` | Lebar fisik bingkai gambar. |
| `height` | `double` | Tinggi fisik bingkai gambar. |
| `fit` | `BoxFit` | Pengaturan penyesuaian gambar. |
| `scale` | `double` | Skala perbesaran gambar. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const ImageFileDemoApp());
}

class ImageFileDemoApp extends StatelessWidget {
  const ImageFileDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final file = File('/storage/emulated/0/Download/sample.jpg');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Image.file')),
        body: Center(
          child: Image.file(
            file,
            width: 200,
            height: 200,
            errorBuilder: (c, e, s) => const Text('Berkas tidak ditemukan'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pratinjau Foto Bukti Pembayaran SPP dari Galeri Kamera HP)

```dart
import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const PaymentReceiptFileApp());
}

class PaymentReceiptFileApp extends StatelessWidget {
  const PaymentReceiptFileApp({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleReceiptFile = File('/sdcard/Pictures/bukti_spp.jpg');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Upload Bukti Transfer SPP'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text('Pratinjau Foto Bukti Transfer:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Image.file(
                  sampleReceiptFile,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Text('Foto Bukti Transfer Belum Dipilih'));
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
