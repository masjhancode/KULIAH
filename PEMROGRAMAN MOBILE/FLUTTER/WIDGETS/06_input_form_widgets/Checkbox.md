# Dokumentasi Widget: Checkbox

## 1. Penjelasan Singkat & Fungsi
Widget `Checkbox` merupakan elemen pilihan kotak centang boolean (*true/false*) yang memungkinkan pengguna mengaktifkan atau menonaktifkan suatu opsi.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `bool?` | Status nilai centang (true, false, atau null jika tristate). |
| `onChanged` | `ValueChanged<bool?>` | Callback fungsi saat kotak centang ditekan. |
| `activeColor` | `Color` | Warna pengisi kotak saat posisi tercentang (checked). |
| `checkColor` | `Color` | Warna simbol centang di dalam kotak. |
| `tristate` | `bool` | Menentukan apakah mendukung 3 status nilai (true, false, null). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckboxDemoApp());
}

class CheckboxDemoApp extends StatelessWidget {
  const CheckboxDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Checkbox')),
        body: Center(
          child: Checkbox(
            value: true,
            onChanged: (val) {},
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pilihan Centang Pengambilan Mata Kuliah KRS)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KrsCheckboxApp());
}

class KrsCheckboxApp extends StatefulWidget {
  const KrsCheckboxApp({super.key});

  @override
  State<KrsCheckboxApp> createState() => _KrsCheckboxAppState();
}

class _KrsCheckboxAppState extends State<KrsCheckboxApp> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pilih Matkul KRS'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Checkbox(
                value: _isSelected,
                activeColor: Colors.indigo,
                onChanged: (val) {
                  setState(() => _isSelected = val ?? false);
                },
              ),
              const Text('TIF301 - Pemrograman Seluler II (3 SKS)', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
```
