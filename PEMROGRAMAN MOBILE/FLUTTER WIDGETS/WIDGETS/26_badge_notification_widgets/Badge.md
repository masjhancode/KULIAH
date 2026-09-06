# Dokumentasi Widget: Badge (Material 3)

## 1. Deskripsi & Fungsi Modul

Widget `Badge` (Material 3) merupakan komponen penanda lencana notifikasi berbentuk lingkaran kecil berisikan angka atau titik warna penanda pada Flutter. Widget ini dipasangkan membungkus widget lain (seperti `IconButton` lonceng notifikasi) untuk menginformasikan jumlah pesan bimbingan skripsi baru yang belum dibaca, jumlah tagihan UKT, atau revisi tugas yang masuk.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `label` | `Widget?` | Widget konten teks di dalam lencana badge (biasanya `Text('3')`). Jika `null`, badge merender titik merah saja. |
| `child` | `Widget?` | **(WAJIB)** Widget anak yang akan ditindih lencana badge di sudut kanan atasnya (misal `Icon(Icons.notifications)`). |
| `backgroundColor` | `Color?` | Warna latar belakang lingkaran lencana badge (default: `Colors.red`). |
| `textColor` | `Color?` | Warna teks angka notifikasi di dalam lencana badge. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicBadgeApp());
}

class BasicBadgeApp extends StatelessWidget {
  const BasicBadgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic Badge M3'),
          actions: [
            Badge(
              label: const Text('5'),
              child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Lencana Notifikasi Pesan Bimbingan SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadBadgeNotificationApp());
}

class SiakadBadgeNotificationApp extends StatelessWidget {
  const SiakadBadgeNotificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifikasi SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const NotificationBadgeScreen(),
    );
  }
}

class NotificationBadgeScreen extends StatelessWidget {
  const NotificationBadgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PORTAL AKADEMIK MAHASISWA'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Badge(
              label: const Text('3'),
              backgroundColor: Colors.redAccent,
              child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Membuka 3 notifikasi akademik baru')),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Badge(
              label: const Text('1'),
              backgroundColor: Colors.amber.shade900,
              child: IconButton(
                icon: const Icon(Icons.mark_as_unread),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('Dasbor Utama SIAKAD Mobile'),
      ),
    );
  }
}
```
