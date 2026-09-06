# Dokumentasi Widget: CupertinoDatePicker

## 1. Deskripsi & Fungsi Modul

Widget `CupertinoDatePicker` merupakan pemilih tanggal dan/atau waktu bertema gaya khas Apple iOS (Cupertino Design) pada Flutter. Widget ini menampilkan roda putar gulir vertikal (*wheel picker*) untuk memilih tanggal, waktu, atau kombinasi keduanya secara halus pada perangkat iPhone dan iPad dalam ekosistem Sistem Informasi Akademik (SIAKAD).

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `mode` | `CupertinoDatePickerMode` | Mode jenis pemilih (`date`, `time`, `dateAndTime`). |
| `onDateTimeChanged` | `ValueChanged<DateTime>` | **(WAJIB)** Callback fungsi saat posisi roda gulir tanggal/waktu berubah. |
| `initialDateTime` | `DateTime` | Tanggal dan waktu awal yang disorot saat roda pemilih dirender. |
| `minimumDate` | `DateTime?` | Batas tanggal terawal yang boleh diputar pada roda gulir. |
| `maximumDate` | `DateTime?` | Batas tanggal terakhir yang boleh diputar pada roda gulir. |
| `minuteInterval` | `int` | Interval kelipatan menit yang ditampilkan pada roda pemilih waktu (default: `1`). |
| `use24hFormat` | `bool` | Mengaktifkan format jam 24-jam pada mode `time` (default: `false`). |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const BasicCupertinoDatePickerApp());
}

class BasicCupertinoDatePickerApp extends StatelessWidget {
  const BasicCupertinoDatePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('CupertinoDatePicker')),
        child: SafeArea(
          child: Center(
            child: SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDate) {
                  print('Tanggal iOS dipilih: $newDate');
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Modal Bottom Sheet iOS Pemilih Bimbingan SIAKAD)

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadIosDatePickerApp());
}

class SiakadIosDatePickerApp extends StatelessWidget {
  const SiakadIosDatePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Bimbingan iOS SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(primaryColor: CupertinoColors.systemIndigo),
      home: BimbinganIosScreen(),
    );
  }
}

class BimbinganIosScreen extends StatefulWidget {
  const BimbinganIosScreen({super.key});

  @override
  State<BimbinganIosScreen> createState() => _BimbinganIosScreenState();
}

class _BimbinganIosScreenState extends State<BimbinganIosScreen> {
  DateTime _selectedDateTime = DateTime.now().add(const Duration(days: 1));

  void _showCupertinoDatePicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 280,
        padding: const EdgeInsets.only(top: 6.0),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('Batal'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoButton(
                    child: const Text('Pilih', style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,
                  initialDateTime: _selectedDateTime,
                  use24hFormat: true,
                  minuteInterval: 15,
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      _selectedDateTime = newDateTime;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('JANJI TEMU BIMBINGAN SKRIPSI'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Dosen PA: Dr. Eng. Ir. Hendra, M.T.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              CupertinoListTile(
                title: const Text('Jadwal Konsultasi'),
                subtitle: Text('${_selectedDateTime.day}/${_selectedDateTime.month}/${_selectedDateTime.year} pukul ${_selectedDateTime.hour}:${_selectedDateTime.minute.toString().padLeft(2, '0')}'),
                trailing: const Icon(CupertinoIcons.calendar),
                onTap: () => _showCupertinoDatePicker(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
