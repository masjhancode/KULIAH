# Dokumentasi Widget: TimePicker

## 1. Penjelasan Singkat & Fungsi
Fungsi `showTimePicker` menampilkan dialog jam analog/digital Material Design untuk memilih waktu (jam dan menit).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `context` | `BuildContext` | Konteks build pemanggilan dialog time picker. |
| `initialTime` | `TimeOfDay` | Waktu jam dan menit awal yang ditayangkan pada dialog. |
| `builder` | `TransitionBuilder` | Callback opsional untuk memodifikasi tema dialog. |
| `initialEntryMode` | `TimePickerEntryMode` | Mode input awal (dial analog atau input teks digital). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const TimePickerDemoApp());
}

class TimePickerDemoApp extends StatelessWidget {
  const TimePickerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo TimePicker')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
            },
            child: const Text('Pilih Jam'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pemilih Jam Janji Bimbingan Skripsi Dosen PA)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BimbinganTimePickerApp());
}

class BimbinganTimePickerApp extends StatefulWidget {
  const BimbinganTimePickerApp({super.key});

  @override
  State<BimbinganTimePickerApp> createState() => _BimbinganTimePickerAppState();
}

class _BimbinganTimePickerAppState extends State<BimbinganTimePickerApp> {
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Jadwalkan Konsultasi PA'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListTile(
                tileColor: Colors.indigo.shade50,
                leading: const Icon(Icons.access_time, color: Colors.indigo),
                title: Text(_selectedTime == null ? 'Belum Pilih Jam Konsultasi' : 'Waktu: ${_selectedTime!.format(context)}'),
                trailing: const Icon(Icons.arrow_drop_down),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    setState(() => _selectedTime = picked);
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
