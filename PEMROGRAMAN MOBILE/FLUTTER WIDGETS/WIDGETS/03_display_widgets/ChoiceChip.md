# Dokumentasi Widget: ChoiceChip

## 1. Penjelasan Singkat & Fungsi
Widget `ChoiceChip` memungkinkan pengguna memilih satu dari sekumpulan pilihan kuis/filter berstatus tunggal.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `label` | `Widget` | Widget label pilihan. |
| `selected` | `bool` | Status penyeleksian opsi. |
| `onSelected` | `ValueChanged<bool>` | Callback fungsi respon sentuhan penyeleksian opsi. |
| `selectedColor` | `Color` | Warna penanda chip saat posisi terpilih. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ChoiceChipDemoApp());
}

class ChoiceChipDemoApp extends StatelessWidget {
  const ChoiceChipDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ChoiceChip')),
        body: Center(
          child: ChoiceChip(
            label: const Text('Pilihan A'),
            selected: true,
            onSelected: (v) {},
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pilihan Mode Perkuliahan (Tatap Muka / Online))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const LectureModeChoiceApp());
}

class LectureModeChoiceApp extends StatefulWidget {
  const LectureModeChoiceApp({super.key});

  @override
  State<LectureModeChoiceApp> createState() => _LectureModeChoiceAppState();
}

class _LectureModeChoiceAppState extends State<LectureModeChoiceApp> {
  int _choice = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Mode Perkuliahan'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ChoiceChip(
                label: const Text('Tatap Muka (Luring)'),
                selected: _choice == 0,
                selectedColor: Colors.indigo.shade100,
                onSelected: (val) => setState(() => _choice = 0),
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text('Online (Daring)'),
                selected: _choice == 1,
                selectedColor: Colors.indigo.shade100,
                onSelected: (val) => setState(() => _choice = 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
