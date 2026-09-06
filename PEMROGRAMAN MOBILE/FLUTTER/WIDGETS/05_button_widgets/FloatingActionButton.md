# Dokumentasi Widget: FloatingActionButton

## 1. Penjelasan Singkat & Fungsi
Widget `FloatingActionButton` (FAB) merupakan tombol melayang melingkar penanda aksi tercepat (*quick primary action*) pada halaman aplikasi.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onPressed` | `VoidCallback` | Callback fungsi saat tombol ditekan. |
| `child` | `Widget` | Widget ikon di dalam tombol. |
| `backgroundColor` | `Color` | Warna latar belakang tombol melayang. |
| `tooltip` | `String` | Teks pembantu aksesibilitas. |
| `elevation` | `double` | Tingkat bayangan penonjolan FAB. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FabDemoApp());
}

class FabDemoApp extends StatelessWidget {
  const FabDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FAB')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tombol Presensi QR Code Mahasiswa Melayang)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const QrPresensiFabApp());
}

class QrPresensiFabApp extends StatelessWidget {
  const QrPresensiFabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Presensi Kelas'), backgroundColor: Colors.indigo),
        body: const Center(child: Text('Tekan tombol QR di bawah untuk absensi.')),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          elevation: 6,
          onPressed: () {},
          child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
```
