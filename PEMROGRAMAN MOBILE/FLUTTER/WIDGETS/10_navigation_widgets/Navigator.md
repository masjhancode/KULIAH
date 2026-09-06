# Dokumentasi Widget: Navigator

## 1. Penjelasan Singkat & Fungsi
Widget `Navigator` mengelola tumpukan halaman (*navigation stack*) berbasis metode LIFO (*Last In, First Out*) untuk melakukan pemindahan halaman `push()`, `pop()`, dan `pushReplacement()`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `Navigator.push()` | `Future<T?>` | Menambahkan rute baru ke atas tumpukan navigasi. |
| `Navigator.pop()` | `void` | Menghapus rute teratas dari tumpukan navigasi dan kembali ke halaman sebelumnya. |
| `Navigator.pushReplacement()` | `Future<T?>` | Mengganti rute teratas saat ini dengan rute baru. |
| `Navigator.pushNamed()` | `Future<T?>` | Pindah ke rute yang telah terdaftar berdasarkan nama string rute. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const NavigatorDemoApp());
}

class NavigatorDemoApp extends StatelessWidget {
  const NavigatorDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Pertama')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SecondScreen()));
          },
          child: const Text('Buka Halaman Kedua'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Kedua')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Kembali'),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Navigasi Tumpukan Halaman dari Dasbor Utama ke Detail KHS)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadNavApp());
}

class SiakadNavApp extends StatelessWidget {
  const SiakadNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SiakadDashboardPage(),
    );
  }
}

class SiakadDashboardPage extends StatelessWidget {
  const SiakadDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dasbor SIAKAD'), backgroundColor: Colors.indigo),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const KhsDetailPage()),
            );
          },
          child: const Text('Lihat Detail KHS Semester Ganjil', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class KhsDetailPage extends StatelessWidget {
  const KhsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rincian KHS'), backgroundColor: Colors.indigo),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Card(
              child: ListTile(title: Text('IPK Semester: 3.85'), subtitle: Text('Total SKS: 24 SKS')),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali ke Dasbor'),
            ),
          ],
        ),
      ),
    );
  }
}
```
