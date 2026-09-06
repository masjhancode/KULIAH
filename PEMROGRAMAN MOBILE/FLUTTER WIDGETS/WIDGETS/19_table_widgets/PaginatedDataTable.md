# Dokumentasi Widget: PaginatedDataTable

## 1. Deskripsi & Fungsi Modul

Widget `PaginatedDataTable` merupakan komponen tabel data berfasilitas pembagian halaman (*pagination*) otomatis pada Flutter. Widget ini secara khusus dirancang untuk menangani dataset berukuran sangat besar (seperti ribuan baris master data mahasiswa atau alumni) dengan membaginya ke dalam beberapa halaman terkontrol agar performa memori aplikasi tetap lancar.

### 2.2 Kebutuhan Fungsional

| ID Kebutuhan | Deskripsi Kebutuhan Fungsional | Label Prioritas |
| :--- | :--- | :--- |
| **REQ-PDT-01** | Sistem **WAJIB** menyediakan kontrol navigasi halaman (halaman sebelumnya/selanjutnya) di bagian footer tabel. | `[WAJIB]` |
| **REQ-PDT-02** | Sistem **WAJIB** mengambil baris data secara bertahap melalui pembentuk data `DataTableSource`. | `[WAJIB]` |
| **REQ-PDT-03** | Sistem **SEHARUSNYA** menyediakan opsi pemilih jumlah baris per halaman (*rowsPerPageOptions*, misal: 5, 10, 20 baris). | `[SEHARUSNYA]` |
| **REQ-PDT-04** | Sistem **DAPAT** menyediakan bilah tindakan header (*header actions*) untuk tombol filter data atau cetak laporan. | `[DAPAT]` |

---

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `header` | `Widget` | **(WAJIB)** Widget judul header tabel (biasanya `Text` judul tabel). |
| `columns` | `List<DataColumn>` | **(WAJIB)** Daftar deskripsi header kolom tabel `DataColumn`. |
| `source` | `DataTableSource` | **(WAJIB)** Objek sumber data turunan `DataTableSource` yang menyediakan data `DataRow`. |
| `rowsPerPage` | `int` | Jumlah baris data yang ditampilkan dalam satu halaman (default: `10`). |
| `onRowsPerPageChanged` | `ValueSetter<int?>?` | Callback fungsi saat pengguna mengubah opsi jumlah baris per halaman. |
| `availableRowsPerPage` | `List<int>` | Daftar pilihan angka jumlah baris per halaman (misal: `[5, 10, 25, 50]`). |
| `actions` | `List<Widget>?` | Daftar widget tombol aksi di pojok kanan atas header tabel. |
| `sortColumnIndex` | `int?` | Indeks kolom yang dijadikan sebagai dasar pengurutan data. |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicPaginatedTableApp());
}

class BasicPaginatedTableApp extends StatelessWidget {
  const BasicPaginatedTableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic PaginatedDataTable')),
        body: SingleChildScrollView(
          child: PaginatedDataTable(
            header: const Text('Daftar Mahasiswa'),
            columns: const [
              DataColumn(label: Text('NIM')),
              DataColumn(label: Text('Nama')),
              DataColumn(label: Text('Prodi')),
            ],
            source: SimpleStudentDataSource(),
            rowsPerPage: 5,
          ),
        ),
      ),
    );
  }
}

class SimpleStudentDataSource extends DataTableSource {
  final List<Map<String, String>> _data = List.generate(
    25,
    (index) => {
      'nim': '2026090${100 + index}',
      'nama': 'Mahasiswa ${index + 1}',
      'prodi': 'Teknik Informatika',
    },
  );

  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) return null;
    final item = _data[index];
    return DataRow(cells: [
      DataCell(Text(item['nim']!)),
      DataCell(Text(item['nama']!)),
      DataCell(Text(item['prodi']!)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
```

### 4.2 Contoh Kode Studi Kasus UI (Master Data Mahasiswa Kampus SIAKAD PDDikti)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadMasterMahasiswaApp());
}

class SiakadMasterMahasiswaApp extends StatelessWidget {
  const SiakadMasterMahasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master Data SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const MasterMahasiswaScreen(),
    );
  }
}

class MasterMahasiswaScreen extends StatefulWidget {
  const MasterMahasiswaScreen({super.key});

  @override
  State<MasterMahasiswaScreen> createState() => _MasterMahasiswaScreenState();
}

class _MasterMahasiswaScreenState extends State<MasterMahasiswaScreen> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    final StudentMasterDataSource dataSource = StudentMasterDataSource(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MASTER DATA MAHASISWA KAMPUS'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PaginatedDataTable(
            header: const Text(
              'Database Induk PDDikti',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            rowsPerPage: _rowsPerPage,
            availableRowsPerPage: const [5, 10, 15],
            onRowsPerPageChanged: (int? value) {
              if (value != null) {
                setState(() {
                  _rowsPerPage = value;
                });
              }
            },
            actions: [
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {},
                tooltip: 'Filter Angkatan',
              ),
              IconButton(
                icon: const Icon(Icons.download),
                onPressed: () {},
                tooltip: 'Ekspor Excel PDDikti',
              ),
            ],
            columns: const [
              DataColumn(label: Text('NIM', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Nama Lengkap', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Program Studi', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Angkatan', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Aksi', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            source: dataSource,
          ),
        ],
      ),
    );
  }
}

class StudentMasterDataSource extends DataTableSource {
  final BuildContext context;

  StudentMasterDataSource(this.context);

  final List<StudentModel> _students = List.generate(
    45,
    (i) => StudentModel(
      nim: '2026090${101 + i}',
      nama: i % 2 == 0 ? 'Ahmad Fauzi $i' : 'Siti Aminah $i',
      prodi: i % 3 == 0 ? 'Teknik Informatika' : 'Sistem Informasi',
      angkatan: '2026',
      status: i % 5 == 0 ? 'CUTI' : 'AKTIF',
    ),
  );

  @override
  DataRow? getRow(int index) {
    if (index >= _students.length) return null;
    final s = _students[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(s.nim)),
        DataCell(Text(s.nama)),
        DataCell(Text(s.prodi)),
        DataCell(Text(s.angkatan)),
        DataCell(
          Chip(
            label: Text(s.status, style: const TextStyle(fontSize: 11, color: Colors.white)),
            backgroundColor: s.status == 'AKTIF' ? Colors.green : Colors.orange,
          ),
        ),
        DataCell(
          IconButton(
            icon: const Icon(Icons.visibility, color: Colors.indigo),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Membuka detail mahasiswa: ${s.nama}')),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _students.length;

  @override
  int get selectedRowCount => 0;
}

class StudentModel {
  final String nim;
  final String nama;
  final String prodi;
  final String angkatan;
  final String status;

  StudentModel({
    required this.nim,
    required this.nama,
    required this.prodi,
    required this.angkatan,
    required this.status,
  });
}
```
