# Dokumentasi Widget: DateRangePicker (showDateRangePicker)

## 1. Deskripsi & Fungsi Modul

Widget `DateRangePicker` (dipicu melalui `showDateRangePicker`) merupakan dialog pemilih rentang tanggal (*date range selection*) pada Flutter yang memungkinkan pengguna menentukan rentang tanggal mulai (*start date*) dan tanggal selesai (*end date*) sekaligus dalam satu tampilan kalender. Dalam Sistem Informasi Akademik (SIAKAD), dialog ini digunakan untuk menetapkan Periode Registrasi Ulang, Periode Ujian Tengah/Akhir Semester, serta Periode Pelaksanaan KKN / Magang MBKM.

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `initialDateRange` | `DateTimeRange?` | Rentang tanggal awal yang langsung disorot saat dialog dibuka. |
| `firstDate` | `DateTime` | **(WAJIB)** Batas tanggal terawal yang boleh dipilih. |
| `lastDate` | `DateTime` | **(WAJIB)** Batas tanggal terakhir yang boleh dipilih. |
| `helpText` | `String?` | Teks petunjuk instruksi di bagian header dialog (misal: "Pilih Periode KKN"). |
| `saveText` | `String?` | Teks tombol simpan (misal: "Tetapkan Rentang"). |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicDateRangePickerApp());
}

class BasicDateRangePickerApp extends StatelessWidget {
  const BasicDateRangePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic DateRangePicker')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final DateTimeRange? range = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2025),
                lastDate: DateTime(2030),
              );
              print('Rentang: ${range?.start} s.d. ${range?.end}');
            },
            child: const Text('Pilih Rentang Tanggal'),
          ),
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Penetapan Kalender Akademik SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadDateRangeApp());
}

class SiakadDateRangeApp extends StatelessWidget {
  const SiakadDateRangeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalender Akademik SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const KalenderAkademikScreen(),
    );
  }
}

class KalenderAkademikScreen extends StatefulWidget {
  const KalenderAkademikScreen({super.key});

  @override
  State<KalenderAkademikScreen> createState() => _KalenderAkademikScreenState();
}

class _KalenderAkademikScreenState extends State<KalenderAkademikScreen> {
  DateTimeRange? _krsRange;

  Future<void> _selectKrsRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      helpText: 'PILIH PERIODE PENGISIAN KRS MAHASISWA',
      saveText: 'SIMPAN PERIODE',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.indigo,
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _krsRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KALENDER AKADEMIK SEMESTER'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Konfigurasi Batas Waktu Semester Ganjil 2026/2027', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.date_range, color: Colors.indigo),
                title: const Text('Periode Pengisian & KPRS Online'),
                subtitle: Text(
                  _krsRange == null
                      ? 'Belum Ditentukan'
                      : '${_krsRange!.start.day}/${_krsRange!.start.month}/${_krsRange!.start.year} - ${_krsRange!.end.day}/${_krsRange!.end.month}/${_krsRange!.end.year}',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
                ),
                trailing: ElevatedButton(
                  onPressed: _selectKrsRange,
                  child: const Text('Atur Periode'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
