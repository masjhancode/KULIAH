# Dokumentasi Widget: SnackBar

## 1. Penjelasan Singkat & Fungsi
Widget `SnackBar` menyajikan pesan pemberitahuan melayang singkat di bagian bawah layar untuk memberikan umpan balik aksi transaksional.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `content` | `Widget` | Widget isi pesan teks notifikasi. |
| `action` | `SnackBarAction` | Tombol aksi opsional di dalam SnackBar (seperti Batal/Undo). |
| `duration` | `Duration` | Durasi waktu tayang pesan (default: 4 detik). |
| `backgroundColor` | `Color` | Warna latar belakang baris notifikasi. |

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
                const SnackBar(content: Text('Pesan Berhasil Disimpan!')),
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

### 3.2 Contoh Kode Studi Kasus UI (Notifikasi Umpan Balik Status Submit KRS dengan Undo)

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
        appBar: AppBar(title: const Text('Pengajuan KRS'), backgroundColor: Colors.indigo),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.indigo,
                  content: const Text('KRS Berhasil Disimpan!'),
                  action: SnackBarAction(
                    label: 'BATALKAN',
                    textColor: Colors.amber,
                    onPressed: () {},
                  ),
                ),
              );
            },
            child: const Text('Submit KRS', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
```
