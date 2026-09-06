# Dokumentasi Widget: TabBar

## 1. Deskripsi & Fungsi Modul

Widget `TabBar` merupakan komponen bilah tab navigasi horizontal pada Flutter yang menampilkan deretan item `Tab` untuk berpindah antartampilan modul dalam satu layar utama. Komponen ini dilengkapi dengan indikator visual garis bawah (*indicator*) atau bentuk kapsul dinamis. Dalam Sistem Informasi Akademik (SIAKAD), `TabBar` digunakan untuk mengelompokkan sub-modul seperti Tab "Jadwal Kuliah", Tab "Tugas & Ujian", dan Tab "Presensi Mahasiswa".

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `tabs` | `List<Widget>` | **(WAJIB)** Daftar widget `Tab` yang berisi ikon dan/atau teks label judul tab. |
| `controller` | `TabController?` | Pengontrol status dan transisi animasi perpindahan indeks tab. |
| `isScrollable` | `bool` | Menentukan apakah bilah tab dapat digeser secara horizontal jika jumlah tab melebihi lebar layar. |
| `indicatorColor` | `Color?` | Warna garis indikator visual di bawah tab yang sedang aktif. |
| `indicatorWeight` | `double` | Ketebalan garis indikator tab terpilih dalam satuan piksel. |
| `labelColor` | `Color?` | Warna teks dan ikon untuk item tab yang sedang dipilih/aktif. |
| `unselectedLabelColor` | `Color?` | Warna teks dan ikon untuk item tab yang tidak sedang aktif. |
| `onTap` | `ValueChanged<int>?` | Callback fungsi yang dipanggil saat salah satu item tab ditekan oleh pengguna. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicTabBarApp());
}

class BasicTabBarApp extends StatelessWidget {
  const BasicTabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Basic TabBar'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Beranda'),
                Tab(icon: Icon(Icons.book), text: 'Mata Kuliah'),
                Tab(icon: Icon(Icons.person), text: 'Profil'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Halaman Beranda')),
              Center(child: Text('Halaman Mata Kuliah')),
              Center(child: Text('Halaman Profil')),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Portal Sub-Modul Akademik Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadAcademicTabApp());
}

class SiakadAcademicTabApp extends StatelessWidget {
  const SiakadAcademicTabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal Akademik SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const AcademicTabScreen(),
    );
  }
}

class AcademicTabScreen extends StatelessWidget {
  const AcademicTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PORTAL AKADEMIK SEMESTER'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.amber,
            indicatorWeight: 3,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.calendar_month), text: 'Jadwal Kuliah'),
              Tab(icon: Icon(Icons.assignment), text: 'Tugas & Quiz'),
              Tab(icon: Icon(Icons.qr_code), text: 'Presensi Kelas'),
              Tab(icon: Icon(Icons.grade), text: 'Nilai KHS'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            JadwalKuliahTab(),
            TugasQuizTab(),
            PresensiTab(),
            NilaiKhsTab(),
          ],
        ),
      ),
    );
  }
}

class JadwalKuliahTab extends StatelessWidget {
  const JadwalKuliahTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.indigo, child: Icon(Icons.book, color: Colors.white)),
            title: Text('Pemrograman Terintegrasi Sistem'),
            subtitle: Text('Senin (08:00 - 10:30) | Lab Komputer 3'),
            trailing: Text('3 SKS', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}

class TugasQuizTab extends StatelessWidget {
  const TugasQuizTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Daftar Tugas & Quiz Aktif Perkuliahan'));
  }
}

class PresensiTab extends StatelessWidget {
  const PresensiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Rekapitulasi Kehadiran Presensi Perkuliahan'));
  }
}

class NilaiKhsTab extends StatelessWidget {
  const NilaiKhsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Kartu Hasil Studi (KHS) Semester Ini'));
  }
}
```
