# Dokumentasi Widget: MaterialBanner

## 1. Deskripsi & Fungsi Modul

Widget `MaterialBanner` merupakan komponen spanduk pengumuman yang muncul di bagian atas layar di bawah `AppBar` pada Flutter. Berbeda dari `SnackBar` yang hilang secara otomatis dalam hitungan detik, `MaterialBanner` tetap persisten di layar hingga pengguna secara eksplisit menekan tombol tindakan (seperti "Tutup" atau "Bayar UKT"). Dalam Sistem Informasi Akademik (SIAKAD), widget ini digunakan untuk menayangkan pengumuman penting darurat, seperti masa perpanjangan pembayaran UKT atau pemberitahuan belum menyelesaikan evaluasi DPA.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `content` | `Widget` | **(WAJIB)** Widget pesan isi pengumuman utama (biasanya `Text`). |
| `actions` | `List<Widget>` | **(WAJIB)** Daftar widget tombol tindakan (misal `TextButton('Bayar')`, `TextButton('Tutup')`). |
| `leading` | `Widget?` | Widget ikon tambahan di sisi kiri teks pengumuman (misal `Icon(Icons.warning)`). |
| `backgroundColor` | `Color?` | Warna latar belakang bidang spanduk banner pengumuman. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicMaterialBannerApp());
}

class BasicMaterialBannerApp extends StatelessWidget {
  const BasicMaterialBannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic MaterialBanner')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showMaterialBanner(
                MaterialBanner(
                  content: const Text('Ini adalah pengumuman MaterialBanner persisten.'),
                  leading: const Icon(Icons.info),
                  actions: [
                    TextButton(
                      onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                      child: const Text('TUTUP'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Tampilkan Banner'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Banner Peringatan Pembayaran UKT SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadBannerApp());
}

class SiakadBannerApp extends StatelessWidget {
  const SiakadBannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banner SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const BannerHomeScreen(),
    );
  }
}

class BannerHomeScreen extends StatelessWidget {
  const BannerHomeScreen({super.key});

  void _showUktBanner(BuildContext context) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        backgroundColor: Colors.amber.shade100,
        leading: const Icon(Icons.warning_amber_rounded, color: Colors.amber, size: 36),
        content: const Text(
          'PEMBERITAHUAN UKT: Batas waktu pembayaran UKT Semester Ganjil diperpanjang hingga 31 Agustus 2026.',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('NANTI'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('BAYAR ONLINE'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DASHBOARD SIAKAD'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showUktBanner(context),
          child: const Text('Simulasi Pemicuan Banner Pengumuman'),
        ),
      ),
    );
  }
}
```
