# Dokumentasi Widget: TextField

## 1. Penjelasan Singkat & Fungsi
Widget `TextField` merupakan kontrol masukan teks tingkat dasar yang memungkinkan pengguna memasukkan teks melalui keyboard seluler.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `controller` | `TextEditingController` | Objek pengontrol isi masukan teks dan posisi kursor. |
| `decoration` | `InputDecoration` | Kustomisasi penampilan visual (label, hint, icon, border, errorText). |
| `keyboardType` | `TextInputType` | Tipe papan ketik (text, number, emailAddress, phone, dsb). |
| `obscureText` | `bool` | Menyembunyikan teks masukan dengan karakter sensor (untuk password). |
| `onChanged` | `ValueChanged<String>` | Callback respon yang dipanggil setiap kali teks masukan berubah. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const TextFieldDemoApp());
}

class TextFieldDemoApp extends StatelessWidget {
  const TextFieldDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo TextField')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Pencarian',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Input Login NIM Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const NimTextFieldApp());
}

class NimTextFieldApp extends StatefulWidget {
  const NimTextFieldApp({super.key});

  @override
  State<NimTextFieldApp> createState() => _NimTextFieldAppState();
}

class _NimTextFieldAppState extends State<NimTextFieldApp> {
  final TextEditingController _nimController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Portal Login Mahasiswa'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: _nimController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Nomor Induk Mahasiswa (NIM)',
                  hintText: 'Contoh: 2026090123',
                  prefixIcon: const Icon(Icons.badge, color: Colors.indigo),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _nimController.clear(),
                  ),
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
