# Dokumentasi Widget: DefaultTabController

## 1. Deskripsi & Fungsi Modul

Widget `DefaultTabController` merupakan komponen pembungkus deklaratif (*inherited widget*) yang secara otomatis membagikan objek `TabController` ke seluruh widget turunannya (seperti `TabBar` dan `TabBarView`). Widget ini sangat disukai karena menyederhanakan kode aplikasi tanpa perlu mengelola siklus hidup `TabController` secara manual menggunakan `StatefulWidget` atau `SingleTickerProviderStateMixin`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `length` | `int` | **(WAJIB)** Jumlah total item tab yang akan dikelola secara otomatis. |
| `child` | `Widget` | **(WAJIB)** Widget turunan yang akan menggunakan `TabController` otomatis (biasanya `Scaffold`). |
| `initialIndex` | `int` | Indeks tab awal yang aktif saat aplikasi pertama kali dirender (default: `0`). |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicDefaultTabControllerApp());
}

class BasicDefaultTabControllerApp extends StatelessWidget {
  const BasicDefaultTabControllerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Basic DefaultTabController'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Konten Halaman 1')),
              Center(child: Text('Konten Halaman 2')),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Portal Matriks Kurikulum & SKS SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadKurikulumTabApp());
}

class SiakadKurikulumTabApp extends StatelessWidget {
  const SiakadKurikulumTabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kurikulum SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const KurikulumScreen(),
    );
  }
}

class KurikulumScreen extends StatelessWidget {
  const KurikulumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('KURIKULUM & SEBARAN SKS'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.list_alt), text: 'Matakuliah Wajib'),
              Tab(icon: Icon(Icons.class_outlined), text: 'Matakuliah Pilihan'),
              Tab(icon: Icon(Icons.work_outline), text: 'Program MBKM'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MkWajibTab(),
            MkPilihanTab(),
            MbkmTab(),
          ],
        ),
      ),
    );
  }
}

class MkWajibTab extends StatelessWidget {
  const MkWajibTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            leading: Text('144 SKS', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
            title: Text('Pemrograman Terintegrasi Sistem'),
            subtitle: Text('Semester 4 | SKS: 3'),
          ),
        ),
      ],
    );
  }
}

class MkPilihanTab extends StatelessWidget {
  const MkPilihanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Daftar Rumpun Matakuliah Pilihan Keahlian'));
  }
}

class MbkmTab extends StatelessWidget {
  const MbkmTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Program Hak Belajar 3 Semester di Luar Prodi (MBKM)'));
  }
}
```
