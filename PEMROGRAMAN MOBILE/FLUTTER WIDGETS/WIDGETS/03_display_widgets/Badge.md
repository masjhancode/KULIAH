# Dokumentasi Widget: Badge

## 1. Penjelasan Singkat & Fungsi
Widget `Badge` (Material 3) menampilkan lencana notifikasi kecil berbentuk lingkaran atau pill berisi angka/titik penanda di atas ikon atau widget lain.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `label` | `Widget` | Widget teks angka atau label di dalam lencana badge. |
| `child` | `Widget` | Widget utama tempat lencana badge menempel (misal Icon). |
| `backgroundColor` | `Color` | Warna latar belakang lencana badge. |
| `textColor` | `Color` | Warna teks label angka badge. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BadgeDemoApp());
}

class BadgeDemoApp extends StatelessWidget {
  const BadgeDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          actions: const [
            Badge(
              label: Text('3'),
              child: Icon(Icons.notifications),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Lencana Notifikasi Pesan Dosen PA pada Navigasi)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const NotificationBadgeApp());
}

class NotificationBadgeApp extends StatelessWidget {
  const NotificationBadgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Notifikasi Akademik'),
          actions: [
            IconButton(
              icon: const Badge(
                label: Text('5'),
                backgroundColor: Colors.red,
                child: Icon(Icons.notifications),
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: const Center(child: Text('Lihat notifikasi di sudut kanan atas.')),
      ),
    );
  }
}
```
