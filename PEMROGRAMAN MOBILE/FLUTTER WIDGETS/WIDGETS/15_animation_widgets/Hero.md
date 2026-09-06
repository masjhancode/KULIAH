# Dokumentasi Widget: Hero

## 1. Penjelasan Singkat & Fungsi
Widget `Hero` menciptakan transisi penerbangan elemen visual (*hero flight animation*) dari satu halaman rute ke halaman rute lainnya berdasarkan kata kunci `tag` yang sama.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `tag` | `Object` | Kata kunci pengenal unik yang harus persis sama pada halaman asal dan tujuan (wajib). |
| `child` | `Widget` | Widget anak visual yang akan diterbangkan. |
| `createRectTween` | `CreateRectTween?` | Fungsi penyesuai lintasan kurva penerbangan. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const HeroDemoApp());
}

class HeroDemoApp extends StatelessWidget {
  const HeroDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Hero Page 1')),
        body: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const HeroDetailPage()));
            },
            child: const Hero(tag: 'hero-tag', child: Icon(Icons.star, size: 50, color: Colors.amber)),
          ),
        ),
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Hero Page 2')),
      body: const Center(
        child: Hero(tag: 'hero-tag', child: Icon(Icons.star, size: 150, color: Colors.amber)),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Transisi Terbang Foto Profil Mahasiswa dari Dasbor ke KTM)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentHeroApp());
}

class StudentHeroApp extends StatelessWidget {
  const StudentHeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashboardHeroPage(),
    );
  }
}

class DashboardHeroPage extends StatelessWidget {
  const DashboardHeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dasbor'), backgroundColor: Colors.indigo),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const KtmHeroDetailPage()));
          },
          child: const Hero(
            tag: 'student-avatar',
            child: CircleAvatar(radius: 30, backgroundColor: Colors.indigo, child: Icon(Icons.person, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class KtmHeroDetailPage extends StatelessWidget {
  const KtmHeroDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KTM Digital'), backgroundColor: Colors.indigo),
      body: const Center(
        child: Hero(
          tag: 'student-avatar',
          child: CircleAvatar(radius: 80, backgroundColor: Colors.indigo, child: Icon(Icons.person, size: 100, color: Colors.white)),
        ),
      ),
    );
  }
}
```
