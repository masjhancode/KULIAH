# Dokumentasi Widget: 03. BottomAppBar

## 1. Deskripsi & Fungsi Modul

Widget `BottomAppBar` merupakan kontainer bilah navigasi fleksibel di bagian bawah layar yang secara khusus didesain untuk berintegrasi secara visual dengan `FloatingActionButton` (FAB) menggunakan takik (*notch cutout*). Widget ini ideal untuk tata letak antarmuka SIAKAD yang memiliki satu aksi utama yang menonjol (seperti Scan QR Presensi atau Pengajuan Surat Akademik) di tengah navigasi.

### 1.1 Aktor Pengguna
1. **Mahasiswa**: Melakukan pemindaian QR Code presensi perkuliahan atau mengajukan dispensasi akademik melalui tombol aksi tengah.
2. **Dosen**: Mengaktifkan sesi QR Presensi kelas dan melihat daftar kehadiran mahasiswa.
3. **Petugas Layanan Akademik**: Memverifikasi antrean pelayanan surat rekomendasi.

### 1.2 Referensi Regulasi
1. **UU No. 12 Tahun 2012 tentang Pendidikan Tinggi (UU Dikti)**:
   - *Pasal 35*: Dukungan efisiensi pencatatan kehadiran dan partisipasi aktivitas akademik mahasiswa secara real-time.
2. **Permendikbudristek No. 53 Tahun 2023 tentang Penjaminan Mutu Pendidikan Tinggi**:
   - Ketetapan batas minimum kehadiran mahasiswa 75% sebagai syarat kelayakan mengikuti Ujian Akhir Semester (UAS).
3. **Standar PDDikti**:
   - Pemenuhan keabsahan dan presisi pelaporan jam tatap muka perkuliahan per semester.

---

## 2. Alur Proses & Kebutuhan Fungsional

### 2.1 Alur Proses Integrasi FAB dan Navigasi
1. Pengguna membuka antarmuka utama presensi SIAKAD Mobile.
2. Antarmuka menampilkan `BottomAppBar` dengan pola pemotongan takik melingkar (*CircularNotchedRectangle*).
3. `FloatingActionButton` berada tepat di tengah takik `BottomAppBar`.
4. Mengetuk ikon navigasi di kiri/kanan mengubah tampilan menu, sedangkan mengetuk FAB memicu pemindai QR presensi.

### 2.2 Kebutuhan Fungsional

| ID Kebutuhan | Deskripsi Kebutuhan Fungsional | Label Prioritas |
| :--- | :--- | :--- |
| **REQ-BAP-01** | Sistem **WAJIB** menyediakan kontainer bilah bawah yang menampung widget aksi navigasi horizontal. | `[WAJIB]` |
| **REQ-BAP-02** | Sistem **WAJIB** membentuk takik (*notch*) otomatis yang presisi mengelilingi lokasi `FloatingActionButton`. | `[WAJIB]` |
| **REQ-BAP-03** | Sistem **SEHARUSNYA** mendukung konfigurasi margin takik (*fabNotchMargin*) agar memberikan jarak visual yang estetis. | `[SEHARUSNYA]` |
| **REQ-BAP-04** | Sistem **DAPAT** menggunakan bentuk sudut khusus (*shape*) seperti `AutomaticNotchedShape` untuk kebutuhan variasi desain UI. | `[DAPAT]` |

---

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget?` | Konten widget di dalam bilah (biasanya disusun menggunakan `Row` atau `Flex`). |
| `color` | `Color?` | Warna latar belakang dari bilah `BottomAppBar`. |
| `elevation` | `double?` | Ketinggian bayangan visual di bawah bilah navigasi. |
| `shape` | `NotchedShape?` | Objek pemotong bentuk takik tempat FAB bertengger (misal: `CircularNotchedRectangle()`). |
| `clipBehavior` | `Clip` | Mode pemotongan elemen di area batas bilah (`Clip.none`, `Clip.antiAlias`). |
| `notchMargin` | `double` | Jarak spasi kosong antara tepi takik `BottomAppBar` dengan tepi `FloatingActionButton`. |
| `padding` | `EdgeInsetsGeometry?` | Jarak ruang dalam antara tepi kontainer dengan konten child di dalamnya. |
| `height` | `double?` | Ketinggian vertikal bilah navigasi bawah. |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicBottomAppBarDemo());
}

class BasicBottomAppBarDemo extends StatelessWidget {
  const BasicBottomAppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic BottomAppBar')),
        body: const Center(child: Text('Konten Halaman Utama')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomAppBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: Colors.indigo,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Presensi Perkuliahan QR Code Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadPresensiApp());
}

class SiakadPresensiApp extends StatelessWidget {
  const SiakadPresensiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presensi SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const PresensiHomeScreen(),
    );
  }
}

class PresensiHomeScreen extends StatefulWidget {
  const PresensiHomeScreen({super.key});

  @override
  State<PresensiHomeScreen> createState() => _PresensiHomeScreenState();
}

class _PresensiHomeScreenState extends State<PresensiHomeScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIAKAD PRESENSI MOBILE'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: _tabIndex == 0 ? const RiwayatPresensiWidget() : const JadwalHariIniWidget(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Kamera Pemindai QR Presensi Aktif...'),
              backgroundColor: Colors.indigo,
            ),
          );
        },
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.qr_code_scanner),
        label: const Text('SCAN QR'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        elevation: 10,
        backgroundColor: Colors.indigo.shade900,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.history,
                      color: _tabIndex == 0 ? Colors.amber : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _tabIndex = 0;
                      });
                    },
                    tooltip: 'Riwayat Kehadiran',
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.calendar_month,
                      color: _tabIndex == 1 ? Colors.amber : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _tabIndex = 1;
                      });
                    },
                    tooltip: 'Jadwal Hari Ini',
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.analytics_outlined, color: Colors.white),
                    onPressed: () {},
                    tooltip: 'Rekap SKS',
                  ),
                  IconButton(
                    icon: const Icon(Icons.person, color: Colors.white),
                    onPressed: () {},
                    tooltip: 'Profil Mahasiswa',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RiwayatPresensiWidget extends StatelessWidget {
  const RiwayatPresensiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Rekap Kehadiran Kuliah Semester Ini',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.check, color: Colors.white),
            ),
            title: const Text('Pemrograman Terintegrasi Sistem'),
            subtitle: const Text('Hadir - 28 Agustus 2026 (08:00 - 10:30)'),
            trailing: const Text('100%', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}

class JadwalHariIniWidget extends StatelessWidget {
  const JadwalHariIniWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Jadwal Perkulihan Aktif Hari Ini: 2 Mata Kuliah'),
    );
  }
}
```
