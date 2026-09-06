# Dokumentasi Widget: VerticalDivider

## 1. Penjelasan Singkat & Fungsi
Widget `VerticalDivider` menggambar garis pemisah vertikal di dalam komponen berformat tata letak horizontal (`Row`).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `width` | `double` | Ruang lebar horizontal total yang ditempati garis pemisah. |
| `thickness` | `double` | Ketebalan fisik garis vertikal. |
| `color` | `Color` | Warna garis vertikal. |
| `indent` | `double` | Jarak kosong batas atas. |
| `endIndent` | `double` | Jarak kosong batas bawah. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const VerticalDividerDemoApp());
}

class VerticalDividerDemoApp extends StatelessWidget {
  const VerticalDividerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo VerticalDivider')),
        body: const SizedBox(
          height: 50,
          child: Row(
            children: [
              Text('Kiri'),
              VerticalDivider(),
              Text('Kanan'),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pemisah Kolom Statistik IPK, SKS, dan Semester)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const StatVerticalDividerApp());
}

class StatVerticalDividerApp extends StatelessWidget {
  const StatVerticalDividerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Statistik Akademik'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(10)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [Text('IPK'), Text('3.85', style: TextStyle(fontWeight: FontWeight.bold))]),
                VerticalDivider(thickness: 1, color: Colors.indigo),
                Column(children: [Text('SKS'), Text('112', style: TextStyle(fontWeight: FontWeight.bold))]),
                VerticalDivider(thickness: 1, color: Colors.indigo),
                Column(children: [Text('Semester'), Text('6', style: TextStyle(fontWeight: FontWeight.bold))]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
