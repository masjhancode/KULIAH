# Dokumentasi Widget: ClipOval

## 1. Deskripsi & Fungsi Modul

Widget `ClipOval` merupakan komponen pemotong visual pada Flutter yang memotong anak widgetnya menjadi bentuk lingkaran (*circle*) atau elips (*oval*). Dalam Sistem Informasi Akademik (SIAKAD), `ClipOval` digunakan untuk membuat foto avatar profil pengguna (Mahasiswa, Dosen PA, dan Kaprodi) pada header aplikasi dan item daftar obrolan bimbingan skripsi.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget?` | Widget anak yang akan dipotong menjadi lingkaran (biasanya `Image` atau `Container`). |
| `clipBehavior` | `Clip` | Perilaku kehalusan algoritma pemotongan piksel lingkaran (`Clip.antiAlias`). |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicClipOvalApp());
}

class BasicClipOvalApp extends StatelessWidget {
  const BasicClipOvalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic ClipOval')),
        body: Center(
          child: ClipOval(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.indigo,
              child: const Icon(Icons.person, color: Colors.white, size: 60),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Avatar Profil Dosen PA Bimbingan SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadClipOvalApp());
}

class SiakadClipOvalApp extends StatelessWidget {
  const SiakadClipOvalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatar Dosen SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const AvatarDosenScreen(),
    );
  }
}

class AvatarDosenScreen extends StatelessWidget {
  const AvatarDosenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFIL DOSEN PEMBIMBING'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipOval(
                    child: Container(
                      width: 110,
                      height: 110,
                      color: Colors.indigo.shade100,
                      child: const Icon(Icons.person, size: 80, color: Colors.indigo),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.check, size: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Dr. Eng. Ir. Hendra, M.T.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const Text('NIDN: 0018097501 | Dosen Pembimbing Utama'),
          ],
        ),
      ),
    );
  }
}
```
