# Dokumentasi Widget: CustomScrollView

## 1. Deskripsi & Fungsi Modul

Widget `CustomScrollView` merupakan komponen kontainer gulir tingkat lanjut (*advanced scroll view*) pada Flutter yang menggabungkan berbagai komponen bernuansa "Sliver" (seperti `SliverAppBar`, `SliverList`, `SliverGrid`, dan `SliverToBoxAdapter`) dalam satu viewport gulir bersama. Dalam Sistem Informasi Akademik (SIAKAD), widget ini digunakan untuk membangun halaman profil mahasiswa yang kompleks, di mana header gambar banner menyusut saat digulir, diikuti oleh daftar mata kuliah dan kisi rekapitulasi nilai.


## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `slivers` | `List<Widget>` | **(WAJIB)** Daftar widget slivers yang akan dikomposisikan dalam satu viewport gulir. |
| `controller` | `ScrollController?` | Pengontrol pergerakan offset dan pendengar peristiwa gestur gulir. |
| `physics` | `ScrollPhysics?` | Mengatur responsivitas efek fisik gulir (`BouncingScrollPhysics`, `ClampingScrollPhysics`). |
| `scrollDirection` | `Axis` | Arah alur gulir utama (default: `Axis.vertical`). |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicCustomScrollViewApp());
}

class BasicCustomScrollViewApp extends StatelessWidget {
  const BasicCustomScrollViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Basic CustomScrollView'),
              floating: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item $index')),
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Profil Akademik Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadProfileSliverApp());
}

class SiakadProfileSliverApp extends StatelessWidget {
  const SiakadProfileSliverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const ProfileSliverScreen(),
    );
  }
}

class ProfileSliverScreen extends StatelessWidget {
  const ProfileSliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180.0,
            pinned: true,
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Ahmad Fauzi (2026090123)', style: TextStyle(fontSize: 14)),
              background: Container(
                color: Colors.indigo.shade800,
                child: const Center(
                  child: Icon(Icons.school, size: 80, color: Colors.white24),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      Text('Status Akademik: AKTIF', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                      Text('IPK Kumulatif: 3.68 | SKS Lulus: 128 SKS'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: const Icon(Icons.book, color: Colors.indigo),
                  title: Text('Mata Kuliah Semester $index'),
                  subtitle: const Text('Status: LULUS (Nilai A)'),
                );
              },
              childCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
```
