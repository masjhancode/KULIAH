# Dokumentasi Widget: Flexible

## 1. Penjelasan Singkat & Fungsi
Widget `Flexible` memberikan fleksibilitas bagi anak dari `Row`, `Column`, atau `Flex` untuk mengembang atau menyusut secara proporsional tanpa memaksa pengisian ruang penuh.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `flex` | `int` | Faktor pembagi rasio pembagian ruang (default: 1). |
| `fit` | `FlexFit` | Pengaturan pemenuhan ruang (FlexFit.loose = menyusut sesuai konten, FlexFit.tight = sama dengan Expanded). |
| `child` | `Widget` | Widget anak penampung. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FlexibleDemoApp());
}

class FlexibleDemoApp extends StatelessWidget {
  const FlexibleDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Flexible')),
        body: Row(
          children: [
            Flexible(fit: FlexFit.loose, child: Container(color: Colors.blue, child: const Text('Flexible Loose'))),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Baris Informasi Mahasiswa Fleksibel Bebas Error Overflow)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentFlexibleRowApp());
}

class StudentFlexibleRowApp extends StatelessWidget {
  const StudentFlexibleRowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Info Dosen PA'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const CircleAvatar(backgroundColor: Colors.indigo, child: Icon(Icons.person, color: Colors.white)),
              const SizedBox(width: 12),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Dr. Ir. Hendra Prasetya, M.T., Ph.D.', style: TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                    Text('Dosen Pembimbing Akademik Utama', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
