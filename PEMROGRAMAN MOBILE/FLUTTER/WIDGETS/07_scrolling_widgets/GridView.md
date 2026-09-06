# Dokumentasi Widget: GridView

## 1. Penjelasan Singkat & Fungsi
Widget `GridView` digunakan untuk menyusun widget anak dalam format matriks kisi/tabel dua dimensi (baris dan kolom) yang dapat digulir.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `gridDelegate` | `SliverGridDelegate` | Delegate pengatur tata letak kisi (SliverGridDelegateWithFixedCrossAxisCount atau SliverGridDelegateWithMaxCrossAxisExtent). |
| `children` | `List<Widget>` | Daftar widget anak yang disusun di dalam grid. |
| `padding` | `EdgeInsetsGeometry` | Jarak inset internal area grid. |
| `physics` | `ScrollPhysics` | Perilaku animasi scroll grid. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const GridViewDemoApp());
}

class GridViewDemoApp extends StatelessWidget {
  const GridViewDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo GridView Widget')),
        body: GridView(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: List.generate(
            6,
            (index) => Container(
              color: Colors.indigo.shade100,
              child: Center(child: Text('Modul ${index + 1}')),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Menu Layanan Utama Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MainMenuGridApp());
}

class MainMenuGridApp extends StatelessWidget {
  const MainMenuGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = [
      {'title': 'Rencana Studi', 'icon': Icons.assignment, 'color': Colors.blue},
      {'title': 'Hasil Studi', 'icon': Icons.grade, 'color': Colors.green},
      {'title': 'Jadwal Kuliah', 'icon': Icons.calendar_month, 'color': Colors.orange},
      {'title': 'Presensi', 'icon': Icons.check_circle, 'color': Colors.purple},
      {'title': 'Keuangan SPP', 'icon': Icons.payments, 'color': Colors.teal},
      {'title': 'Perpustakaan', 'icon': Icons.local_library, 'color': Colors.red},
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Layanan Akademik SIAKAD'),
          backgroundColor: Colors.indigo,
        ),
        body: GridView(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
          ),
          children: menus.map((menu) {
            return Card(
              elevation: 2,
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(menu['icon'] as IconData, size: 36, color: menu['color'] as Color),
                    const SizedBox(height: 8),
                    Text(menu['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
```
