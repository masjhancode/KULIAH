# Dokumentasi Widget: AspectRatio

## 1. Penjelasan Singkat & Fungsi
Widget `AspectRatio` mengunci rasio perbandingan antara lebar dan tinggi (*aspect ratio*) dari widget anak agar tetap konstan di semua ukuran layar.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `aspectRatio` | `double` | Nilai perbandingan rasio lebar dibanding tinggi (misal: 16 / 9 atau 4 / 3) (wajib). |
| `child` | `Widget` | Widget anak terukur. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AspectRatioDemoApp());
}

class AspectRatioDemoApp extends StatelessWidget {
  const AspectRatioDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo AspectRatio')),
        body: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(color: Colors.indigo, child: const Center(child: Text('Rasio 16:9', style: TextStyle(color: Colors.white)))),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Bingkai Foto Kartu Mahasiswa (KTM) Ber-Rasio 4:3 Pasfoto Resmi)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentPhotoAspectRatioApp());
}

class StudentPhotoAspectRatioApp extends StatelessWidget {
  const StudentPhotoAspectRatioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pasfoto Kartu Ujian'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SizedBox(
              width: 200,
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    border: Border.all(color: Colors.indigo, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, size: 80, color: Colors.indigo),
                      SizedBox(height: 8),
                      Text('Pasfoto 3x4 Resmi', style: TextStyle(fontWeight: FontWeight.bold)),
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
