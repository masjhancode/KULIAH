# Dokumentasi Widget: 01. BottomNavigationBar

## 1. Deskripsi & Fungsi Modul

Widget `BottomNavigationBar` merupakan komponen bilah navigasi bawah klasik dalam kerangka kerja Flutter. Widget ini ditempatkan pada atribut `bottomNavigationBar` milik `Scaffold` untuk menyediakan akses langsung ke 2 hingga 5 menu navigasi tingkat teratas aplikasi Sistem Informasi Akademik (SIAKAD).

### 1.1 Aktor Pengguna
1. **Dosen Pembimbing Akademik (DPA)**: Berpindah antar modul Bimbingan Akademik, Persetujuan KRS, Presensi Mengajar, dan Profil Dosen.
2. **Mahasiswa**: Mengakses menu navigasi utama perkuliahan dan pencatatan nilai.
3. **Tenaga Kependidikan (Tendik)**: Mengelola pelayanan persuratan dan verifikasi berkas kelulusan.

### 1.2 Referensi Regulasi
1. **UU No. 12 Tahun 2012 tentang Pendidikan Tinggi (UU Dikti)**:
   - *Pasal 35*: Akses kemudahan pelaporan dan pemantauan kegiatan belajar mengajar bagi dosen dan instansi perguruan tinggi.
2. **Permendikbudristek No. 53 Tahun 2023 tentang Penjaminan Mutu Pendidikan Tinggi**:
   - Menjamin bahwa sistem informasi manajemen akademik dapat diakses secara efisien dengan respon waktu yang optimal.
3. **Standar PDDikti & BAN-PT (Kriteria 4: Sumber Daya Manusia)**:
   - Standar efektivitas sistem manajemen tugas dan bimbingan akademik dosen melalui media elektronik terintegrasi.

---

## 2. Alur Proses & Kebutuhan Fungsional

### 2.1 Alur Proses Navigasi Menu
1. Pengguna membuka portal Dosen/Mahasiswa di aplikasi mobile SIAKAD.
2. Pengguna memilih salah satu tombol menu pada `BottomNavigationBar`.
3. Event `onTap(int index)` dieksekusi, memicu pengubah status `currentIndex`.
4. Komponen `IndexedStack` atau `PageView` memperbarui tampilan layar sesuai indeks terpilih tanpa memuat ulang (*re-render*) seluruh hierarki Scaffold.

### 2.2 Kebutuhan Fungsional

| ID Kebutuhan | Deskripsi Kebutuhan Fungsional | Label Prioritas |
| :--- | :--- | :--- |
| **REQ-BNV-01** | Sistem **WAJIB** menampilkan antara 2 hingga 5 `BottomNavigationBarItem` sebagai opsi navigasi utama. | `[WAJIB]` |
| **REQ-BNV-02** | Sistem **WAJIB** mengubah indeks aktif `currentIndex` saat pengguna menekan ikon menu navigasi. | `[WAJIB]` |
| **REQ-BNV-03** | Sistem **SEHARUSNYA** mendukung perbedaan gaya visual antara item terpilih (`selectedItemColor`) dan item tidak aktif (`unselectedItemColor`). | `[SEHARUSNYA]` |
| **REQ-BNV-04** | Sistem **DAPAT** beralih dari tipe `fixed` ke `shifting` apabila jumlah item menu membutuhkan efek animasi dinamis. | `[DAPAT]` |

---

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `items` | `List<BottomNavigationBarItem>` | **(WAJIB)** Daftar elemen ikon dan label teks navigasi. |
| `currentIndex` | `int` | **(WAJIB)** Indeks posisi item menu yang sedang diaktifkan. |
| `onTap` | `ValueChanged<int>?` | Callback fungsi saat tombol menu diklik/ditekan. |
| `type` | `BottomNavigationBarType?` | Menentukan tipe tata letak item (`BottomNavigationBarType.fixed` atau `shifting`). |
| `selectedItemColor` | `Color?` | Warna ikon dan label teks untuk item menu yang aktif. |
| `unselectedItemColor` | `Color?` | Warna ikon dan label teks untuk item menu yang tidak aktif. |
| `showSelectedLabels` | `bool?` | Menentukan apakah teks label pada item terpilih ditampilkan. |
| `showUnselectedLabels` | `bool?` | Menentukan apakah teks label pada item yang tidak terpilih ditampilkan. |
| `iconSize` | `double` | Ukuran dimensi ikon pada seluruh item navigasi. |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicBottomNavApp());
}

class BasicBottomNavApp extends StatefulWidget {
  const BasicBottomNavApp({super.key});

  @override
  State<BasicBottomNavApp> createState() => _BasicBottomNavAppState();
}

class _BasicBottomNavAppState extends State<BasicBottomNavApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic BottomNavigationBar')),
        body: Center(
          child: Text('Indeks Halaman: $_currentIndex', style: const TextStyle(fontSize: 20)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Akademik',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Portal Dosen Pembimbing Akademik SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadDosenNavApp());
}

class SiakadDosenNavApp extends StatelessWidget {
  const SiakadDosenNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIAKAD Dosen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const DosenHomeScreen(),
    );
  }
}

class DosenHomeScreen extends StatefulWidget {
  const DosenHomeScreen({super.key});

  @override
  State<DosenHomeScreen> createState() => _DosenHomeScreenState();
}

class _DosenHomeScreenState extends State<DosenHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    DosenDashboardView(),
    BimbinganKrsView(),
    PresensiMengajarView(),
    ProfilDosenView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIAKAD - PORTAL DOSEN PA'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey.shade600,
        backgroundColor: Colors.white,
        elevation: 8,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            activeIcon: Icon(Icons.fact_check),
            label: 'Persetujuan KRS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.co_present_outlined),
            activeIcon: Icon(Icons.co_present),
            label: 'Presensi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge_outlined),
            activeIcon: Icon(Icons.badge),
            label: 'Profil Dosen',
          ),
        ],
      ),
    );
  }
}

class DosenDashboardView extends StatelessWidget {
  const DosenDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Dr. Ir. Hendra Wijaya, M.T.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('NIP/NIDN: 198203152008011002 | Teknik Informatika'),
                SizedBox(height: 10),
                Text('Total Mahasiswa Bimbingan: 42 Mahasiswa', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BimbinganKrsView extends StatelessWidget {
  const BimbinganKrsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Daftar Mahasiswa Menunggu Persetujuan KRS'));
  }
}

class PresensiMengajarView extends StatelessWidget {
  const PresensiMengajarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Jadwal & Presensi Perkuliahan Hari Ini'));
  }
}

class ProfilDosenView extends StatelessWidget {
  const ProfilDosenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profil Dosen & Beban Kerja Dosen (BKD)'));
  }
}
```
