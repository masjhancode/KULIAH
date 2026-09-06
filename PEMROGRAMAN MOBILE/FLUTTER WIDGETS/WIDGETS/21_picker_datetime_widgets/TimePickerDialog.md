# Dokumentasi Widget: TimePickerDialog (showTimePicker)

## 1. Deskripsi & Fungsi Modul

Widget `TimePickerDialog` (dipicu melalui `showTimePicker`) merupakan komponen dialog pemilih waktu berbentuk jam analog atau digital pada Flutter. Dalam Sistem Informasi Akademik (SIAKAD), dialog ini digunakan oleh administrator atau dosen untuk menentukan jam awal dan akhir jadwal perkuliahan, alokasi jam konsultasi bimbingan, serta batas jam aktivasi QR Presensi kelas.

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `initialTime` | `TimeOfDay` | **(WAJIB)** Nilai jam dan menit awal yang disorot saat dialog waktu dibuka. |
| `initialEntryMode` | `TimePickerEntryMode` | Mode awal tampilan pemilih (`dial` untuk dial analog, `input` untuk ketik angka). |
| `builder` | `TransitionBuilder?` | Fungsi kustom penyesuaian tema warna (*theme override*) dialog waktu. |
| `cancelText` | `String?` | Teks kustom untuk tombol pembatalan (misal: "Batal"). |
| `confirmText` | `String?` | Teks kustom untuk tombol konfirmasi (misal: "Simpan Jam"). |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicTimePickerApp());
}

class BasicTimePickerApp extends StatelessWidget {
  const BasicTimePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic TimePickerDialog')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print('Jam dipilih: ${time?.format(context)}');
            },
            child: const Text('Buka Pemilih Waktu'),
          ),
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Formulir Penjadwalan Kelas Perkuliahan SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadTimePickerApp());
}

class SiakadTimePickerApp extends StatelessWidget {
  const SiakadTimePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penjadwalan Jam SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const FormJadwalJamScreen(),
    );
  }
}

class FormJadwalJamScreen extends StatefulWidget {
  const FormJadwalJamScreen({super.key});

  @override
  State<FormJadwalJamScreen> createState() => _FormJadwalJamScreenState();
}

class _FormJadwalJamScreenState extends State<FormJadwalJamScreen> {
  TimeOfDay _jamMulai = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _jamSelesai = const TimeOfDay(hour: 10, minute: 30);

  Future<void> _selectTime(bool isMulai) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isMulai ? _jamMulai : _jamSelesai,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isMulai) {
          _jamMulai = picked;
        } else {
          _jamSelesai = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALOKASI WAKTU MATAKULIAH'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Mata Kuliah: Pemrograman Terintegrasi Sistem (3 SKS)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: ListTile(
                      title: const Text('Jam Mulai'),
                      subtitle: Text(_jamMulai.format(context), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
                      trailing: const Icon(Icons.access_time),
                      onTap: () => _selectTime(true),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    child: ListTile(
                      title: const Text('Jam Selesai'),
                      subtitle: Text(_jamSelesai.format(context), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
                      trailing: const Icon(Icons.access_time_filled),
                      onTap: () => _selectTime(false),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Jadwal disimpan: ${_jamMulai.format(context)} s.d. ${_jamSelesai.format(context)}'),
                    backgroundColor: Colors.indigo,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
              child: const Text('Simpan Alokasi Waktu Kuliah'),
            ),
          ],
        ),
      ),
    );
  }
}
```
