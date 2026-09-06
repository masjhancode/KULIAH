# Dokumentasi Widget: Image.network

## 1. Penjelasan Singkat & Fungsi
Konstruktor `Image.network` memuat dan menampilkan gambar secara dinamis dari tautan URL internet melalui protokol HTTP/HTTPS.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `src` | `String` | Alamat URL gambar (misal: "https://domain.ac.id/foto.jpg"). |
| `width` | `double` | Lebar fisik gambar. |
| `height` | `double` | Tinggi fisik gambar. |
| `fit` | `BoxFit` | Modus penyesuaian gambar pada bingkai. |
| `loadingBuilder` | `ImageLoadingBuilder` | Callback widget yang ditayangkan saat proses mengunduh gambar sedang berlangsung. |
| `errorBuilder` | `ImageErrorBuilder` | Callback widget pengganti jika gambar gagal diunduh. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ImageNetworkDemoApp());
}

class ImageNetworkDemoApp extends StatelessWidget {
  const ImageNetworkDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Image.network')),
        body: Center(
          child: Image.network(
            'https://via.placeholder.com/200',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Perender Foto Profil Mahasiswa Dinamis dari Cloud Storage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentNetworkPhotoApp());
}

class StudentNetworkPhotoApp extends StatelessWidget {
  const StudentNetworkPhotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Profil Mahasiswa'), backgroundColor: Colors.indigo),
        body: Center(
          child: ClipOval(
            child: Image.network(
              'https://via.placeholder.com/150',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  width: 120,
                  height: 120,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.account_circle, size: 120, color: Colors.grey);
              },
            ),
          ),
        ),
      ),
    );
  }
}
```
