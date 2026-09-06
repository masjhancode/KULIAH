# Dokumentasi Widget: 05. CupertinoTabBar

## 1. Deskripsi & Fungsi Modul

Widget `CupertinoTabBar` merupakan komponen bilah navigasi tab bagian bawah yang mengadopsi bahasa desain khas **iOS/Apple (Cupertino Design System)** pada Flutter. Widget ini umumnya dipasangkan dengan `CupertinoTabScaffold` dan `CupertinoTabView` untuk menyajikan pengalaman navigasi yang familier bagi pengguna perangkat iPhone atau iPad dalam lingkungan Sistem Informasi Akademik (SIAKAD).

### 1.1 Aktor Pengguna
1. **Mahasiswa Pengguna Perangkat iOS**: Mengakses modul KRS, Jadwal Perkuliahan, Nilai Semester, dan Pengumuman Kampus.
2. **Dosen Pembimbing Akademik (DPA)**: Melakukan pengesahan KRS dan bimbingan akademik dari perangkat iPad/iPhone.
3. **Administrator Sistem**: Memastikan keseragaman antarmuka multiplatform antara iOS dan Android.

### 1.2 Referensi Regulasi
1. **UU No. 12 Tahun 2012 tentang Pendidikan Tinggi (UU Dikti)**:
   - *Pasal 35*: Aksesibilitas layanan sistem informasi perguruan tinggi yang tidak diskriminatif terhadap jenis sistem operasi perangkat yang digunakan civitas akademika.
2. **Permendikbudristek No. 53 Tahun 2023 tentang Penjaminan Mutu Pendidikan Tinggi**:
   - Menjamin bahwa ketersediaan layanan digital perguruan tinggi memiliki tingkat kompatibilitas dan standar usability yang tinggi.
3. **Standar BAN-PT (Kriteria 3: Kemahasiswaan & Kriteria 5: Keuangan, Sarana, dan Prasarana)**:
   - Pengadaan fasilitas aplikasi mobile kampus yang siap pakai pada ekosistem toko aplikasi App Store.

---

## 2. Alur Proses & Kebutuhan Fungsional

### 2.1 Alur Proses Navigasi Cupertino Tab
1. Pengguna membuka aplikasi SIAKAD iOS pada perangkat iPhone/iPad.
2. `CupertinoTabScaffold` merender `CupertinoTabBar` pada bagian bawah layar.
3. Pengguna memilih salah satu tab `BottomNavigationBarItem`.
4. `CupertinoTabScaffold` beralih ke tab terpilih sambil mempertahankan tumpukan navigasi halaman internal (*isolated navigation stack per tab*).

### 2.2 Kebutuhan Fungsional

| ID Kebutuhan | Deskripsi Kebutuhan Fungsional | Label Prioritas |
| :--- | :--- | :--- |
| **REQ-CTB-01** | Sistem **WAJIB** menampilkan bilah tab navigasi bawah sesuai dengan norma antarmuka Cupertino iOS. | `[WAJIB]` |
| **REQ-CTB-02** | Sistem **WAJIB** mengisolasi tumpukan rute navigasi pada masing-masing tab secara independen melalui `CupertinoTabView`. | `[WAJIB]` |
| **REQ-CTB-03** | Sistem **SEHARUSNYA** memberikan warna aksen aktif (`activeColor`) dan warna tidak aktif (`inactiveColor`) khas sistem iOS. | `[SEHARUSNYA]` |
| **REQ-CTB-04** | Sistem **DAPAT** memberikan efek transparansi buram (*translucent background*) pada latar `CupertinoTabBar`. | `[DAPAT]` |

---

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `items` | `List<BottomNavigationBarItem>` | **(WAJIB)** List item ikon dan label untuk tiap tab navigasi iOS. |
| `currentIndex` | `int` | **(WAJIB)** Indeks berbasis nol yang menandai tab terpilih. |
| `onTap` | `ValueChanged<int>?` | Callback saat item tab diklik oleh pengguna. |
| `activeColor` | `Color?` | Warna sorot utama ikon dan teks pada tab terpilih. |
| `inactiveColor` | `Color` | Warna ikon dan teks pada tab yang sedang tidak aktif. |
| `backgroundColor` | `Color?` | Warna latar belakang dari bilah `CupertinoTabBar`. |
| `iconSize` | `double` | Ukuran besar ikon di dalam item tab. |
| `border` | `Border?` | Pembatas garis border bagian atas dari `CupertinoTabBar`. |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const BasicCupertinoTabBarApp());
}

class BasicCupertinoTabBarApp extends StatelessWidget {
  const BasicCupertinoTabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book),
              label: 'KRS',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profil',
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Tab Ke-${index + 1}'),
                ),
                child: Center(
                  child: Text('Konten Tampilan Halaman Tab ${index + 1}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Portal Akademik iOS Mahasiswa SIAKAD)

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadIosApp());
}

class SiakadIosApp extends StatelessWidget {
  const SiakadIosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'SIAKAD Mobile iOS',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemIndigo,
      ),
      home: SiakadIosHomeScreen(),
    );
  }
}

class SiakadIosHomeScreen extends StatelessWidget {
  const SiakadIosHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: CupertinoColors.systemIndigo,
        inactiveColor: CupertinoColors.systemGrey,
        backgroundColor: CupertinoColors.systemBackground.withOpacity(0.9),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_grid_2x2),
            activeIcon: Icon(CupertinoIcons.square_grid_2x2_fill),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.doc_plaintext),
            activeIcon: Icon(CupertinoIcons.doc_plaintext_fill),
            label: 'Kartu Hasil',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar),
            activeIcon: Icon(CupertinoIcons.calendar_today),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            activeIcon: Icon(CupertinoIcons.profile_circled),
            label: 'Akun',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => const BerandaIosTab(),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => const KhsIosTab(),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => const JadwalIosTab(),
            );
          case 3:
            return CupertinoTabView(
              builder: (context) => const AkunIosTab(),
            );
          default:
            return CupertinoTabView(
              builder: (context) => const BerandaIosTab(),
            );
        }
      },
    );
  }
}

class BerandaIosTab extends StatelessWidget {
  const BerandaIosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Beranda Mahasiswa SIAKAD'),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Status Akademik: AKTIF', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                    SizedBox(height: 8),
                    Text('Semester Ganjil 2026/2027'),
                    Text('Batas Pengisian KRS: 05 September 2026'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KhsIosTab extends StatelessWidget {
  const KhsIosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Kartu Hasil Studi (KHS)'),
      ),
      child: Center(child: Text('Daftar Nilai KHS Semester Ganjil')),
    );
  }
}

class JadwalIosTab extends StatelessWidget {
  const JadwalIosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Jadwal Kuliah Semester'),
      ),
      child: Center(child: Text('Kalender Akademik & Jadwal Kuliah')),
    );
  }
}

class AkunIosTab extends StatelessWidget {
  const AkunIosTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Pengaturan Akun Mahasiswa'),
      ),
      child: Center(child: Text('Profil & Keamanan Akun SIAKAD')),
    );
  }
}
```
