# Dokumentasi Widget: InkWell

## 1. Penjelasan Singkat & Fungsi
Widget `InkWell` mendeteksi gestur sentuhan sekaligus menampilkan efek riak gelombang air (*ink splash ripple*) berstandar Material Design.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onTap` | `VoidCallback` | Callback fungsi respon saat area diklik/ditekan. |
| `child` | `Widget` | Widget anak yang dibungkus oleh area riak. |
| `splashColor` | `Color` | Warna gelombang riak air yang menyebar saat ditekan. |
| `highlightColor` | `Color` | Warna sorotan latar saat ditekan lama. |
| `borderRadius` | `BorderRadius` | Radius lengkungan sudut area gelombang riak. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const InkWellDemoApp());
}

class InkWellDemoApp extends StatelessWidget {
  const InkWellDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo InkWell')),
        body: Center(
          child: InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('InkWell dengan Ripple Effect'),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tombol Menu Dasbor SIAKAD dengan Efek Ripple Indigo)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadMenuInkWellApp());
}

class SiakadMenuInkWellApp extends StatelessWidget {
  const SiakadMenuInkWellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Menu Dasbor'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Material(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              splashColor: Colors.indigo.withOpacity(0.3),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(Icons.calendar_month, color: Colors.indigo, size: 32),
                    SizedBox(width: 16),
                    Text('Lihat Jadwal Kuliah', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
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
