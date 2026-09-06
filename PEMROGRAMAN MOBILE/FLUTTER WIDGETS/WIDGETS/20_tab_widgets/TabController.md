# Dokumentasi Widget: TabController

## 1. Deskripsi & Fungsi Modul

Kelas `TabController` merupakan objek pengontrol yang mengoordinasikan pemilihan tab, durasi animasi transisi, dan perubahan indeks aktif antara `TabBar` dan `TabBarView`. Objek ini umumnya diinisialisasi dalam `StatefulWidget` menggunakan `SingleTickerProviderStateMixin` ketika aplikasi membutuhkan akses manual ke peristiwa perubahan indeks tab (seperti pemicuan tombol luar untuk berpindah tab).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `length` | `int` | **(WAJIB)** Jumlah total item tab yang dikelola oleh pengontrol. |
| `vsync` | `TickerProvider` | **(WAJIB)** Penyedia ticker animasi (biasanya `this` dengan `SingleTickerProviderStateMixin`). |
| `initialIndex` | `int` | Indeks tab awal yang langsung aktif saat pertama kali dirender (default: `0`). |
| `index` | `int` | Indeks tab yang sedang aktif saat ini (dapat diubah secara manual untuk navigasi programatis). |
| `animation` | `Animation<double>?` | Objek animasi internal yang mencatat kemajuan transisi pergeseran tab. |
| `indexIsChanging` | `bool` | Status `true` jika tab sedang dalam proses transisi perpindahan ke indeks baru. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicTabControllerApp());
}

class BasicTabControllerApp extends StatefulWidget {
  const BasicTabControllerApp({super.key});

  @override
  State<BasicTabControllerApp> createState() => _BasicTabControllerAppState();
}

class _BasicTabControllerAppState extends State<BasicTabControllerApp>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic TabController'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Dosen'),
              Tab(text: 'Mahasiswa'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Center(child: Text('Data Dosen')),
            Center(child: Text('Data Mahasiswa')),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Navigasi Programatis Tab Portal Akademik SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadTabControllerApp());
}

class SiakadTabControllerApp extends StatelessWidget {
  const SiakadTabControllerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabController SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const CustomTabControllerScreen(),
    );
  }
}

class CustomTabControllerScreen extends StatefulWidget {
  const CustomTabControllerScreen({super.key});

  @override
  State<CustomTabControllerScreen> createState() => _CustomTabControllerScreenState();
}

class _CustomTabControllerScreenState extends State<CustomTabControllerScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      if (_controller.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MANAJEMEN TA / SKRIPSI'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.amber,
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.white,
          tabs: const [
            Tab(text: 'Pengajuan Proposal'),
            Tab(text: 'Log Bimbingan'),
            Tab(text: 'Jadwal Sidang'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          ProposalTab(),
          LogBimbinganTab(),
          SidangTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigasi programatis langsung ke Tab 1 (Log Bimbingan)
          _controller.animateTo(1);
        },
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Bimbingan'),
      ),
    );
  }
}

class ProposalTab extends StatelessWidget {
  const ProposalTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Status Proposal Skripsi: DISETUJUI'));
  }
}

class LogBimbinganTab extends StatelessWidget {
  const LogBimbinganTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.check, color: Colors.white)),
            title: Text('Bimbingan Bab 1 & Bab 2'),
            subtitle: Text('Revisi latar belakang masalah dan tinjauan pustaka'),
          ),
        ),
      ],
    );
  }
}

class SidangTab extends StatelessWidget {
  const SidangTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Jadwal Ujian Sidang Skripsi: Belum Terjadwal'));
  }
}
```
