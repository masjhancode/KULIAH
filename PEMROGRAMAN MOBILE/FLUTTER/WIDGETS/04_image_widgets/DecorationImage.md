# Dokumentasi Widget: DecorationImage

## 1. Penjelasan Singkat & Fungsi
Kelas `DecorationImage` digunakan untuk melukis gambar di dalam objek dekorasi `BoxDecoration` pada widget `Container`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `image` | `ImageProvider` | Objek penyedia sumber gambar dekorasi (AssetImage, NetworkImage). |
| `fit` | `BoxFit` | Pengaturan penyesuaian penuangan gambar pada latar belakang kontainer. |
| `alignment` | `AlignmentGeometry` | Posisi orientasi penjajaran gambar. |
| `repeat` | `ImageRepeat` | Pengulangan pola gambar (repeat, repeatX, repeatY, noRepeat). |
| `colorFilter` | `ColorFilter` | Filter pewarnaan / pencampuran warna gambar dekorasi. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DecorationImageDemoApp());
}

class DecorationImageDemoApp extends StatelessWidget {
  const DecorationImageDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo DecorationImage')),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/200'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Latar Belakang Kartu Mahasiswa (KTM) ber-Watermark Lambang Kampus)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KtmDecorationImageApp());
}

class KtmDecorationImageApp extends StatelessWidget {
  const KtmDecorationImageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('KTM Digital Background'), backgroundColor: Colors.indigo),
        body: Center(
          child: Container(
            width: 320,
            height: 190,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.indigo.shade900,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: const NetworkImage('https://via.placeholder.com/300/FFFFFF/000000?text=LOGO'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.indigo.shade900.withOpacity(0.15), BlendMode.dstATop),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('UNIVERSITAS SIAKAD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ahmad Fauzi', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('NIM: 2026090123', style: TextStyle(color: Colors.white70)),
                  ],
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
