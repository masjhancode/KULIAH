# Dokumentasi Widget: TabBarView

## 1. Deskripsi & Fungsi Modul

Widget `TabBarView` merupakan komponen tampilan wadah konten yang menampilkan tampilan halaman individual secara bergantian sesuai dengan tab yang sedang aktif pada `TabBar`. Widget ini mendukung transisi usapan horizontal (*swipe gesture*) antarhalaman yang tersinkronisasi secara otomatis dengan posisi tombol indikator tab.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `children` | `List<Widget>` | **(WAJIB)** Daftar widget tampilan halaman yang urutannya sesuai dengan daftar item `Tab` di `TabBar`. |
| `controller` | `TabController?` | Pengontrol animasi dan sinkronisasi perpindahan indeks halaman tab. |
| `physics` | `ScrollPhysics?` | Mengatur perilaku responsi usapan gestur gulir (misal `BouncingScrollPhysics` atau `NeverScrollableScrollPhysics`). |
| `dragStartBehavior` | `DragStartBehavior` | Menentukan kapan gestur seret usapan tab mulai direspons oleh aplikasi. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicTabBarViewApp());
}

class BasicTabBarViewApp extends StatelessWidget {
  const BasicTabBarViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Basic TabBarView'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Tab A'),
                Tab(text: 'Tab B'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Konten Halaman Tab A')),
              Center(child: Text('Konten Halaman Tab B')),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Dashboard Tabber Pengumuman & Berita SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadNewsTabApp());
}

class SiakadNewsTabApp extends StatelessWidget {
  const SiakadNewsTabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Informasi SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const NewsTabScreen(),
    );
  }
}

class NewsTabScreen extends StatelessWidget {
  const NewsTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PUSAT INFORMASI KAMPUS'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            labelColor: Colors.amber,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'Pengumuman'),
              Tab(text: 'Beasiswa'),
              Tab(text: 'Agenda Kegiatan'),
            ],
          ),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            PengumumanListTab(),
            BeasiswaListTab(),
            AgendaListTab(),
          ],
        ),
      ),
    );
  }
}

class PengumumanListTab extends StatelessWidget {
  const PengumumanListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ListTile(
            leading: Icon(Icons.campaign, color: Colors.indigo),
            title: Text('Jadwal Registrasi Ulang Semester Ganjil'),
            subtitle: Text('Batas Akhir: 31 Agustus 2026'),
          ),
        ),
      ],
    );
  }
}

class BeasiswaListTab extends StatelessWidget {
  const BeasiswaListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Informasi Pendaftaran Beasiswa Prestasi & KIP-K'));
  }
}

class AgendaListTab extends StatelessWidget {
  const AgendaListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Kalender Agenda Seminar & Wisuda'));
  }
}
```
