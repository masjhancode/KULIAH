# Dokumentasi Widget: ListView

## 1. Penjelasan Singkat & Fungsi
Widget `ListView` digunakan untuk menampilkan daftar widget turunan (*children*) secara linear yang dapat digulir (*scrollable*). Cocok untuk daftar elemen statis berjumlah terbatas.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `children` | `List<Widget>` | Daftar widget turunan yang ditampilkan secara linear. |
| `scrollDirection` | `Axis` | Arah sumbu pengguliran (Axis.vertical atau Axis.horizontal). |
| `padding` | `EdgeInsetsGeometry` | Jarak internal di sekeliling area daftar. |
| `physics` | `ScrollPhysics` | Perilaku animasi respon pengguliran. |
| `shrinkWrap` | `bool` | Menentukan apakah ukuran ListView menyesuaikan panjang total elemen anaknya. |
| `controller` | `ScrollController` | Objek pengontrol posisi scroll daftar. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ListViewDemoApp());
}

class ListViewDemoApp extends StatelessWidget {
  const ListViewDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ListView Widget')),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            ListTile(leading: Icon(Icons.book), title: Text('Pemrograman Seluler')),
            ListTile(leading: Icon(Icons.code), title: Text('Algoritma & Struktur Data')),
            ListTile(leading: Icon(Icons.storage), title: Text('Sistem Basis Data')),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Kartu Rencana Studi (KRS) Semester Ini)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KrsListApp());
}

class KrsListApp extends StatelessWidget {
  const KrsListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('KRS Semester Ganjil 2026/2027'),
          backgroundColor: Colors.indigo,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            KrsItemCard(code: 'TIF301', name: 'Pemrograman Seluler II', sks: 3, classRoom: 'Lab Komputer 3', lecturer: 'Dr. Ir. Hendra, M.T.'),
            KrsItemCard(code: 'TIF302', name: 'Keamanan Komputer & Siber', sks: 3, classRoom: 'Gedung B201', lecturer: 'Budi Santoso, M.Kom.'),
            KrsItemCard(code: 'TIF303', name: 'Kecerdasan Buatan (AI)', sks: 4, classRoom: 'Gedung B204', lecturer: 'Dr. Sita Rahma, S.T.'),
            KrsItemCard(code: 'TIF304', name: 'Manajemen Proyek Perangkat Lunak', sks: 2, classRoom: 'Ruang Teori 1', lecturer: 'Maya Putri, M.Sc.'),
          ],
        ),
      ),
    );
  }
}

class KrsItemCard extends StatelessWidget {
  final String code;
  final String name;
  final int sks;
  final String classRoom;
  final String lecturer;

  const KrsItemCard({
    super.key,
    required this.code,
    required this.name,
    required this.sks,
    required this.classRoom,
    required this.lecturer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(code, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
                Chip(label: Text('$sks SKS'), backgroundColor: Colors.indigo.shade50),
              ],
            ),
            Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text('Dosen: $lecturer', style: TextStyle(color: Colors.grey.shade700)),
            Text('Ruang: $classRoom', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
```
