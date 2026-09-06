# Dokumentasi Widget: FilterChip

## 1. Penjelasan Singkat & Fungsi
Widget `FilterChip` memanfaatkan kotak centang berupa chip untuk melakukan penyaringan (*filtering*) data dinamis.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `label` | `Widget` | Widget label nama filter. |
| `selected` | `bool` | Status penyeleksian penyaring data. |
| `onSelected` | `ValueChanged<bool>` | Callback pemicu perubahan filter. |
| `checkmarkColor` | `Color` | Warna tanda centang filter. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FilterChipDemoApp());
}

class FilterChipDemoApp extends StatelessWidget {
  const FilterChipDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FilterChip')),
        body: Center(
          child: FilterChip(
            label: const Text('Filter Teori'),
            selected: false,
            onSelected: (v) {},
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Filter Kategori Perkuliahan (Teori & Praktikum))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MatkulFilterChipApp());
}

class MatkulFilterChipApp extends StatefulWidget {
  const MatkulFilterChipApp({super.key});

  @override
  State<MatkulFilterChipApp> createState() => _MatkulFilterChipAppState();
}

class _MatkulFilterChipAppState extends State<MatkulFilterChipApp> {
  bool _isTeori = true;
  bool _isPraktikum = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Filter Matkul'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              FilterChip(
                label: const Text('Kelas Teori'),
                selected: _isTeori,
                onSelected: (val) => setState(() => _isTeori = val),
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Kelas Praktikum'),
                selected: _isPraktikum,
                onSelected: (val) => setState(() => _isPraktikum = val),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
