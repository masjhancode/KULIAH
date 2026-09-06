# Dokumentasi Widget: Dismissible

## 1. Penjelasan Singkat & Fungsi
Widget `Dismissible` memungkinkan pengguna menghapus item dari daftar dengan melakukan gestur usap (*swipe to dismiss*) ke arah kiri atau kanan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `key` | `Key` | Kunci unik Key wajib untuk mengidentifikasi item yang diusap. |
| `child` | `Widget` | Widget item baris yang dapat diusap. |
| `onDismissed` | `DismissDirectionCallback` | Callback fungsi saat item selesai diusap dan dihapus dari hirarki. |
| `background` | `Widget` | Widget latar belakang yang muncul saat diusap ke kanan (misal ikon tempat sampah merah). |
| `confirmDismiss` | `ConfirmDismissCallback` | Callback konfirmasi modal sebelum item benar-benar dihapus. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DismissibleDemoApp());
}

class DismissibleDemoApp extends StatelessWidget {
  const DismissibleDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Dismissible')),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key('item_$index'),
              onDismissed: (direction) {},
              background: Container(color: Colors.red),
              child: ListTile(title: Text('Item $index')),
            );
          },
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Gestur Usap Menghapus Notifikasi Pengumuman Kampus)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const NotificationDismissApp());
}

class NotificationDismissApp extends StatefulWidget {
  const NotificationDismissApp({super.key});

  @override
  State<NotificationDismissApp> createState() => _NotificationDismissAppState();
}

class _NotificationDismissAppState extends State<NotificationDismissApp> {
  final List<String> _notifications = ['Pengingat SPP', 'Jadwal UTS Diterbitkan', 'Bimbingan PA Minggu Ini'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Notifikasi Akademik'), backgroundColor: Colors.indigo),
        body: ListView.builder(
          itemCount: _notifications.length,
          itemBuilder: (context, index) {
            final item = _notifications[index];
            return Dismissible(
              key: Key(item),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (dir) {
                setState(() => _notifications.removeAt(index));
              },
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.notifications, color: Colors.indigo),
                  title: Text(item),
                  subtitle: const Text('Geser ke kiri untuk menghapus'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
```
