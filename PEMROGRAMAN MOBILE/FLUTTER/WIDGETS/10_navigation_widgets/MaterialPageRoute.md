# Dokumentasi Widget: MaterialPageRoute

## 1. Penjelasan Singkat & Fungsi
Kelas `MaterialPageRoute` adalah pengolah rute modal yang mengganti seluruh layar dengan transisi platform spesifik (geser ke kiri di iOS, fade-up di Android).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `builder` | `WidgetBuilder` | Callback perender widget target halaman (wajib). |
| `settings` | `RouteSettings?` | Pengaturan konfigurasi rute seperti nama dan argumen data. |
| `maintainState` | `bool` | Menentukan apakah tetap menyimpan state rute di memori saat tertutup rute lain (default: true). |
| `fullscreenDialog` | `bool` | Jika true, menampilkan ikon tombol tutup (X) alih-alih panah kembali dan animasi meluncur dari bawah. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialPageRouteDemoApp());
}

class MaterialPageRouteDemoApp extends StatelessWidget {
  const MaterialPageRouteDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo MaterialPageRoute')),
        body: Center(
          child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: const Text('Buka Dialog Screen'),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen Dialog')),
      body: const Center(child: Text('Ini adalah Halaman Fullscreen Dialog')),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pembukaan Halaman Form Pengajuan Skripsi Sebagai Fullscreen Dialog)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SkripsiFormRouteApp());
}

class SkripsiFormRouteApp extends StatelessWidget {
  const SkripsiFormRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SkripsiMainPage(),
    );
  }
}

class SkripsiMainPage extends StatelessWidget {
  const SkripsiMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modul Skripsi'), backgroundColor: Colors.indigo),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SkripsiFormDialogPage(),
                fullscreenDialog: true,
              ),
            );
          },
          child: const Text('+ Ajukan Judul Skripsi Baru', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class SkripsiFormDialogPage extends StatelessWidget {
  const SkripsiFormDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Proposal Skripsi'), backgroundColor: Colors.indigo),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: 'Judul Penelitian')),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Submit Proposal')),
          ],
        ),
      ),
    );
  }
}
```
