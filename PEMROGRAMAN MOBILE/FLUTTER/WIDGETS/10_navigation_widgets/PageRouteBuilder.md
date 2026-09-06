# Dokumentasi Widget: PageRouteBuilder

## 1. Penjelasan Singkat & Fungsi
Kelas `PageRouteBuilder` memungkinkan pembuatan transisi perpindahan halaman kustom (*custom page route transition*) menggunakan animasi seperti FadeTransition, ScaleTransition, atau SlideTransition.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `pageBuilder` | `RoutePageBuilder` | Fungsi perender halaman target (wajib). |
| `transitionsBuilder` | `RouteTransitionsBuilder` | Fungsi perender efek transisi animasi (FadeTransition, SlideTransition, dll). |
| `transitionDuration` | `Duration` | Durasi waktu transisi animasi halaman (default: 300ms). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PageRouteBuilderDemoApp());
}

class PageRouteBuilderDemoApp extends StatelessWidget {
  const PageRouteBuilderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CustomRouteHomeScreen(),
    );
  }
}

class CustomRouteHomeScreen extends StatelessWidget {
  const CustomRouteHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo PageRouteBuilder')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => const CustomRouteTargetScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
          },
          child: const Text('Pindah Transisi Fade'),
        ),
      ),
    );
  }
}

class CustomRouteTargetScreen extends StatelessWidget {
  const CustomRouteTargetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Target Transisi')),
      body: const Center(child: Text('Transisi Halus Fade In')),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Transisi Halus Meluncur (Slide Transition) Transkrip IPK)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const TranskripSlideRouteApp());
}

class TranskripSlideRouteApp extends StatelessWidget {
  const TranskripSlideRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TranskripHomeRoutePage(),
    );
  }
}

class TranskripHomeRoutePage extends StatelessWidget {
  const TranskripHomeRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Akademik'), backgroundColor: Colors.indigo),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) => const TranskripDetailPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
                  return SlideTransition(position: animation.drive(tween), child: child);
                },
              ),
            );
          },
          child: const Text('Buka Transkrip Lengkap (Slide)', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class TranskripDetailPage extends StatelessWidget {
  const TranskripDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transkrip Kumulatif'), backgroundColor: Colors.indigo),
      body: const Center(child: Text('Daftar Seluruh Nilai Matkul Mahasiswa')),
    );
  }
}
```
