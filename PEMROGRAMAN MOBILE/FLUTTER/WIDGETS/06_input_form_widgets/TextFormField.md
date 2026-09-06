# Dokumentasi Widget: TextFormField

## 1. Penjelasan Singkat & Fungsi
Widget `TextFormField` merupakan varian `TextField` yang terintegrasi dengan widget `Form` untuk mendukung validasi otomatis (`validator`) dan penghematan nilai state (`onSaved`).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `validator` | `FormFieldValidator<String>` | Fungsi uji validasi yang mengembalikan string pesan eror jika input tidak sesuai. |
| `onSaved` | `FormFieldSetter<String>` | Callback penyiapan nilai masukan saat form disimpan. |
| `initialValue` | `String` | Nilai teks awal pada kolom input. |
| `autovalidateMode` | `AutovalidateMode` | Mode pemicu validasi otomatis (onUserInteraction, always, disabled). |
| `decoration` | `InputDecoration` | Pengaturan dekorasi visual kolom input. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const TextFormFieldDemoApp());
}

class TextFormFieldDemoApp extends StatelessWidget {
  const TextFormFieldDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo TextFormField')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Nama Lengkap'),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Nama wajib diisi';
              return null;
            },
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Formulir Validasi Email Kampus & Nama Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentFormApp());
}

class StudentFormApp extends StatelessWidget {
  const StudentFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Biodata Mahasiswa'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email Institusi Kampus',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || !value.contains('@mahasiswa.ac.id')) {
                    return 'Gunakan email resmi institusi (@mahasiswa.ac.id)';
                  }
                  return null;
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
