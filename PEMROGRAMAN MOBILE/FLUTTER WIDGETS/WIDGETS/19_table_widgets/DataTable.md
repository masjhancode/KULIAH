# Dokumentasi Widget: DataTable

## 1. Deskripsi & Fungsi Modul

Widget `DataTable` merupakan komponen penyaji data tabular berbasis Material Design pada Flutter. Widget ini digunakan untuk menampilkan data akademik terstruktur yang terdiri atas baris (*DataRow*) dan kolom (*DataColumn*), serta mendukung fitur pengurutan kolom (*sorting*) dan pemulihan status centang (*checkbox selection*). Dalam Sistem Informasi Akademik (SIAKAD), widget ini ideal untuk menyajikan Transkrip Akademik, Kartu Hasil Studi (KHS), dan Daftar Mata Kuliah KRS.

### 1.1 Aktor Pengguna
1. **Mahasiswa**: Melihat daftar mata kuliah yang diambil, SKS, nilai huruf, dan status kelulusan pada KHS.
2. **Dosen Pembimbing Akademik (DPA)**: Memeriksa rincian KRS mahasiswa bimbingan dan menyetujui paket mata kuliah.
3. **Admin Akademik**: Mengelola master data jadwal perkuliahan dan pengurutan alokasi ruang kelas.

### 1.2 Referensi Regulasi
1. **UU No. 12 Tahun 2012 tentang Pendidikan Tinggi (UU Dikti)**:
   - *Pasal 35*: Akses kemudahan pencatatan dan akuntabilitas data nilai hasil belajar mahasiswa per semester.
2. **Permendikbudristek No. 53 Tahun 2023 tentang Penjaminan Mutu Pendidikan Tinggi**:
   - Transparansi pelaporan beban SKS dan penetapan Indeks Prestasi Semester (IPS) serta Kumulatif (IPK).
3. **Standar PDDikti**:
   - Format pelaporan data transkrip nilai mahasiswa terstruktur yang wajib diunggah ke portal Feeder PDDikti.

---

## 2. Alur Proses & Kebutuhan Fungsional

### 2.1 Alur Proses Penyajian Data Tabel
1. Aplikasi SIAKAD mengunduh data daftar mata kuliah atau nilai KHS dari server REST API.
2. Data daftar objek (*List of Objects*) dikonversi menjadi daftar `DataColumn` untuk header dan `DataRow` untuk baris data.
3. Pengguna menekan header kolom untuk mengurutkan data (*sort ascending/descending*).
4. Pengguna menekan tombol centang baris untuk melakukan aksi massal (*bulk action*).

### 2.2 Kebutuhan Fungsional

| ID Kebutuhan | Deskripsi Kebutuhan Fungsional | Label Prioritas |
| :--- | :--- | :--- |
| **REQ-DTB-01** | Sistem **WAJIB** merender header kolom `DataColumn` dan baris data `DataRow` secara presisi. | `[WAJIB]` |
| **REQ-DTB-02** | Sistem **WAJIB** mendukung pengurutan baris data saat header kolom yang memiliki `onSort` ditekan. | `[WAJIB]` |
| **REQ-DTB-03** | Sistem **SEHARUSNYA** menyediakan fitur pemilih centang baris (`selected: true/false`) untuk aksi persetujuan massal KRS. | `[SEHARUSNYA]` |
| **REQ-DTB-04** | Sistem **DAPAT** memberikan warna latar selang-seling (*zebra striping*) pada baris tabel untuk kenyamanan visual. | `[DAPAT]` |

---

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `columns` | `List<DataColumn>` | **(WAJIB)** Daftar widget `DataColumn` yang menentukan judul header dan perilaku pengurutan tiap kolom. |
| `rows` | `List<DataRow>` | **(WAJIB)** Daftar widget `DataRow` yang menampung sel data `DataCell`. |
| `sortColumnIndex` | `int?` | Indeks kolom yang sedang digunakan sebagai acuan pengurutan data. |
| `sortAscending` | `bool` | Status arah pengurutan data (`true` untuk A-Z/0-9, `false` untuk Z-A/9-0). |
| `onSelectAll` | `ValueSetter<bool?>?` | Callback fungsi saat tombol centang di header "Pilih Semua" ditekan. |
| `dataRowMaxHeight` | `double?` | Batas ketinggian maksimum untuk tiap baris data di dalam tabel. |
| `headingRowColor` | `WidgetStateProperty<Color?>?` | Warna latar belakang khusus untuk baris header tabel. |
| `columnSpacing` | `double?` | Jarak horizontal spasi antar kolom di dalam tabel. |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicDataTableApp());
}

