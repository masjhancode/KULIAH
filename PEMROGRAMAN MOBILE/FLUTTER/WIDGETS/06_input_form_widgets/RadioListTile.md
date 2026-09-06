# Dokumentasi Widget: RadioListTile

## 1. Penjelasan Singkat & Fungsi
Widget `RadioListTile` mengintegrasikan `Radio` button dengan `ListTile` yang dilengkapi label judul, sub-judul, dan ikon.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `T` | Nilai opsi radio. |
| `groupValue` | `T` | Nilai kelompok terpilih. |
| `onChanged` | `ValueChanged<T?>` | Callback respon saat baris opsi ditekan. |
| `title` | `Widget` | Widget judul opsi. |
| `subtitle` | `Widget` | Widget keterangan sekunder. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RadioListTileDemoApp());
}

class RadioListTileDemoApp extends StatelessWidget {
  const RadioListTileDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo RadioListTile')),
        body: RadioListTile<int>(
          title: const Text('Opsi 1'),
          value: 1,
          groupValue: 1,
          onChanged: (v) {},
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pilihan Kelas Paralel Mata Kuliah KRS)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ClassSelectRadioApp());
}

class ClassSelectRadioApp extends StatefulWidget {
  const ClassSelectRadioApp({super.key});

  @override
  State<ClassSelectRadioApp> createState() => _ClassSelectRadioAppState();
}

class _ClassSelectRadioAppState extends State<ClassSelectRadioApp> {
  String _selectedClass = 'A';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pilih Kelas Pemrograman Seluler'), backgroundColor: Colors.indigo),
        body: ListView(
          children: [
            RadioListTile<String>(
              activeColor: Colors.indigo,
              title: const Text('Kelas A (Senin, 08:00 WIB)'),
              subtitle: const Text('Dosen: Dr. Ir. Hendra, M.T. (Kuota: Tersisa 3)'),
              value: 'A',
              groupValue: _selectedClass,
              onChanged: (val) => setState(() => _selectedClass = val!),
            ),
            RadioListTile<String>(
              activeColor: Colors.indigo,
              title: const Text('Kelas B (Rabu, 10:00 WIB)'),
              subtitle: const Text('Dosen: Budi Santoso, M.Kom. (Kuota: Tersisa 8)'),
              value: 'B',
              groupValue: _selectedClass,
              onChanged: (val) => setState(() => _selectedClass = val!),
            ),
          ],
        ),
      ),
    );
  }
}
```
