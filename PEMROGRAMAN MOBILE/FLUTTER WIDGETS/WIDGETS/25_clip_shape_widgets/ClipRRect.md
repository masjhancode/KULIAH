# Dokumentasi Widget: ClipRRect (Clip Rounded Rectangle)

## 1. Deskripsi & Fungsi Modul

Widget `ClipRRect` (Clip Rounded Rectangle) merupakan komponen pemotong bentuk visual (*clipping widget*) pada Flutter yang memotong anak widgetnya (*child*) mengikuti pola persegi panjang bersudut melengkung (*rounded corners*). Dalam Sistem Informasi Akademik (SIAKAD), `ClipRRect` digunakan untuk merender foto profil mahasiswa pada Kartu Tanda Mahasiswa (KTM) digital, spanduk pengumuman kampus, dan kartu visual mata kuliah agar terlihat rapi dan berestetika modern.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `borderRadius` | `BorderRadiusGeometry` | **(WAJIB)** Ukuran kelengkungan di keempat sudut persegi panjang (misal `BorderRadius.circular(16)`). |
| `child` | `Widget?` | Widget anak yang akan dipotong sudutnya (biasanya `Image`, `Container`, atau `Card`). |
| `clipBehavior` | `Clip` | Perilaku algoritma pemotongan piksel visual (`Clip.antiAlias`, `Clip.hardEdge`). |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicClipRRectApp());
}

class BasicClipRRectApp extends StatelessWidget {
  const BasicClipRRectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic ClipRRect')),
        body: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 150,
              height: 150,
              color: Colors.indigo,
              child: const Center(child: Text('Sudut Melengkung', style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Foto Profil KTM Digital Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadClipRRectApp());
}

class SiakadClipRRectApp extends StatelessWidget {
  const SiakadClipRRectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KTM Digital SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const KtmScreen(),
    );
  }
}

class KtmScreen extends StatelessWidget {
  const KtmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KTM DIGITAL MAHASISWA'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 120,
                    height: 150,
                    color: Colors.indigo.shade100,
                    child: const Icon(Icons.person, size: 90, color: Colors.indigo),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Ahmad Fauzi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const Text('NIM: 2026090123', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
                const Text('Teknik Informatika - S1'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
