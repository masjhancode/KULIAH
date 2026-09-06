# Dokumentasi Widget: ExpansionPanelList

## 1. Penjelasan Singkat & Fungsi
Widget `ExpansionPanelList` mengelola serangkaian panel ekspansi (*expansion panels*) berkesinambungan dengan kontrol callback animasi pembukaan panel.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `children` | `List<ExpansionPanel>` | Daftar panel ekspansi yang dikelola. |
| `expansionCallback` | `ExpansionPanelCallback` | Callback fungsi saat salah satu panel diklik buka/tutup. |
| `animationDuration` | `Duration` | Durasi waktu animasi transmisi ekspansi panel. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ExpansionPanelDemoApp());
}

class ExpansionPanelDemoApp extends StatelessWidget {
  const ExpansionPanelDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ExpansionPanelList')),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (index, isExpanded) {},
            children: [
              ExpansionPanel(
                headerBuilder: (context, isOpen) => const ListTile(title: Text('Panel 1')),
                body: const ListTile(title: Text('Isi Panel 1')),
                isExpanded: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Rincian Silabus Per-Semester Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SyllabusExpansionListApp());
}

class SyllabusExpansionListApp extends StatefulWidget {
  const SyllabusExpansionListApp({super.key});

  @override
  State<SyllabusExpansionListApp> createState() => _SyllabusExpansionListAppState();
}

class _SyllabusExpansionListAppState extends State<SyllabusExpansionListApp> {
  final List<bool> _isOpen = [true, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Silabus Program Studi'), backgroundColor: Colors.indigo),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() => _isOpen[panelIndex] = isExpanded);
            },
            children: [
              ExpansionPanel(
                headerBuilder: (c, open) => const ListTile(title: Text('Modul 1: Pengenalan Flutter & Dart', style: TextStyle(fontWeight: FontWeight.bold))),
                body: const Padding(padding: EdgeInsets.all(16), child: Text('Membahas dasar widget, layout, dan manajemen state.')),
                isExpanded: _isOpen[0],
              ),
              ExpansionPanel(
                headerBuilder: (c, open) => const ListTile(title: Text('Modul 2: Integrasi REST API & Database', style: TextStyle(fontWeight: FontWeight.bold))),
                body: const Padding(padding: EdgeInsets.all(16), child: Text('Membahas HTTP request, Laravel backend API, dan SQLite.')),
                isExpanded: _isOpen[1],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
