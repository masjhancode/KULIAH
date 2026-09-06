# Dokumentasi Widget: 04. NavigationRail

## 1. Deskripsi & Fungsi Modul

Widget `NavigationRail` merupakan komponen bilah navigasi samping vertikal (*vertical side navigation rail*) pada Flutter. Widget ini ditempatkan di sisi kiri atau kanan layar untuk memfasilitasi navigasi responsif pada perangkat berukuran medium hingga besar (seperti tablet, iPad, lipat, atau desktop web SIAKAD).

### 1.1 Aktor Pengguna
1. **Administrator Akademik (Admin Kampus)**: Mengakses dasbor manajemen perkuliahan, penjadwalan ruang sidang, dan verifikasi berkas ijazah pada perangkat komputer/tablet.
2. **Ketua Program Studi (Kaprodi)**: Memantau ketercapaian kurikulum, plotting dosen pengampu, dan persetujuan ujian skripsi.
3. **Dosen / Mahasiswa Pengguna Tablet**: Menggunakan aplikasi antarmuka tata letak lebar (*wide layout*).

### 1.2 Referensi Regulasi
1. **UU No. 12 Tahun 2012 tentang Pendidikan Tinggi (UU Dikti)**:
   - *Pasal 35 & 45*: Optimalisasi tata kelola administrasi pendidikan tinggi berbasis teknologi informasi yang akuntabel dan multisistem.
2. **Permendikbudristek No. 53 Tahun 2023 tentang Penjaminan Mutu Pendidikan Tinggi**:
   - Fleksibilitas antarmuka pengguna pada berbagai perangkat perangkat keras untuk mendukung kelancaran operasional akademi.
3. **Standar BAN-PT (Kriteria 2: Tata Kelola dan Tata Pamong)**:
   - Penyediaan sarana tata kelola IT berbasis antarmuka responsif dan terintegrasi penuh dengan basis data PDDikti.

---

## 2. Alur Proses & Kebutuhan Fungsional

### 2.1 Alur Proses Navigasi Samping
1. Aplikasi SIAKAD mengukur lebar breakpoint antarmuka pengguna (`MediaQuery` atau `LayoutBuilder`).
2. Jika lebar layar memenuhi kriteria tablet/desktop (`width >= 600`), sistem menampilkan `NavigationRail` secara vertikal di sisi samping layar.
3. Pengguna mengklik item destinasi `NavigationRailDestination`.
4. Event `onDestinationSelected(index)` dieksekusi dan mengubah tampilan modul utama pada panel sebelah kanan.

### 2.2 Kebutuhan Fungsional

| ID Kebutuhan | Deskripsi Kebutuhan Fungsional | Label Prioritas |
| :--- | :--- | :--- |
| **REQ-NRL-01** | Sistem **WAJIB** merender bilah navigasi vertikal di samping kiri/kanan pada layar berukuran sedang dan besar. | `[WAJIB]` |
| **REQ-NRL-02** | Sistem **WAJIB** memperbarui indeks tampilan `selectedIndex` saat item dipilh oleh pengguna. | `[WAJIB]` |
| **REQ-NRL-03** | Sistem **SEHARUSNYA** menyediakan opsi perpanjangan label (`extended: true`) untuk menampilkan teks deskripsi di samping ikon pada layar lebar. | `[SEHARUSNYA]` |
| **REQ-NRL-04** | Sistem **DAPAT** menyisipkan widget `leading` (misal logo universitas) dan widget `trailing` (misal tombol profil/keluar) di dalam `NavigationRail`. | `[DAPAT]` |

---

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `destinations` | `List<NavigationRailDestination>` | **(WAJIB)** Daftar opsi destinasi vertikal yang berisi ikon dan label. |
| `selectedIndex` | `int?` | **(WAJIB)** Indeks item navigasi vertikal yang sedang dipilih. |
| `onDestinationSelected` | `ValueChanged<int>?` | Callback fungsi saat destinasi diklik oleh pengguna. |
| `extended` | `bool` | Menentukan apakah bilah navigasi dilebarkan untuk menampilkan ikon bersama label teks secara horizontal. |
| `leading` | `Widget?` | Widget opsional yang diletakkan di bagian atas bilah navigasi (misal: logo/avatar). |
| `trailing` | `Widget?` | Widget opsional yang diletakkan di bagian paling bawah bilah navigasi (misal: tombol setting/logout). |
| `groupAlignment` | `double?` | Menentukan posisi penjajaran vertikal item (`-1.0` untuk atas, `0.0` untuk tengah, `1.0` untuk bawah). |
| `labelType` | `NavigationRailLabelType?` | Mode tampilan label teks (`none`, `selected`, `all`). |
| `backgroundColor` | `Color?` | Warna latar belakang seluruh bilah `NavigationRail`. |
| `indicatorColor` | `Color?` | Warna latar belakang sorot indikator destinasi terpilih. |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicNavigationRailApp());
}

