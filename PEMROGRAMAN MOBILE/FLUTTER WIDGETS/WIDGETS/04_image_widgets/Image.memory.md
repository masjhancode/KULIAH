# Dokumentasi Widget: Image.memory

## 1. Penjelasan Singkat & Fungsi
Konstruktor `Image.memory` memuat dan menampilkan gambar langsung dari susunan bait memori biner (`Uint8List`).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `bytes` | `Uint8List` | Data biner memori penyusun gambar. |
| `width` | `double` | Lebar fisik gambar. |
| `height` | `double` | Tinggi fisik gambar. |
| `fit` | `BoxFit` | Modus penyesuaian gambar pada bingkai. |
| `scale` | `double` | Skala perbesaran gambar. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';

void main() {
  runApp(const ImageMemoryDemoApp());
}

class ImageMemoryDemoApp extends StatelessWidget {
  const ImageMemoryDemoApp({super.key});

  static final Uint8List transparentBytes = Uint8List.fromList([
    0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D,
    0x49, 0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
    0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4, 0x89, 0x00, 0x00, 0x00,
    0x0A, 0x49, 0x44, 0x41, 0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00,
    0x05, 0x00, 0x01, 0x0D, 0x0A, 0x2D, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x49,
    0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Image.memory')),
        body: Center(
          child: Image.memory(
            transparentBytes,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Perender Kode QR Presensi Digital dari Data Memori Base64)

```dart
import 'dart:typed_data';
import 'package:flutter/material.dart';

void main() {
  runApp(const QrMemoryImageApp());
}

class QrMemoryImageApp extends StatelessWidget {
  const QrMemoryImageApp({super.key});

  static final Uint8List qrBytes = Uint8List.fromList([
    0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x00, 0x00, 0x00, 0x0D,
    0x49, 0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
    0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4, 0x89, 0x00, 0x00, 0x00,
    0x0A, 0x49, 0x44, 0x41, 0x54, 0x78, 0x9C, 0x63, 0x00, 0x01, 0x00, 0x00,
    0x05, 0x00, 0x01, 0x0D, 0x0A, 0x2D, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x49,
    0x45, 0x4E, 0x44, 0xAE, 0x42, 0x60, 0x82
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('QR Presensi Kelas'), backgroundColor: Colors.indigo),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.indigo)),
                child: Image.memory(
                  qrBytes,
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 12),
              const Text('Tunjukkan QR Code ini kepada Dosen'),
            ],
          ),
        ),
      ),
    );
  }
}
```
