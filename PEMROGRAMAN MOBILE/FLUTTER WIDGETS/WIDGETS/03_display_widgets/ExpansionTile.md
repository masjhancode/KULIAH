# Dokumentasi Widget: ExpansionTile

## 1. Penjelasan Singkat & Fungsi
Widget `ExpansionTile` merupakan baris `ListTile` yang dapat dibuka-tutup (*expand/collapse*) untuk menyembunyikan atau menampilkan sub-widget anak.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `title` | `Widget` | Widget judul utama accordion. |
| `subtitle` | `Widget` | Widget deskripsi sekunder. |
| `children` | `List<Widget>` | Daftar sub-widget yang akan ditayangkan saat panel dibuka. |
| `initiallyExpanded` | `bool` | Menentukan apakah panel terbuka secara otomatis pada inisialisasi awal. |
| `leading` | `Widget` | Widget ikon di sebelah kiri judul. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpansionTileDemoApp());
}

class ExpansionTileDemoApp extends StatelessWidget {
  const ExpansionTileDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ExpansionTile')),
        body: const ExpansionTile(
          title: Text('Detail Mata Kuliah'),
          children: [
            ListTile(title: Text('Dosen: Dr. Ir. Hendra')),
            ListTile(title: Text('SKS: 3 SKS')),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Accordion Pertanyaan FAQ Layanan Akademik)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FaqExpansionApp());
}

class FaqExpansionApp extends StatelessWidget {
  const FaqExpansionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('FAQ Bantuan Akademik'), backgroundColor: Colors.indigo),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: const [
            Card(
              child: ExpansionTile(
                leading: Icon(Icons.help_outline, color: Colors.indigo),
                title: Text('Bagaimana syarat pengajuan Cuti Kuliah?', style: TextStyle(fontWeight: FontWeight.bold)),
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text('Pengajuan cuti dapat dilakukan setelah menempuh minimal 2 semester dan telah melunasi seluruh kewajiban keuangan SPP.'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
