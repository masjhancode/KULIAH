# Dokumentasi Widget: CheckboxListTile

## 1. Penjelasan Singkat & Fungsi
Widget `CheckboxListTile` menggabungkan `Checkbox` dengan `ListTile` sehingga menampilkan judul, sub-judul, dan respon ketukan pada seluruh area baris.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `bool?` | Status nilai centang (true/false). |
| `onChanged` | `ValueChanged<bool?>` | Callback respon saat baris ditekan. |
| `title` | `Widget` | Widget judul utama. |
| `subtitle` | `Widget` | Widget deskripsi sekunder. |
| `controlAffinity` | `ListTileControlAffinity` | Posisi letak kotak centang (leading di kiri atau trailing di kanan). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckboxListTileDemoApp());
}

class CheckboxListTileDemoApp extends StatelessWidget {
  const CheckboxListTileDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo CheckboxListTile')),
        body: CheckboxListTile(
          title: const Text('Setujui Syarat & Ketentuan'),
          value: true,
          onChanged: (val) {},
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Persetujuan Ketentuan Cuti & Bebas Pustaka)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CutiAgreementApp());
}

class CutiAgreementApp extends StatefulWidget {
  const CutiAgreementApp({super.key});

  @override
  State<CutiAgreementApp> createState() => _CutiAgreementAppState();
}

class _CutiAgreementAppState extends State<CutiAgreementApp> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Syarat Cuti Kuliah'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CheckboxListTile(
            activeColor: Colors.indigo,
            title: const Text('Pernyataan Bebas Pustaka & SPP', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Saya menyatakan telah melunasi seluruh kewajiban administrasi.'),
            value: _agreed,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (val) => setState(() => _agreed = val ?? false),
          ),
        ),
      ),
    );
  }
}
```
