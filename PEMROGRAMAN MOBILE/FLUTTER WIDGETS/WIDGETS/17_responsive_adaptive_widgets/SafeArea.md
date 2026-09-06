# Dokumentasi Widget: SafeArea

## 1. Penjelasan Singkat & Fungsi
Widget `SafeArea` membungkus konten antarmuka untuk memastikannya tidak tertutup oleh lekukan poni (*notch*), status bar, atau bilah navigasi bawah perangkat.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget anak penampung (wajib). |
| `top` | `bool` | Menentukan apakah menerapkan proteksi pada batas atas status bar (default: true). |
| `bottom` | `bool` | Menentukan apakah menerapkan proteksi pada batas bawah gesture bar (default: true). |
| `left` | `bool` | Proteksi sisi kiri (default: true). |
| `right` | `bool` | Proteksi sisi kanan (default: true). |
| `minimum` | `EdgeInsets` | Batas bantalan minimum opsional. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SafeAreaDemoApp());
}

class SafeAreaDemoApp extends StatelessWidget {
  const SafeAreaDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Text('Konten Aman dari Notch dan Status Bar'),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Penghindaran Poni Notch Smartphone pada Header Dasbor SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadSafeAreaApp());
}

class SiakadSafeAreaApp extends StatelessWidget {
  const SiakadSafeAreaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: Colors.indigo,
                  padding: const EdgeInsets.all(16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PORTAL SIAKAD', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      Icon(Icons.notifications, color: Colors.white),
                    ],
                  ),
                ),
                const Expanded(child: Center(child: Text('Konten Dasbor Aman Terhindar dari Notch HP'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
