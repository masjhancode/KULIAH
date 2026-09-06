# Dokumentasi Widget: IgnorePointer

## 1. Penjelasan Singkat & Fungsi
Widget `IgnorePointer` mengabaikan seluruh peristiwa sentuhan (*ignoring pointer events*) dan meneruskannya (*pass through*) ke widget yang berada tepat di belakangnya.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `ignoring` | `bool` | Status pengabaian sentuhan (true = diabaikan, false = normal). |
| `child` | `Widget` | Widget anak yang sentuhannya akan diteruskan ke belakang. |
| `ignoringSemantics` | `bool` | Menentukan apakah semantik aksesibilitas juga diabaikan. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const IgnorePointerDemoApp());
}

class IgnorePointerDemoApp extends StatelessWidget {
  const IgnorePointerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo IgnorePointer')),
        body: Center(
          child: IgnorePointer(
            ignoring: true,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Sentuhan Diteruskan ke Belakang'),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Lapisan Watermark Transparan yang Dapat Ditembus Ketukan)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const WatermarkPassThroughApp());
}

class WatermarkPassThroughApp extends StatelessWidget {
  const WatermarkPassThroughApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Watermark Layer Pass-Through'), backgroundColor: Colors.indigo),
        body: Stack(
          children: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Tombol Berhasil Ditekan!')));
                },
                child: const Text('Klik Tombol Utama', style: TextStyle(color: Colors.white)),
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Center(
                child: Container(
                  color: Colors.black.withOpacity(0.05),
                  child: const Text('WATERMARK OFFICIAL SIAKAD', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.red)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
