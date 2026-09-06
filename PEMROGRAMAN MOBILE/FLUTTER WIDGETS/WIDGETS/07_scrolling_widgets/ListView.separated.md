# Dokumentasi Widget: ListView.separated

## 1. Penjelasan Singkat & Fungsi
Konstruktor `ListView.separated` digunakan untuk merender daftar elemen dinamis yang dilengkapi dengan widget pemisah (*separator*) di antara setiap item.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `itemCount` | `int` | Jumlah total elemen item pada daftar. |
| `itemBuilder` | `IndexedWidgetBuilder` | Fungsi perender item berdasarkan indeks. |
| `separatorBuilder` | `IndexedWidgetBuilder` | Fungsi perender widget pemisah (misal Divider) di antara dua item. |
| `padding` | `EdgeInsetsGeometry` | Jarak inset di sekeliling daftar. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ListViewSeparatedDemoApp());
}

class ListViewSeparatedDemoApp extends StatelessWidget {
  const ListViewSeparatedDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ListView.separated')),
        body: ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Mata Kuliah #${index + 1}'),
            );
          },
          separatorBuilder: (context, index) => const Divider(height: 1, color: Colors.grey),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Log Bimbingan Akademik Dosen PA)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BimbinganLogApp());
}

class BimbinganLogApp extends StatelessWidget {
  const BimbinganLogApp({super.key});

  @override
  Widget build(BuildContext context) {
    final logs = [
      {'date': '24 Ags 2026', 'topic': 'Konsultasi Judul Skripsi / TA', 'status': 'Disetujui'},
      {'date': '10 Ags 2026', 'topic': 'Evaluasi Kemajuan Studi Semester 5', 'status': 'Selesai'},
      {'date': '02 Feb 2026', 'topic': 'Pengajuan Permohonan Beasiswa', 'status': 'Selesai'},
      {'date': '15 Sep 2025', 'topic': 'Pengisian KRS Semester 5', 'status': 'Selesai'},
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Log Konsultasi Dosen PA'),
          backgroundColor: Colors.indigo,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemCount: logs.length,
          itemBuilder: (context, index) {
            final log = logs[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.event_note, color: Colors.indigo),
              title: Text(log['topic']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Tanggal: ${log['date']}'),
              trailing: Chip(
                label: Text(log['status']!, style: const TextStyle(fontSize: 12)),
                backgroundColor: Colors.green.shade50,
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(height: 24, thickness: 1),
        ),
      ),
    );
  }
}
```
