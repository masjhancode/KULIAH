# Dokumentasi Widget: Table

## 1. Deskripsi & Fungsi Modul

Widget `Table` merupakan komponen penyusun tata letak tabel murni (*strict grid layout table*) pada Flutter. Berbeda dari `DataTable`, widget `Table` tidak menggunakan gaya Material khusus melainkan mengandalkan algoritma penyusunan `TableBorder` dan `TableRow` yang sangat fleksibel untuk membuat kisi matriks kustom (seperti Jadwal Kuliah Mingguan, Matriks Kurikulum, atau Lembar Rubrik Penilaian Skripsi).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `children` | `List<TableRow>` | **(WAJIB)** Daftar baris `TableRow` yang menampung daftar widget di setiap sel kolom. |
| `columnWidths` | `Map<int, TableColumnWidth>?` | Menentukan metode penentuan lebar untuk tiap kolom (misal: `FixedColumnWidth(100)` atau `FlexColumnWidth(2)`). |
| `defaultColumnWidth` | `TableColumnWidth` | Ukuran lebar default untuk kolom yang tidak didefinisikan secara khusus pada `columnWidths`. |
| `border` | `TableBorder?` | Mengatur dekorasi garis batas border di sekeliling tabel dan sel internal. |
| `defaultVerticalAlignment` | `TableCellVerticalAlignment` | Mengatur penjajaran vertikal sel dalam baris (`top`, `middle`, `bottom`, `baseline`, `fill`). |
| `textDirection` | `TextDirection?` | Menentukan arah alur penyusunan kolom (LTR atau RTL). |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicTableApp());
}

class BasicTableApp extends StatelessWidget {
  const BasicTableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic Table Layout')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            border: TableBorder.all(color: Colors.grey),
            columnWidths: const {
              0: FixedColumnWidth(80),
              1: FlexColumnWidth(),
            },
            children: const [
              TableRow(
                decoration: BoxDecoration(color: Colors.indigoAccent),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    child: Text('Jam'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Mata Kuliah', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(padding: EdgeInsets.all(8.0), child: Text('08.00')),
                  Padding(padding: EdgeInsets.all(8.0), child: Text('Pemrograman Mobile')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Matriks Jadwal Perkuliahan Mingguan SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadJadwalTableApp());
}

class SiakadJadwalTableApp extends StatelessWidget {
  const SiakadJadwalTableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jadwal SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const JadwalTableScreen(),
    );
  }
}

class JadwalTableScreen extends StatelessWidget {
  const JadwalTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MATRIKS JADWAL KULIAH MINGGUAN'),
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
                  Text('Jadwal Kuliah Semester Ganjil 2026/2027', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo)),
                  SizedBox(height: 4),
                  Text('Program Studi: Teknik Informatika (Kelas A)'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: 650,
              child: Table(
                border: TableBorder.all(
                  color: Colors.indigo.shade200,
                  width: 1,
                  borderRadius: BorderRadius.circular(8),
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0: FixedColumnWidth(90),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.indigo.shade900),
                    children: const [
                      TableCellPadding(text: 'Jam / Waktu', isHeader: true),
                      TableCellPadding(text: 'Senin', isHeader: true),
                      TableCellPadding(text: 'Selasa', isHeader: true),
                      TableCellPadding(text: 'Rabu', isHeader: true),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(color: Colors.white),
                    children: const [
                      TableCellPadding(text: '08:00 - 10:30', isTime: true),
                      TableCellPadding(text: 'Pemrograman Mobile\n(Lab 2 - R.301)', color: Colors.indigoAccent),
                      TableCellPadding(text: 'Basis Data Lanjut\n(R.204)'),
                      TableCellPadding(text: 'Kecerdasan Buatan\n(R.401)', color: Colors.amber),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey.shade50),
                    children: const [
                      TableCellPadding(text: '10:30 - 13:00', isTime: true),
                      TableCellPadding(text: 'Istirahat / ISOMA', isTime: true),
                      TableCellPadding(text: 'Jaringan Komputer\n(Lab Net)'),
                      TableCellPadding(text: 'Etika Profesi\n(R.102)'),
                    ],
                  ),
                  TableRow(
                    decoration: BoxDecoration(color: Colors.white),
                    children: const [
                      TableCellPadding(text: '13:00 - 15:30', isTime: true),
                      TableCellPadding(text: 'Rekayasa Perangkat Lunak\n(R.305)'),
                      TableCellPadding(text: 'Sistem Terdistribusi\n(Lab 1)'),
                      TableCellPadding(text: 'Free / Bimbingan', isTime: true),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TableCellPadding extends StatelessWidget {
  final String text;
  final bool isHeader;
  final bool isTime;
  final Color? color;

  const TableCellPadding({
    super.key,
    required this.text,
    this.isHeader = false,
    this.isTime = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color?.withOpacity(0.15),
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text,
        textAlign: isHeader || isTime ? TextAlign.center : TextAlign.left,
        style: TextStyle(
          fontWeight: isHeader || isTime ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 13 : 12,
          color: isHeader ? Colors.white : (color ?? Colors.black87),
        ),
      ),
    );
  }
}
```
