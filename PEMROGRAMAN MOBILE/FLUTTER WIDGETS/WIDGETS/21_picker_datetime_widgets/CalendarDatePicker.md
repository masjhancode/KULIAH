# Dokumentasi Widget: CalendarDatePicker

## 1. Deskripsi & Fungsi Modul

Widget `CalendarDatePicker` (dan `showDatePicker`) merupakan komponen pemilih tanggal berbentuk kalender interaktif pada Flutter. Dalam Sistem Informasi Akademik (SIAKAD), widget ini digunakan untuk memilih tanggal lahir mahasiswa, batas akhir pengisian Kartu Rencana Studi (KRS), tanggal pengajuan surat rekomendasi, serta tanggal pelaksanaan ujian sidang skripsi.

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `initialDate` | `DateTime` | **(WAJIB)** Tanggal awal yang disorot saat kalender pertama kali dibuka. |
| `firstDate` | `DateTime` | **(WAJIB)** Batas tanggal terawal yang diperbolehkan untuk dipilih oleh pengguna. |
| `lastDate` | `DateTime` | **(WAJIB)** Batas tanggal terakhir yang diperbolehkan untuk dipilih oleh pengguna. |
| `onDateChanged` | `ValueChanged<DateTime>` | **(WAJIB)** Callback fungsi saat pengguna memilih suatu tanggal di kalender. |
| `selectableDayPredicate` | `SelectableDayPredicate?` | Fungsi filter opsional untuk menentukan tanggal mana saja yang aktif atau dinonaktifkan. |
| `initialCalendarMode` | `DatePickerMode` | Mode awal tampilan pemilih (`DatePickerMode.day` atau `DatePickerMode.year`). |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicDatePickerApp());
}

class BasicDatePickerApp extends StatelessWidget {
  const BasicDatePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic CalendarDatePicker')),
        body: Center(
          child: CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030),
            onDateChanged: (DateTime date) {
              print('Tanggal dipilih: $date');
            },
          ),
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Formulir Pengajuan Sidang Skripsi SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadDatePickerApp());
}

class SiakadDatePickerApp extends StatelessWidget {
  const SiakadDatePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengajuan Sidang SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const FormSidangScreen(),
    );
  }
}

class FormSidangScreen extends StatefulWidget {
  const FormSidangScreen({super.key});

  @override
  State<FormSidangScreen> createState() => _FormSidangScreenState();
}

class _FormSidangScreenState extends State<FormSidangScreen> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.indigo,
              onPrimary: Colors.white,
              onSurface: Colors.indigo,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PENGAJUAN TANGGAL SIDANG SKRIPSI'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Mahasiswa: Ahmad Fauzi (2026090123)', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Judul TA: Sistem Presensi Geofencing Berbasis Flutter'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Pilih Tanggal Pelaksanaan Ujian Sidang:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => _selectDate(context),
              icon: const Icon(Icons.calendar_today, color: Colors.indigo),
              label: Text(
                _selectedDate == null
                    ? 'Ketuk untuk Memilih Tanggal'
                    : 'Tanggal Sidang: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.indigo),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                side: const BorderSide(color: Colors.indigo, width: 1.5),
              ),
            ),
            const SizedBox(height: 24),
            if (_selectedDate != null)
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Permohonan jadwal sidang berhasil diajukan!'), backgroundColor: Colors.green),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
                child: const Text('Kirim Pengajuan Jadwal'),
              ),
          ],
        ),
      ),
    );
  }
}
```
