# Dokumentasi Widget: Tooltip

## 1. Deskripsi & Fungsi Modul

Widget `Tooltip` merupakan komponen penjelas berupa kotak teks bantuan melayang (*hover/long-press text hint*) pada Flutter. Widget ini akan menampilkan label penjelas saat pengguna mengarahkan kursor mouse (*hover*) pada tampilan web/desktop atau saat menekan lama (*long-press*) sebuah tombol ikon pada aplikasi seluler SIAKAD.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `message` | `String` | **(WAJIB)** Teks pesan bantuan yang akan ditampilkan di dalam kotak tooltip (misal `"Cetak KHS"`). |
| `child` | `Widget?` | **(WAJIB)** Widget anak yang akan mendeteksi gestur hover/long-press (biasanya `IconButton` atau `Icon`). |
| `waitDuration` | `Duration?` | Durasi penundaan waktu sebelum tooltip dimunculkan saat kursor melayang di atas widget. |
| `showDuration` | `Duration?` | Durasi lama waktu tooltip tetap terlihat sebelum hilang kembali. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicTooltipApp());
}

class BasicTooltipApp extends StatelessWidget {
  const BasicTooltipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic Tooltip')),
        body: Center(
          child: Tooltip(
            message: 'Ini adalah pesan bantuan Tooltip',
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Tekan Lama'),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Petunjuk Tombol Aksi KHS SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadTooltipApp());
}

class SiakadTooltipApp extends StatelessWidget {
  const SiakadTooltipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tooltip SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const TooltipKhsScreen(),
    );
  }
}

class TooltipKhsScreen extends StatelessWidget {
  const TooltipKhsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KARTU HASIL STUDI (KHS)'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          Tooltip(
            message: 'Cetak Lembar KHS PDF',
            child: IconButton(
              icon: const Icon(Icons.print),
              onPressed: () {},
            ),
          ),
          Tooltip(
            message: 'Kirim ke Email Mahasiswa',
            child: IconButton(
              icon: const Icon(Icons.email),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('Tekan lama tombol ikon di pojok kanan atas untuk melihat petunjuk Tooltip'),
      ),
    );
  }
}
```
