# Dokumentasi Widget: 02. NavigationBar (Material 3)

## 1. Deskripsi & Fungsi Modul

Widget `NavigationBar` merupakan komponen bilah navigasi bawah (*bottom navigation bar*) standar **Material 3** pada Flutter. Widget ini digunakan untuk mengelola perpindahan antarlayar utama (*top-level destinations*) dalam aplikasi mobile Sistem Informasi Akademik (SIAKAD).

### 1.1 Aktor Pengguna
1. **Mahasiswa**: Mengakses layar Beranda, Jadwal Perkuliahan, Kartu Rencana Studi (KRS), dan Profil Akademik.
2. **Dosen Pembimbing Akademik (DPA)**: Navigasi antara Dashboard Advising, Persetujuan KRS, Penginputan Nilai, dan Data Bimbingan.
3. **Administrator Akademik**: Mengelola validasi master data perkuliahan, penjadwalan ruang, dan laporan akreditasi.

### 1.2 Referensi Regulasi
1. **UU No. 12 Tahun 2012 tentang Pendidikan Tinggi (UU Dikti)**:
   - *Pasal 35*: Penyelenggaraan layanan informasi akademik secara efisien dan terintegrasi untuk mendukung proses pembelajaran mahasiswa.
2. **Permendikbudristek No. 53 Tahun 2023 tentang Penjaminan Mutu Pendidikan Tinggi**:
   - Menuntut keterbukaan akses data akademik dan kemudahan antarmuka pengguna dalam sistem informasi akademik perguruan tinggi.
3. **Standar PDDikti & BAN-PT (Kriteria 3: Kemahasiswaan)**:
   - Menjamin bahwa sistem informasi kampus memiliki navigasi yang intuitif, stabil, dan memenuhi standar aksesibilitas antarmuka pengguna.

---

## 2. Alur Proses & Kebutuhan Fungsional

### 2.1 Alur Proses Navigasi Antarlayar
1. Pengguna membuka aplikasi mobile SIAKAD dan menyelesaikan proses autentikasi (login).
2. Pengguna menekan salah satu ikon destinasi pada `NavigationBar` di bagian bawah layar.
3. Objek callback `onDestinationSelected(index)` terpicu, memperbarui status indeks halaman terpilih (`selectedIndex`).
4. Antarmuka utama (*body*) memperbarui tampilan ke modul target tanpa merusak tumpukan (*navigation stack*) utama.

### 2.2 Kebutuhan Fungsional

| ID Kebutuhan | Deskripsi Kebutuhan Fungsional | Label Prioritas |
| :--- | :--- | :--- |
| **REQ-NAV-01** | Sistem **WAJIB** menyediakan bilah navigasi bawah dengan 3 hingga 5 destinasi utama yang dapat diakses pengguna. | `[WAJIB]` |
| **REQ-NAV-02** | Sistem **WAJIB** menampilkan indikator visual terpilih (*active selection indicator*) pada tab yang sedang dibuka. | `[WAJIB]` |
| **REQ-NAV-03** | Sistem **SEHARUSNYA** mendukung penyematkan badge notifikasi pada ikon destinasi (seperti pemberitahuan KRS belum diverifikasi). | `[SEHARUSNYA]` |
| **REQ-NAV-04** | Sistem **DAPAT** menguraikan animasi transisi pergeseran indikator visual secara halus sesuai tema Material 3. | `[DAPAT]` |

---

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `destinations` | `List<Widget>` | **(WAJIB)** Daftar widget `NavigationDestination` atau `Badge` yang menentukan ikon dan label menu navigasi. |
| `selectedIndex` | `int` | **(WAJIB)** Indeks berbasis nol dari destinasi yang sedang aktif/terpilih saat ini. |
| `onDestinationSelected` | `ValueChanged<int>?` | Callback fungsi yang dipanggil saat pengguna memilih/mengetuk salah satu item destinasi. |
| `indicatorColor` | `Color?` | Warna latar belakang dari bentuk indikator sorot pada destinasi terpilih. |
| `backgroundColor` | `Color?` | Warna latar belakang seluruh area bilah `NavigationBar`. |
| `elevation` | `double?` | Tingkat ketinggian bayangan visual (*elevation*) dari widget navigasi. |
| `labelBehavior` | `NavigationDestinationLabelBehavior?` | Mengatur mode penampakan label (misal: `alwaysShow`, `alwaysHide`, `onlyShowSelected`). |
| `height` | `double?` | Ketinggian vertikal dari bilah navigasi dalam satuan piksel. |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicNavigationBarApp());
}

class BasicNavigationBarApp extends StatefulWidget {
  const BasicNavigationBarApp({super.key});

  @override
  State<BasicNavigationBarApp> createState() => _BasicNavigationBarAppState();
}

class _BasicNavigationBarAppState extends State<BasicNavigationBarApp> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic NavigationBar')),
        body: Center(
          child: Text(
            'Halaman ke-${_currentPageIndex + 1}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Beranda',
            ),
            NavigationDestination(
              icon: Icon(Icons.book_outlined),
              selectedIcon: Icon(Icons.book),
              label: 'KRS',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Portal Akademik Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadNavigationBarApp());
}

class SiakadNavigationBarApp extends StatelessWidget {
  const SiakadNavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIAKAD Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const SiakadMainScreen(),
    );
  }
}

class SiakadMainScreen extends StatefulWidget {
  const SiakadMainScreen({super.key});

  @override
  State<SiakadMainScreen> createState() => _SiakadMainScreenState();
}

class _SiakadMainScreenState extends State<SiakadMainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    BerandaTab(),
    JadwalTab(),
    KrsTab(),
    ProfilTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SIAKAD PORTAL UTAMA',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 70,
        elevation: 3,
        selectedIndex: _selectedIndex,
        indicatorColor: Colors.indigo.shade100,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard, color: Colors.indigo),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month, color: Colors.indigo),
            label: 'Jadwal',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('3'),
              child: Icon(Icons.assignment_outlined),
            ),
            selectedIcon: Badge(
              label: Text('3'),
              child: Icon(Icons.assignment, color: Colors.indigo),
            ),
            label: 'KRS',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_outlined),
            selectedIcon: Icon(Icons.account_circle, color: Colors.indigo),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class BerandaTab extends StatelessWidget {
  const BerandaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          color: Colors.indigo.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang, Ahmad Fauzi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
                SizedBox(height: 4),
                Text('NIM: 2026090123 | Program Studi Teknik Informatika'),
                Divider(height: 20),
                Text('IPK Kumulatif: 3.85 | SKS Lulus: 110 SKS'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class JadwalTab extends StatelessWidget {
  const JadwalTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Modul Jadwal Perkuliahan & Ujian', style: TextStyle(fontSize: 16)),
    );
  }
}

class KrsTab extends StatelessWidget {
  const KrsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Modul Pengisian & Validasi KRS Semester Ganjil', style: TextStyle(fontSize: 16)),
    );
  }
}

class ProfilTab extends StatelessWidget {
  const ProfilTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Modul Biodata & Transkrip Mahasiswa', style: TextStyle(fontSize: 16)),
    );
  }
}
```
