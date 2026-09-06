# Dokumentasi Widget: Banner

## 1. Penjelasan Singkat & Fungsi
Widget `Banner` menampilkan pita penanda sudut (*corner badge ribbon*) untuk menyajikan label status (seperti "DRAFT" atau "RESMI").

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `message` | `String` | Teks pesan pada pita banner. |
| `location` | `BannerLocation` | Lokasi sudut penempatan pita (topStart, topEnd, bottomStart, bottomEnd). |
| `color` | `Color` | Warna latar belakang pita. |
| `child` | `Widget` | Widget yang dibungkus oleh pita banner. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BannerDemoApp());
}

class BannerDemoApp extends StatelessWidget {
  const BannerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Banner(
            message: 'DRAFT',
            location: BannerLocation.topEnd,
            color: Colors.red,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.amber.shade100,
              child: const Center(child: Text('Konten Document')),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pita Penanda Status KRS "BELUM DISETUJUI DPA")

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KrsBannerApp());
}

class KrsBannerApp extends StatelessWidget {
  const KrsBannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Status Pengajuan KRS'), backgroundColor: Colors.indigo),
        body: Center(
          child: ClipRect(
            child: Banner(
              message: 'DRAFT',
              location: BannerLocation.topEnd,
              color: Colors.orange,
              child: Card(
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(24),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('KRS Semester Ganjil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text('Menunggu persetujuan Dosen Pembimbing Akademik.'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
