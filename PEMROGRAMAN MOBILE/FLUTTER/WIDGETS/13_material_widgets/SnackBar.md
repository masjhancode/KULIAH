# Dokumentasi Widget: SnackBar

## 1. Penjelasan Singkat & Fungsi
Widget `SnackBar` merupakan pesan pemberitahuan singkat yang muncul sementara di bagian bawah layar untuk memberikan umpan balik aksi pengguna (misal: "KRS Berhasil Disimpan").

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `content` | `Widget` | Widget isi pesan teks atau komponen informasi pada SnackBar. |
| `duration` | `Duration` | Durasi waktu penayangan SnackBar sebelum otomatis menghilang (default: 4 detik). |
| `action` | `SnackBarAction` | Tombol aksi cepat opsional yang disisipkan di sebelah kanan pesan. |
| `backgroundColor` | `Color` | Warna latar belakang kotak pesan SnackBar. |
| `behavior` | `SnackBarBehavior` | Gaya posisi penampilan (fixed di batas bawah atau floating melayang). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SnackBarDemoApp());
}

class SnackBarDemoApp extends StatelessWidget {
  const SnackBarDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo SnackBar')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pesan Berhasil Dikirim')),
              );
            },
            child: const Text('Tampilkan SnackBar'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Notifikasi Umpan Balik Simpan KRS Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KrsSnackBarApp());
}

class KrsSnackBarApp extends StatelessWidget {
  const KrsSnackBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pengisian KRS'), backgroundColor: Colors.indigo),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.white),
                      SizedBox(width: 12),
                      Text('KRS Semester Ganjil Berhasil Disimpan!'),
                    ],
                  ),
                  backgroundColor: Colors.green.shade700,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  action: SnackBarAction(
                    label: 'LIHAT',
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
              );
            },
            child: const Text('Simpan KRS Saya', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
```