class BasicDataTableApp extends StatelessWidget {
  const BasicDataTableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic DataTable')),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Kode MK')),
              DataColumn(label: Text('Mata Kuliah')),
              DataColumn(label: Text('SKS')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('TIF101')),
                DataCell(Text('Algoritma & Pemrograman')),
                DataCell(Text('3')),
              ]),
              DataRow(cells: [
                DataCell(Text('TIF102')),
                DataCell(Text('Basis Data I')),
                DataCell(Text('4')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Kartu Hasil Studi Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadKhsTableApp());
}

class SiakadKhsTableApp extends StatelessWidget {
  const SiakadKhsTableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KHS SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const KhsTableScreen(),
    );
  }
}

class KhsTableScreen extends StatefulWidget {
  const KhsTableScreen({super.key});

  @override
  State<KhsTableScreen> createState() => _KhsTableScreenState();
}

class _KhsTableScreenState extends State<KhsTableScreen> {
  int? _sortColumnIndex;
  bool _sortAscending = true;

  List<KhsItem> _khsList = [
    KhsItem(kode: 'TIF201', matkul: 'Pemrograman Web', sks: 3, nilai: 'A', bobot: 4.0),
    KhsItem(kode: 'TIF202', matkul: 'Struktur Data', sks: 4, nilai: 'A-', bobot: 3.7),
    KhsItem(kode: 'TIF203', matkul: 'Sistem Operasi', sks: 3, nilai: 'B+', bobot: 3.3),
    KhsItem(kode: 'TIF204', matkul: 'Jaringan Komputer', sks: 3, nilai: 'A', bobot: 4.0),
    KhsItem(kode: 'TIF205', matkul: 'Matematika Diskrit', sks: 3, nilai: 'B', bobot: 3.0),
  ];

  void _sort<T>(Comparable<T> Function(KhsItem d) getField, int columnIndex, bool ascending) {
    _khsList.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KARTU HASIL STUDI (KHS)'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Nama: Ahmad Fauzi | NIM: 2026090123', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('Program Studi: Teknik Informatika (Semester 4)'),
                  Divider(height: 20),
                  Text('IP Semester (IPS): 3.68 | Total SKS Lulus: 16 SKS', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                headingRowColor: WidgetStateProperty.all(Colors.indigo.shade50),
                columns: [
                  DataColumn(
                    label: const Text('Kode MK', style: TextStyle(fontWeight: FontWeight.bold)),
                    onSort: (columnIndex, ascending) => _sort((d) => d.kode, columnIndex, ascending),
                  ),
                  DataColumn(
                    label: const Text('Nama Mata Kuliah', style: TextStyle(fontWeight: FontWeight.bold)),
                    onSort: (columnIndex, ascending) => _sort((d) => d.matkul, columnIndex, ascending),
                  ),
                  DataColumn(
                    numeric: true,
                    label: const Text('SKS', style: TextStyle(fontWeight: FontWeight.bold)),
                    onSort: (columnIndex, ascending) => _sort((d) => d.sks, columnIndex, ascending),
                  ),
                  const DataColumn(
                    label: Text('Nilai', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    numeric: true,
                    label: const Text('Bobot', style: TextStyle(fontWeight: FontWeight.bold)),
                    onSort: (columnIndex, ascending) => _sort((d) => d.bobot, columnIndex, ascending),
                  ),
                ],
                rows: _khsList.map((item) {
                  return DataRow(
                    cells: [
                      DataCell(Text(item.kode)),
                      DataCell(Text(item.matkul)),
                      DataCell(Text('${item.sks}')),
                      DataCell(
                        Chip(
                          label: Text(item.nilai),
                          backgroundColor: item.nilai.startsWith('A') ? Colors.green.shade100 : Colors.blue.shade100,
                        ),
                      ),
                      DataCell(Text('${item.bobot}')),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KhsItem {
  final String kode;
  final String matkul;
  final int sks;
  final String nilai;
  final double bobot;

  KhsItem({
    required this.kode,
    required this.matkul,
    required this.sks,
    required this.nilai,
    required this.bobot,
  });
}
```
