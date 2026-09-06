# Dokumentasi Widget: PageView

## 1. Penjelasan Singkat & Fungsi
Widget `PageView` digunakan untuk menyusun halaman-halaman yang dapat digulir (*swipe*) secara penuh layar per halaman.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `children` | `List<Widget>` | Daftar widget halaman yang dikelola dalam PageView. |
| `controller` | `PageController` | Pengontrol halaman (mengatur halaman awal, viewport fraction, dsb). |
| `onPageChanged` | `ValueChanged<int>` | Callback respon saat terjadi perubahan halaman. |
| `scrollDirection` | `Axis` | Arah usapan halaman (Axis.horizontal atau Axis.vertical). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PageViewDemoApp());
}

class PageViewDemoApp extends StatelessWidget {
  const PageViewDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo PageView Widget')),
        body: PageView(
          children: [
            Container(color: Colors.red.shade100, child: const Center(child: Text('Halaman 1'))),
            Container(color: Colors.green.shade100, child: const Center(child: Text('Halaman 2'))),
            Container(color: Colors.blue.shade100, child: const Center(child: Text('Halaman 3'))),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Panduan & Onboarding Mahasiswa Baru)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const OnboardingPageViewApp());
}

class OnboardingPageViewApp extends StatelessWidget {
  const OnboardingPageViewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          children: const [
            OnboardingPage(
              title: 'Selamat Datang di SIAKAD',
              desc: 'Kelola KRS, KHS, dan jadwal kuliah Anda dalam satu genggaman.',
              color: Colors.indigo,
              icon: Icons.school,
            ),
            OnboardingPage(
              title: 'Presensi Digital QR',
              desc: 'Lakukan absensi kelas dengan cepat dan aman via scan QR code.',
              color: Colors.teal,
              icon: Icons.qr_code_scanner,
            ),
            OnboardingPage(
              title: 'Pengumuman Real-time',
              desc: 'Dapatkan notifikasi pengumuman perkuliahan secara langsung.',
              color: Colors.deepOrange,
              icon: Icons.notifications_active,
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String desc;
  final Color color;
  final IconData icon;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.desc,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: Colors.white),
          const SizedBox(height: 24),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(desc, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70, fontSize: 16)),
        ],
      ),
    );
  }
}
```
