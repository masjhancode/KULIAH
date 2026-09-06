# Dokumentasi Widget: Text

## 1. Penjelasan Singkat & Fungsi
Widget `Text` digunakan untuk menampilkan string teks tunggal atau multi-baris pada antarmuka aplikasi. Fungsi utamanya adalah menyajikan informasi tekstual seperti label, deskripsi, judul, atau konten bacaan kepada pengguna.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `data` | `String` | Teks utama yang akan ditampilkan pada layar. |
| `style` | `TextStyle` | Mengatur tata gaya teks seperti jenis font, warna, ukuran, dan bobot huruf. |
| `textAlign` | `TextAlign` | Menentukan perataan posisi teks (left, right, center, justify). |
| `overflow` | `TextOverflow` | Menangani perilaku penayangan saat teks melebihi ruang (ellipsis, clip, fade). |
| `maxLines` | `int` | Batas maksimum jumlah baris teks yang diizinkan untuk dirrender. |
| `softWrap` | `bool` | Menentukan apakah teks otomatis berpindah baris jika mencapai batas layar. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const TextDemoApp());
}

class TextDemoApp extends StatelessWidget {
  const TextDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Text Widget')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Sistem Informasi Akademik Perguruan Tinggi',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Judul & Banner Selamat Datang Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const WelcomeBannerApp());
}

class WelcomeBannerApp extends StatelessWidget {
  const WelcomeBannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo.shade50,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'SELAMAT DATANG',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.indigo, letterSpacing: 1.2),
                ),
                SizedBox(height: 4),
                Text(
                  'Ahmad Fauzi, S.Kom.',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                SizedBox(height: 8),
                Text(
                  'Program Studi Teknik Informatika - Fakultas Ilmu Komputer',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
