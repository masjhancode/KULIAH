# Dokumentasi Widget: Hero (Navigation Shared Element)

## 1. Penjelasan Singkat & Fungsi
Widget `Hero` menyediakan perpindahan animasi elemen visual terpaut (*shared element transition*) antar dua rute rute halaman navigasi yang memiliki `tag` identik.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `tag` | `Object` | Kata kunci pengenal unik yang harus persis sama pada halaman rute asal dan rute tujuan (wajib). |
| `child` | `Widget` | Widget visual anak yang diterbangkan antar rute. |
| `createRectTween` | `CreateRectTween?` | Fungsi penyesuai lintasan kurva penerbangan rute. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const HeroNavDemoApp());
}

class HeroNavDemoApp extends StatelessWidget {
  const HeroNavDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HeroScreenA(),
    );
  }
}

class HeroScreenA extends StatelessWidget {
  const HeroScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Nav Rute A')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const HeroScreenB()));
          },
          child: const Hero(tag: 'avatar-tag', child: CircleAvatar(radius: 40, child: Icon(Icons.person))),
        ),
      ),
    );
  }
}

class HeroScreenB extends StatelessWidget {
  const HeroScreenB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Nav Rute B')),
      body: const Center(
        child: Hero(tag: 'avatar-tag', child: CircleAvatar(radius: 100, child: Icon(Icons.person, size: 80))),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Animasi Transisi Elemen Hero Foto KTM Digital dari Dasbor ke Layar Penuh)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KtmHeroNavApp());
}

class KtmHeroNavApp extends StatelessWidget {
  const KtmHeroNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const KtmDashboardPage(),
    );
  }
}

class KtmDashboardPage extends StatelessWidget {
  const KtmDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Mahasiswa'), backgroundColor: Colors.indigo),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const KtmFullViewPage()));
          },
          child: const Hero(
            tag: 'ktm-photo',
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.school, size: 45, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class KtmFullViewPage extends StatelessWidget {
  const KtmFullViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KTM Digital Layar Penuh'), backgroundColor: Colors.indigo),
      body: Center(
        child: Hero(
          tag: 'ktm-photo',
          child: Container(
            width: 250,
            height: 250,
            decoration: const BoxDecoration(color: Colors.indigo, shape: BoxShape.circle),
            child: const Icon(Icons.school, size: 150, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
```
