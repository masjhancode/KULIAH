# Dokumentasi Widget: Overlay

## 1. Penjelasan Singkat & Fungsi
Widget `Overlay` menyediakan lapisan kanvas mengambang bebas (*overlay entry layer*) di atas seluruh hierarki widget aplikasi.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `initialEntries` | `List<OverlayEntry>` | Daftar entri lapisan melayang awal. |
| `Overlay.of(context)` | `OverlayState` | Metode static untuk mengambil state Overlay dan menyisipkan OverlayEntry baru via insert(). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const OverlayDemoApp());
}

class OverlayDemoApp extends StatelessWidget {
  const OverlayDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Overlay')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              final overlay = Overlay.of(context);
              late OverlayEntry entry;
              entry = OverlayEntry(
                builder: (context) => Positioned(
                  top: 100,
                  left: 50,
                  child: Material(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () => entry.remove(),
                        child: const Text('Tutup Overlay'),
                      ),
                    ),
                  ),
                ),
              );
              overlay.insert(entry);
            },
            child: const Text('Tampilkan Overlay'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Banner Floating Notification Jadwal Ujian UTS Real-Time)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FloatingExamOverlayApp());
}

class FloatingExamOverlayApp extends StatelessWidget {
  const FloatingExamOverlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Dasbor Mahasiswa'), backgroundColor: Colors.indigo),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: () {
              final overlay = Overlay.of(context);
              late OverlayEntry entry;
              entry = OverlayEntry(
                builder: (context) => Positioned(
                  top: 60,
                  left: 20,
                  right: 20,
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange.shade800,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          const Icon(Icons.notifications_active, color: Colors.white),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text('Ujian UTS Pemrograman Seluler dimulai 15 menit lagi!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                          IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => entry.remove()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
              overlay.insert(entry);
            },
            child: const Text('Simulasi Pengingat Ujian Real-Time', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
```
