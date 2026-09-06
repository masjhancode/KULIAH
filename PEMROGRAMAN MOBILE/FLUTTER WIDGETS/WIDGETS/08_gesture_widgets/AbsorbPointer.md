# Dokumentasi Widget: AbsorbPointer

## 1. Penjelasan Singkat & Fungsi
Widget `AbsorbPointer` memblokir seluruh interaksi gestur sentuhan pada diri dan anak-anaknya (*absorbing events*) sehingga elemen di bawahnya juga tidak menerima sentuhan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `absorbing` | `bool` | Status penyerapan/pemblokiran sentuhan (true = terblokir, false = normal). |
| `child` | `Widget` | Widget anak yang akan diblokir interaksinya. |
| `ignoringSemantics` | `bool` | Menentukan apakah mengabaikan pohon semantik aksesibilitas. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AbsorbPointerDemoApp());
}

class AbsorbPointerDemoApp extends StatelessWidget {
  const AbsorbPointerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo AbsorbPointer')),
        body: Center(
          child: AbsorbPointer(
            absorbing: true,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Tombol Terblokir'),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Memblokir Form Pengisian KRS saat Masa Pengisian Ditutup)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KrsDisabledFormApp());
}

class KrsDisabledFormApp extends StatelessWidget {
  const KrsDisabledFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pengisian KRS (Tutup)'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: AbsorbPointer(
            absorbing: true,
            child: Opacity(
              opacity: 0.5,
              child: Column(
                children: [
                  const TextField(decoration: InputDecoration(labelText: 'Pilih Matkul', border: OutlineInputBorder())),
                  const SizedBox(height: 16),
                  ElevatedButton(onPressed: () {}, child: const Text('Submit KRS')),
                  const SizedBox(height: 20),
                  const Text('Masa pengisian KRS telah berakhir!', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
