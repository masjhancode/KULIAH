# Dokumentasi Widget: DropdownButton

## 1. Penjelasan Singkat & Fungsi
Widget `DropdownButton` merupakan tombol penayang daftar pilihan melayang (*dropdown menu*) untuk memilih satu opsi dari beberapa item `DropdownMenuItem`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `T?` | Nilai item yang terpilih saat ini. |
| `items` | `List<DropdownMenuItem<T>>` | Daftar pilihan item dropdown. |
| `onChanged` | `ValueChanged<T?>` | Callback fungsi saat salah satu item opsi dipilih. |
| `hint` | `Widget` | Widget petunjuk awal saat belum ada nilai terpilih. |
| `isExpanded` | `bool` | Menentukan apakah lebar dropdown memenuhi ruang horizontal parent. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DropdownDemoApp());
}

class DropdownDemoApp extends StatelessWidget {
  const DropdownDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo DropdownButton')),
        body: Center(
          child: DropdownButton<String>(
            value: 'A',
            items: const [
              DropdownMenuItem(value: 'A', child: Text('Opsi A')),
              DropdownMenuItem(value: 'B', child: Text('Opsi B')),
            ],
            onChanged: (v) {},
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pilihan Pemilikan Semester Aktif Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SemesterDropdownApp());
}

class SemesterDropdownApp extends StatefulWidget {
  const SemesterDropdownApp({super.key});

  @override
  State<SemesterDropdownApp> createState() => _SemesterDropdownAppState();
}

class _SemesterDropdownAppState extends State<SemesterDropdownApp> {
  String _selectedSemester = 'Semester 6';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pilih Semester KHS'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DropdownButton<String>(
            value: _selectedSemester,
            isExpanded: true,
            onChanged: (val) => setState(() => _selectedSemester = val!),
            items: List.generate(8, (i) => 'Semester ${i + 1}').map((sem) {
              return DropdownMenuItem(value: sem, child: Text(sem));
            }).toList(),
          ),
        ),
      ),
    );
  }
}
```
