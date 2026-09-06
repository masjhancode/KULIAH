# Dokumentasi Widget: StatefulBuilder

## 1. Penjelasan Singkat & Fungsi
Widget `StatefulBuilder` memfasilitasi manajemen status lokal (*local state management*) sederhana tanpa perlu mengubah seluruh widget induk menjadi `StatefulWidget`, biasanya digunakan di dalam dialog modal atau bottom sheet.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `builder` | `StatefulWidgetBuilder` | Callback fungsi perender `Widget Function(BuildContext, StateSetter)` di mana `StateSetter` (setState lokal) digunakan untuk memperbarui state internal builder. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const StatefulBuilderDemoApp());
}

class StatefulBuilderDemoApp extends StatelessWidget {
  const StatefulBuilderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo StatefulBuilder')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              int count = 0;
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Counter Dialog'),
                  content: StatefulBuilder(
                    builder: (context, setStateLocal) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Hitungan: $count'),
                          ElevatedButton(
                            onPressed: () => setStateLocal(() => count++),
                            child: const Text('Tambah'),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
            child: const Text('Buka Dialog Counter'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pemilihan Opsi SKS Tambahan pada Modal Konfirmasi Pengisian KRS)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KrsStatefulBuilderModalApp());
}

class KrsStatefulBuilderModalApp extends StatelessWidget {
  const KrsStatefulBuilderModalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pengisian KRS'), backgroundColor: Colors.indigo),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: () {
              bool includeLab = false;
              showModalBottomSheet(
                context: context,
                builder: (context) => StatefulBuilder(
                  builder: (context, setModalState) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Opsi Tambahan SKS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          CheckboxListTile(
                            title: const Text('Tambah Sesi Praktikum (1 SKS)'),
                            value: includeLab,
                            onChanged: (val) => setModalState(() => includeLab = val ?? false),
                          ),
                          Text('Total SKS: ${includeLab ? 21 : 20}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
                          const SizedBox(height: 12),
                          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Simpan Opsi')),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            child: const Text('Opsi SKS Tambahan', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
```
