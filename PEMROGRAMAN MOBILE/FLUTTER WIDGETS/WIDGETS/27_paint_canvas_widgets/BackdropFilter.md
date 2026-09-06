# Dokumentasi Widget: BackdropFilter (Glassmorphism)

## 1. Deskripsi & Fungsi Modul

Widget `BackdropFilter` merupakan komponen filter efek visual yang menerapkan efek keburaman (*image filter blur*) pada lapisan di bawahnya. Dalam Sistem Informasi Akademik (SIAKAD), `BackdropFilter` digunakan bersama `ImageFilter.blur()` untuk menciptakan gaya antarmuka buram kaca transparan (*Glassmorphism Design*) pada dasbor utama, modal dialog verifikasi presensi, dan kartu overlay informasi nilai.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `filter` | `ImageFilter` | **(WAJIB)** Objek filter gambar visual (misal `ImageFilter.blur(sigmaX: 10, sigmaY: 10)`). |
| `child` | `Widget?` | Widget anak yang berada di atas lapisan efek keburaman buram (biasanya `Container`). |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicBackdropFilterApp());
}

class BasicBackdropFilterApp extends StatelessWidget {
  const BasicBackdropFilterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(color: Colors.indigo),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 200,
                    height: 150,
                    color: Colors.white.withOpacity(0.2),
                    child: const Center(child: Text('Glassmorphism Blur', style: TextStyle(color: Colors.white))),
                  ),
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

### 3.2 Contoh Kode Studi Kasus UI (Modal Dialog Glassmorphism Verifikasi Presensi SIAKAD)

```dart
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadGlassmorphismApp());
}

class SiakadGlassmorphismApp extends StatelessWidget {
  const SiakadGlassmorphismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glassmorphism SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const GlassHomeScreen(),
    );
  }
}

class GlassHomeScreen extends StatelessWidget {
  const GlassHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text('DASBOR AKADEMIK MAHASISWA', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withOpacity(0.3)),
                        ),
                        child: Column(
                          children: const [
                            Text('RINGKASAN SKS & IPK', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            SizedBox(height: 12),
                            Text('IPK Kumulatif: 3.75', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                            Text('Total SKS Lulus: 110 SKS', style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```
