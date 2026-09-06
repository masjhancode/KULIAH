# Dokumentasi Widget: GridView.custom

## 1. Penjelasan Singkat & Fungsi
Konstruktor `GridView.custom` memberikan fleksibilitas penuh dalam merender elemen grid melalui `SliverChildDelegate` dan `SliverGridDelegate`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `gridDelegate` | `SliverGridDelegate` | Delegate pengatur struktur kisi grid. |
| `childrenDelegate` | `SliverChildDelegate` | Delegate pembuat anak grid. |
| `padding` | `EdgeInsetsGeometry` | Jarak inset internal area grid. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const GridViewCustomDemoApp());
}

class GridViewCustomDemoApp extends StatelessWidget {
  const GridViewCustomDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo GridView.custom')),
        body: GridView.custom(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => Card(child: Center(child: Text('${index + 1}'))),
            childCount: 12,
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pilihan Sesi Jadwal Praktikum)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const LabSessionGridApp());
}

class LabSessionGridApp extends StatelessWidget {
  const LabSessionGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pilih Sesi Praktikum'),
          backgroundColor: Colors.indigo,
        ),
        body: GridView.custom(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.4,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sesi #${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      const Text('08:00 - 10:00 WIB', style: TextStyle(fontSize: 12)),
                      const Text('Sisa Kuota: 5', style: TextStyle(fontSize: 10, color: Colors.green)),
                    ],
                  ),
                ),
              );
            },
            childCount: 6,
          ),
        ),
      ),
    );
  }
}
```
