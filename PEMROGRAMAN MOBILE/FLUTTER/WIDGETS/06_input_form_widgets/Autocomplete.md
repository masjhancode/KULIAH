# Dokumentasi Widget: Autocomplete

## 1. Penjelasan Singkat & Fungsi
Widget `Autocomplete` menyediakan antarmuka pencarian masukan teks yang memberikan saran (*suggestions*) otomatis saat pengguna mengetik huruf awal.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `optionsBuilder` | `AutocompleteOptionsBuilder<T>` | Callback fungsi pencarian yang mengembalikan daftar saran sesuai teks masukan. |
| `onSelected` | `AutocompleteOnSelected<T>` | Callback saat pengguna memilih salah satu saran dari daftar. |
| `fieldViewBuilder` | `AutocompleteFieldViewBuilder` | Fungsi kustom perender tampilan TextField input pencarian. |
| `displayStringForOption` | `AutocompleteOptionToString<T>` | Konversi objek opsi menjadi representasi String. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AutocompleteDemoApp());
}

class AutocompleteDemoApp extends StatelessWidget {
  const AutocompleteDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Autocomplete')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Autocomplete<String>(
            optionsBuilder: (textValue) {
              if (textValue.text.isEmpty) return const Iterable<String>.empty();
              return ['Informatika', 'Sistem Informasi'].where((e) => e.contains(textValue.text));
            },
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pencarian Kode / Nama Mata Kuliah KRS)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MatkulAutocompleteApp());
}

class MatkulAutocompleteApp extends StatelessWidget {
  const MatkulAutocompleteApp({super.key});

  static const List<String> _matkulList = [
    'TIF301 - Pemrograman Seluler II',
    'TIF302 - Keamanan Komputer & Siber',
    'TIF303 - Kecerdasan Buatan (AI)',
    'TIF304 - Manajemen Proyek Perangkat Lunak',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Cari Mata Kuliah'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) return const Iterable<String>.empty();
              return _matkulList.where((option) {
                return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selection) {},
          ),
        ),
      ),
    );
  }
}
```
