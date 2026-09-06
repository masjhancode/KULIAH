# Dokumentasi Widget: CupertinoDatePicker

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoDatePicker` menyediakan kontrol pemilih tanggal bergaya iOS berbentuk roda putar (*iOS date slot wheel*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `mode` | `CupertinoDatePickerMode` | Modus pemilih (date, time, dateAndTime) (default: dateAndTime). |
| `onDateTimeChanged` | `ValueChanged<DateTime>` | Callback saat nilai tanggal diputar diubah (wajib). |
| `initialDateTime` | `DateTime` | Waktu tanggal awal. |
| `minimumDate` | `DateTime?` | Batas tanggal terkecil. |
| `maximumDate` | `DateTime?` | Batas tanggal terbesar. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoDatePickerDemoApp());
}

class CupertinoDatePickerDemoApp extends StatefulWidget {
  const CupertinoDatePickerDemoApp({super.key});

  @override
  State<CupertinoDatePickerDemoApp> createState() => _CupertinoDatePickerDemoAppState();
}

class _CupertinoDatePickerDemoAppState extends State<CupertinoDatePickerDemoApp> {
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: _date,
              onDateTimeChanged: (d) => setState(() => _date = d),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pemilih Tanggal Lahir Mahasiswa pada Form Biodata SIAKAD iOS)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const StudentBirthDatePickerIosApp());
}

class StudentBirthDatePickerIosApp extends StatefulWidget {
  const StudentBirthDatePickerIosApp({super.key});

  @override
  State<StudentBirthDatePickerIosApp> createState() => _StudentBirthDatePickerIosAppState();
}

class _StudentBirthDatePickerIosAppState extends State<StudentBirthDatePickerIosApp> {
  DateTime _selectedDate = DateTime(2003, 5, 15);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('Biodata Mahasiswa')),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Tanggal Lahir: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _selectedDate,
                  onDateTimeChanged: (newDate) => setState(() => _selectedDate = newDate),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
