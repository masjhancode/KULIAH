# Dokumentasi Widget: SegmentedButton

## 1. Penjelasan Singkat & Fungsi
Widget `SegmentedButton` merupakan kelompok tombol segmen standar Material 3 yang memungkinkan pengguna memilih satu atau beberapa opsi pilihan eksklusif (seperti filter status).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `segments` | `List<ButtonSegment<T>>` | Daftar segmen opsi pilihan (terdiri dari value, icon, label). |
| `selected` | `Set<T>` | Set data opsi yang sedang dipilih. |
| `onSelectionChanged` | `ValueChanged<Set<T>>` | Callback fungsi saat terjadi perubahan pilihan segmen. |
| `multiSelectionEnabled` | `bool` | Menentukan apakah opsi dapat dipilih lebih dari satu sekaligus. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SegmentedDemoApp());
}

class SegmentedDemoApp extends StatelessWidget {
  const SegmentedDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo SegmentedButton')),
        body: Center(
          child: SegmentedButton<int>(
            segments: const [
              ButtonSegment(value: 1, label: Text('Hari Ini')),
              ButtonSegment(value: 2, label: Text('Minggu Ini')),
            ],
            selected: const {1},
            onSelectionChanged: (newSelection) {},
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Filter Status Tagihan SPP (Material 3 SegmentedButton))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SppFilterSegmentedApp());
}

class SppFilterSegmentedApp extends StatefulWidget {
  const SppFilterSegmentedApp({super.key});

  @override
  State<SppFilterSegmentedApp> createState() => _SppFilterSegmentedAppState();
}

enum SppFilter { semua, lunas, belumLunas }

class _SppFilterSegmentedAppState extends State<SppFilterSegmentedApp> {
  SppFilter _selectedFilter = SppFilter.semua;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(title: const Text('Status Keuangan SPP')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SegmentedButton<SppFilter>(
                segments: const [
                  ButtonSegment(value: SppFilter.semua, label: Text('Semua')),
                  ButtonSegment(value: SppFilter.lunas, label: Text('Lunas')),
                  ButtonSegment(value: SppFilter.belumLunas, label: Text('Belum Lunas')),
                ],
                selected: {_selectedFilter},
                onSelectionChanged: (newSelection) {
                  setState(() {
                    _selectedFilter = newSelection.first;
                  });
                },
              ),
              const SizedBox(height: 24),
              Text('Filter Terpilih: ${_selectedFilter.name.toUpperCase()}', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
```
