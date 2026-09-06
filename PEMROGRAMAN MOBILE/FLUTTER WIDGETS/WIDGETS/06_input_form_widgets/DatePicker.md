# Dokumentasi Widget: DatePicker

## 1. Penjelasan Singkat & Fungsi
Fungsi `showDatePicker` menampilkan dialog kalender interaktif Material Design untuk memilih tanggal (tahun, bulan, hari).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `context` | `BuildContext` | Konteks build lokasi pemanggilan dialog. |
| `initialDate` | `DateTime` | Tanggal yang disorot pertama kali saat dialog dibuka. |
| `firstDate` | `DateTime` | Batas tanggal paling awal yang dapat dipilih. |
| `lastDate` | `DateTime` | Batas tanggal paling akhir yang dapat dipilih. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DatePickerDemoApp());
}

class DatePickerDemoApp extends StatelessWidget {
  const DatePickerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo DatePicker')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2030),
              );
            },
            child: const Text('Pilih Tanggal'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pemilih Tanggal Pengajuan Cuti Kuliah Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CutiDatePickerApp());
}

class CutiDatePickerApp extends StatefulWidget {
  const CutiDatePickerApp({super.key});

  @override
  State<CutiDatePickerApp> createState() => _CutiDatePickerAppState();
}

class _CutiDatePickerAppState extends State<CutiDatePickerApp> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pengajuan Tanggal Cuti'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListTile(
                tileColor: Colors.indigo.shade50,
                leading: const Icon(Icons.calendar_month, color: Colors.indigo),
                title: Text(_selectedDate == null ? 'Belum Pilih Tanggal' : 'Tanggal: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
                trailing: const Icon(Icons.arrow_drop_down),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2028),
                  );
                  if (picked != null) {
                    setState(() => _selectedDate = picked);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
