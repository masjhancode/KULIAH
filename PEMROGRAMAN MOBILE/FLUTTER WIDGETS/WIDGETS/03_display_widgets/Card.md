# Dokumentasi Widget: Card

## 1. Penjelasan Singkat & Fungsi
Widget `Card` merupakan kontainer melayang dengan batas sudut melengkung (*rounded corners*) dan efek penonjolan bayangan (*elevation*). Cocok untuk mengelompokkan informasi terpadu.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget di dalam kartu. |
| `elevation` | `double` | Tingkat bayangan penonjolan kartu dari latar belakang. |
| `shape` | `ShapeBorder` | Bentuk dan lengkungan sudut kartu (misal RoundedRectangleBorder). |
| `color` | `Color` | Warna latar belakang kartu. |
| `margin` | `EdgeInsetsGeometry` | Jarak luaran di sekeliling kartu. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CardDemoApp());
}

class CardDemoApp extends StatelessWidget {
  const CardDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Card')),
        body: const Center(
          child: Card(
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Konten di dalam Card'),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Kartu Profil Ringkasan Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentCardApp());
}

class StudentCardApp extends StatelessWidget {
  const StudentCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(title: const Text('Profil Mahasiswa'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(radius: 36, backgroundColor: Colors.indigo, child: Icon(Icons.person, size: 40, color: Colors.white)),
                  const SizedBox(height: 12),
                  const Text('Ahmad Fauzi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('NIM: 2026090123', style: TextStyle(color: Colors.grey.shade600)),
                  const Divider(height: 24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(children: [Text('IPK', style: TextStyle(color: Colors.grey)), Text('3.85', style: TextStyle(fontWeight: FontWeight.bold))]),
                      Column(children: [Text('SKS', style: TextStyle(color: Colors.grey)), Text('112', style: TextStyle(fontWeight: FontWeight.bold))]),
                      Column(children: [Text('Status', style: TextStyle(color: Colors.grey)), Text('AKTIF', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green))]),
                    ],
                  ),
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
