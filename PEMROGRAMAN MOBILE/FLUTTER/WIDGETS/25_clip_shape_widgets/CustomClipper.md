# Dokumentasi Widget: CustomClipper (ClipPath)

## 1. Deskripsi & Fungsi Modul

Kelas `CustomClipper` (digunakan bersama `ClipPath`) merupakan kelas abstrak pada Flutter yang memungkinkan pengembang mendefinisikan jalur pemotongan bentuk kustom (*custom geometric path*) menggunakan kalkulasi koordinat `Path`. Dalam Sistem Informasi Akademik (SIAKAD), `CustomClipper` digunakan untuk membuat latar belakang header bergelombang (*wave header*), bentuk sudut diagonal kartu KTM, serta efek dekoratif antarmuka aplikasi.

## 2. Tabel Atribut & Penggunaannya

| Method | Return Type | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `getClip(Size size)` | `Path` | **(WAJIB)** Mengembalikan objek `Path` jalur pemotongan bentuk visual berdasarkan ukuran widget `size`. |
| `shouldReclip(CustomClipper oldClipper)` | `bool` | **(WAJIB)** Menentukan apakah jalur pemotongan perlu dikalkulasi ulang saat status antarmuka berubah. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicCustomClipperApp());
}

class BasicCustomClipperApp extends StatelessWidget {
  const BasicCustomClipperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ClipPath(
          clipper: TriangleClipper(),
          child: Container(
            height: 200,
            color: Colors.indigo,
            child: const Center(child: Text('Pemotongan Segitiga Kustom', style: TextStyle(color: Colors.white))),
          ),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
```

### 3.2 Contoh Kode Studi Kasus UI (Wave Header Wave Halaman Login SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadWaveHeaderApp());
}

class SiakadWaveHeaderApp extends StatelessWidget {
  const SiakadWaveHeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Header SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const WaveHeaderScreen(),
    );
  }
}

class WaveHeaderScreen extends StatelessWidget {
  const WaveHeaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 220,
              color: Colors.indigo,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.school, size: 60, color: Colors.white),
                    SizedBox(height: 8),
                    Text('PORTAL AKADEMIK SIAKAD', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Konten Formulir Login SIAKAD Mobile'),
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
```
