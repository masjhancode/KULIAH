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

### 3.2 Contoh Kode Studi Upoload File di galeri dan pratinjau foto

Tambahkan package
`flutter pub add image_picker`

`bash
dependencies:
  flutter:
    sdk: flutter
  image_picker: ^1.1.2
`

```dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const PaymentReceiptFileApp());
}

class PaymentReceiptFileApp extends StatefulWidget {
  const PaymentReceiptFileApp({super.key});

  @override
  State<PaymentReceiptFileApp> createState() =>
      _PaymentReceiptFileAppState();
}

class _PaymentReceiptFileAppState extends State<PaymentReceiptFileApp> {
  File? selectedReceiptFile;

  final ImagePicker picker = ImagePicker();

  Future<void> pickReceiptFromGallery() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        selectedReceiptFile = File(image.path);
      });
    }
  }

  Future<void> takeReceiptPhoto() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        selectedReceiptFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Upload Bukti Transfer SPP'),
          backgroundColor: Colors.indigo,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Pratinjau Foto Bukti Transfer:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // Preview foto
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.antiAlias,
                child: selectedReceiptFile != null
                    ? Image.file(
                        selectedReceiptFile!,
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Text(
                          'Foto Bukti Transfer Belum Dipilih',
                        ),
                      ),
              ),

              const SizedBox(height: 20),

              // Tombol pilih dari galeri
              ElevatedButton.icon(
                onPressed: pickReceiptFromGallery,
                icon: const Icon(Icons.photo_library),
                label: const Text('Pilih dari Galeri'),
              ),

              const SizedBox(height: 10),

              // Tombol kamera
              OutlinedButton.icon(
                onPressed: takeReceiptPhoto,
                icon: const Icon(Icons.camera_alt),
                label: const Text('Ambil Foto'),
              ),

              const SizedBox(height: 20),

              // Tombol upload
              if (selectedReceiptFile != null)
                ElevatedButton(
                  onPressed: () {
                    // TODO:
                    // Upload selectedReceiptFile ke server/API
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Upload Bukti Transfer'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
```
