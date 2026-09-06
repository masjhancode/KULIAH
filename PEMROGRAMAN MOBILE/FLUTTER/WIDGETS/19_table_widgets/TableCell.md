# Dokumentasi Widget: TableCell

## 1. Deskripsi & Fungsi Modul

Widget `TableCell` merupakan komponen pembungkus sel individual di dalam `Table` yang mengontrol perilaku penjajaran vertikal khusus (*vertical alignment overrides*) untuk satu sel tertentu. Widget ini digunakan saat sebuah sel individual membutuhkan posisi perataan vertikal yang berbeda (misal `TableCellVerticalAlignment.fill` atau `TableCellVerticalAlignment.baseline`) dari aturan `defaultVerticalAlignment` tabel secara keseluruhan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | **(WAJIB)** Widget konten utama yang berada di dalam sel tabel. |
| `verticalAlignment` | `TableCellVerticalAlignment?` | Penjajaran vertikal khusus untuk sel ini (`top`, `bottom`, `middle`, `baseline`, `fill`). |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicTableCellApp());
}

class BasicTableCellApp extends StatelessWidget {
  const BasicTableCellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic TableCell')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Table(
            border: TableBorder.all(),
            children: const [
              TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Tengah'),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: Colors.indigoAccent,
                      child: Center(
                        child: Text('Full Fill', style: TextStyle(color: Colors.white)),
                      ),
                    ),
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
```

### 4.2 Contoh Kode Studi Kasus UI (Lembar Rubrik Penilaian Sidang Skripsi SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadRubrikSkripsiApp());
}

class SiakadRubrikSkripsiApp extends StatelessWidget {
  const SiakadRubrikSkripsiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rubrik Skripsi SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const RubrikSkripsiScreen(),
    );
  }
}

class RubrikSkripsiScreen extends StatelessWidget {
  const RubrikSkripsiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RUBRIK EVALUASI SIDANG SKRIPSI'),
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
                  Text('Mahasiswa: Muhammad Rizky (2026090999)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('Judul: "Pengembangan Sistem Presensi Geofencing Berbasis Flutter"'),
                  Divider(height: 20),
                  Text('Dewan Penguji: Dr. Eng. Ir. Hendra, M.T. (Penguji I)', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Table(
            border: TableBorder.all(color: Colors.grey.shade300),
            columnWidths: const {
              0: FixedColumnWidth(40),
              1: FlexColumnWidth(2),
              2: FlexColumnWidth(1),
              3: FixedColumnWidth(70),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.indigo.shade900),
                children: const [
                  Padding(padding: EdgeInsets.all(8), child: Text('No', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Indikator Penilaian', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Bobot', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Skor', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                ],
              ),
              TableRow(
                children: [
                  const Padding(padding: EdgeInsets.all(8), child: Text('1')),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Kedalaman Latar Belakang & Perumusan Masalah Akademik'),
                  ),
                  const Padding(padding: EdgeInsets.all(8), child: Text('20%')),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: Colors.green.shade100,
                      child: const Center(
                        child: Text('88', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  const Padding(padding: EdgeInsets.all(8), child: Text('2')),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Kesesuaian Metodologi Penelitian & Implementasi Perangkat Lunak'),
                  ),
                  const Padding(padding: EdgeInsets.all(8), child: Text('40%')),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.fill,
                    child: Container(
                      color: Colors.green.shade100,
                      child: const Center(
                        child: Text('92', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```