class BasicNavigationRailApp extends StatefulWidget {
  const BasicNavigationRailApp({super.key});

  @override
  State<BasicNavigationRailApp> createState() => _BasicNavigationRailAppState();
}

class _BasicNavigationRailAppState extends State<BasicNavigationRailApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Beranda'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  selectedIcon: Icon(Icons.bookmark),
                  label: Text('KRS'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: Text('Pengaturan'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Center(
                child: Text('Konten Halaman Modul: $_selectedIndex', style: const TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Dashboard Admin Tablet SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadAdminTabletApp());
}

class SiakadAdminTabletApp extends StatelessWidget {
  const SiakadAdminTabletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIAKAD Admin Tablet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const AdminResponsiveDashboard(),
    );
  }
}

class AdminResponsiveDashboard extends StatefulWidget {
  const AdminResponsiveDashboard({super.key});

  @override
  State<AdminResponsiveDashboard> createState() => _AdminResponsiveDashboardState();
}

class _AdminResponsiveDashboardState extends State<AdminResponsiveDashboard> {
  int _selectedIndex = 0;
  bool _isExtended = true;

  final List<Widget> _adminPages = const [
    AdminMasterDataPage(),
    AdminValidasiKrsPage(),
    AdminJadwalSidangPage(),
    AdminLaporanPddiktiPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIAKAD ADMIN - PANEL PENGELOLA AKADEMIK'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_isExtended ? Icons.chevron_left : Icons.chevron_right),
            onPressed: () {
              setState(() {
                _isExtended = !_isExtended;
              });
            },
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            extended: _isExtended,
            selectedIndex: _selectedIndex,
            backgroundColor: Colors.indigo.shade50,
            indicatorColor: Colors.indigo.shade200,
            leading: Column(
              children: [
                const SizedBox(height: 12),
                CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: const Icon(Icons.school, color: Colors.white),
                ),
                if (_isExtended) ...[
                  const SizedBox(height: 8),
                  const Text('PORTAL ADMIN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.indigo)),
                ],
                const SizedBox(height: 20),
              ],
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: IconButton(
                icon: const Icon(Icons.logout, color: Colors.red),
                onPressed: () {},
              ),
            ),
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.storage_outlined),
                selectedIcon: Icon(Icons.storage, color: Colors.indigo),
                label: Text('Master Data'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.verified_outlined),
                selectedIcon: Icon(Icons.verified, color: Colors.indigo),
                label: Text('Validasi KRS'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.event_seat_outlined),
                selectedIcon: Icon(Icons.event_seat, color: Colors.indigo),
                label: Text('Jadwal Sidang'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.cloud_upload_outlined),
                selectedIcon: Icon(Icons.cloud_upload, color: Colors.indigo),
                label: Text('Laporan PDDikti'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _adminPages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

class AdminMasterDataPage extends StatelessWidget {
  const AdminMasterDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text('Manajemen Master Data Mahasiswa & Dosen', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            leading: const Icon(Icons.people, color: Colors.indigo),
            title: const Text('Data Mahasiswa Aktif (Semester 2026/2027 Ganjil)'),
            subtitle: const Text('Total Mahasiswa: 3,450 Terdaftar'),
            trailing: ElevatedButton(onPressed: () {}, child: const Text('Kelola')),
          ),
        ),
      ],
    );
  }
}

class AdminValidasiKrsPage extends StatelessWidget {
  const AdminValidasiKrsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Panel Validasi Berkas KRS Mahasiswa Keseluruhan'));
  }
}

class AdminJadwalSidangPage extends StatelessWidget {
  const AdminJadwalSidangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Penjadwalan Ruangan & Dewan Penguji Sidang Skripsi'));
  }
}

class AdminLaporanPddiktiPage extends StatelessWidget {
  const AdminLaporanPddiktiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Sinkronisasi Data Transkrip Lulusan ke Feeder PDDikti'));
  }
}
```
