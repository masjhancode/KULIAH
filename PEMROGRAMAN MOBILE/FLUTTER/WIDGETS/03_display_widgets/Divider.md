# Dokumentasi Widget: Divider

## 1. Penjelasan Singkat & Fungsi
Widget `Divider` menggambar garis pemisah horizontal tipis di antara komponen-komponen antarmuka.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `height` | `double` | Ruang tinggi vertikal total yang ditempati garis pembatas. |
| `thickness` | `double` | Ketebalan fisik garis pembatas. |
| `color` | `Color` | Warna garis pembatas. |
| `indent` | `double` | Jarak kosong sebelum awal garis (kiri). |
| `endIndent` | `double` | Jarak kosong setelah akhir garis (kanan). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DividerDemoApp());
}

class DividerDemoApp extends StatelessWidget {
  const DividerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Divider')),
        body: const Column(
          children: [
            Text('Seksi Atas'),
            Divider(thickness: 2),
            Text('Seksi Bawah'),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pembatas Seksi Informasi Akademik & Kartu Hasil Studi)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DividerSectionApp());
}

class DividerSectionApp extends StatelessWidget {
  const DividerSectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Ringkasan Studi'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Ringkasan Akademik', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('IPK Kumulatif: 3.85'),
              Divider(height: 32, thickness: 1.5, color: Colors.indigo),
              Text('Daftar Transkrip Nilai', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
```
