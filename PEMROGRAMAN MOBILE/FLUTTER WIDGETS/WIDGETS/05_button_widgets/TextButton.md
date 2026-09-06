# Dokumentasi Widget: TextButton

## 1. Penjelasan Singkat & Fungsi
Widget `TextButton` merupakan tombol berbasis teks polos tanpa garis tepi atau bayangan. Digunakan untuk aksi ringan seperti navigasi tautan, "Lupa Password", atau dialog action.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onPressed` | `VoidCallback` | Callback respon saat tombol ditekan. |
| `child` | `Widget` | Widget teks di dalam tombol. |
| `style` | `ButtonStyle` | Kustomisasi warna teks dan efek hover/splash. |
| `onLongPress` | `VoidCallback` | Callback saat ditekan lama. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const TextButtonDemoApp());
}

class TextButtonDemoApp extends StatelessWidget {
  const TextButtonDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo TextButton')),
        body: Center(
          child: TextButton(
            onPressed: () {},
            child: const Text('Lupa Kata Sandi?'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tautan "Lihat Semua Pengumuman Kampus")

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ViewAllNewsApp());
}

class ViewAllNewsApp extends StatelessWidget {
  const ViewAllNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pengumuman Kampus', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: const Text('Lihat Semua >', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
