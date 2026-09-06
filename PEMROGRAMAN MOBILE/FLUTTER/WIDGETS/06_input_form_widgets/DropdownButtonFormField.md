# Dokumentasi Widget: DropdownButtonFormField

## 1. Penjelasan Singkat & Fungsi
Widget `DropdownButtonFormField` menggabungkan `DropdownButton` ke dalam komponen `TextFormField` sehingga dapat dimasukkan ke dalam `Form` dengan fitur validasi (*validator*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `T?` | Nilai opsi terpilih. |
| `items` | `List<DropdownMenuItem<T>>` | Daftar item pilihan dropdown. |
| `onChanged` | `ValueChanged<T?>` | Callback fungsi saat terjadi pemilihan opsi. |
| `validator` | `FormFieldValidator<T>` | Fungsi uji validasi masukan pilihan. |
| `decoration` | `InputDecoration` | Pengaturan dekorasi visual kolom input. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DropdownFormDemoApp());
}

class DropdownFormDemoApp extends StatelessWidget {
  const DropdownFormDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo DropdownButtonFormField')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Pilih Opsi'),
            items: const [
              DropdownMenuItem(value: '1', child: Text('Item 1')),
            ],
            onChanged: (v) {},
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Form Pemilihan Dosen Pembimbing Akademik (DPA))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DpaFormDropdownApp());
}

class DpaFormDropdownApp extends StatelessWidget {
  const DpaFormDropdownApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Plotting DPA'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Pilih Dosen Pembimbing Akademik',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
            items: const [
              DropdownMenuItem(value: 'dosen1', child: Text('Dr. Ir. Hendra, M.T.')),
              DropdownMenuItem(value: 'dosen2', child: Text('Budi Santoso, M.Kom.')),
              DropdownMenuItem(value: 'dosen3', child: Text('Dr. Sita Rahma, S.T.')),
            ],
            onChanged: (val) {},
            validator: (val) => val == null ? 'Wajib memilih dosen DPA' : null,
          ),
        ),
      ),
    );
  }
}
```
