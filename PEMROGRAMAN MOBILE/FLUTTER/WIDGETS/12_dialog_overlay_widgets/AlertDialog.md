# Dokumentasi Widget: AlertDialog

## 1. Penjelasan Singkat & Fungsi
Widget `AlertDialog` menampilkan jendela dialog peringatan atau konfirmasi modal di atas konten utama untuk meminta keputusan aksi eksplisit dari pengguna.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `title` | `Widget` | Widget judul dialog peringatan. |
| `content` | `Widget` | Widget isi pesan penjelas dialog. |
| `actions` | `List<Widget>` | Daftar tombol aksi keputusan (seperti TextButton Batal dan Setuju). |
| `shape` | `ShapeBorder` | Bentuk dan radius lengkungan sudut dialog. |
| `backgroundColor` | `Color` | Warna latar belakang panel dialog. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AlertDialogDemoApp());
}

class AlertDialogDemoApp extends StatelessWidget {
  const AlertDialogDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo AlertDialog')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Peringatan'),
                  content: const Text('Apakah Anda yakin ingin menghapus data?'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('Hapus')),
                  ],
                ),
              );
            },
            child: const Text('Tampilkan Dialog'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Dialog Peringatan Konfirmasi Pembatalan KRS)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KrsCancelAlertDialogApp());
}

class KrsCancelAlertDialogApp extends StatelessWidget {
  const KrsCancelAlertDialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pengisian KRS'), backgroundColor: Colors.indigo),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  title: const Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Batalkan Mata Kuliah?'),
                    ],
                  ),
                  content: const Text('Apakah Anda yakin ingin membatalkan pengambilan Pemrograman Seluler II (3 SKS)?'),
                  actions: [
                    OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text('Tidak')),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Ya, Batalkan', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Batalkan Matkul KRS', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
```
