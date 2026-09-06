# Dokumentasi Widget: ModalRoute

## 1. Penjelasan Singkat & Fungsi
Kelas `ModalRoute` adalah tipe rute yang memblokir interaksi dengan rute sebelumnya di tumpukan navigasi, sering digunakan untuk memeriksa status atau mengambil argumen navigasi (`ModalRoute.of(context)?.settings.arguments`).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `ModalRoute.of(context)?.settings.arguments` | `Object?` | Membaca argumen parameter yang dikirimkan saat navigasi. |
| `barrierDismissible` | `bool` | Menentukan apakah rute modal dapat ditutup saat mengetuk latar belakang luar. |
| `barrierColor` | `Color?` | Warna pelapis latar belakang modal. |
| `opaque` | `bool` | Menentukan apakah rute menutup penuh rute di bawahnya secara opaque (tidak transparan). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ModalRouteDemoApp());
}

class ModalRouteDemoApp extends StatelessWidget {
  const ModalRouteDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ModalRouteHomeScreen(),
    );
  }
}

class ModalRouteHomeScreen extends StatelessWidget {
  const ModalRouteHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ModalRoute Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ModalRouteTargetScreen(),
                settings: const RouteSettings(arguments: 'Argumen ModalRoute'),
              ),
            );
          },
          child: const Text('Kirim Argumen'),
        ),
      ),
    );
  }
}

class ModalRouteTargetScreen extends StatelessWidget {
  const ModalRouteTargetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: const Text('Target Screen')),
      body: Center(child: Text('Argumen Diterima: $args')),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Ekstraksi Argumen Navigasi Parameter Rincian Tagihan SPP)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SppModalRouteArgApp());
}

class SppModalRouteArgApp extends StatelessWidget {
  const SppModalRouteArgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SppMainInvoicePage(),
    );
  }
}

class SppMainInvoicePage extends StatelessWidget {
  const SppMainInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tagihan SPP'), backgroundColor: Colors.indigo),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SppPaymentDetailPage(),
                settings: const RouteSettings(
                  arguments: {'nominal': 'Rp 4.500.000', 'status': 'Belum Bayar'},
                ),
              ),
            );
          },
          child: const Text('Bayar Tagihan SPP', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class SppPaymentDetailPage extends StatelessWidget {
  const SppPaymentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final invoiceData = ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    return Scaffold(
      appBar: AppBar(title: const Text('Rincian Pembayaran'), backgroundColor: Colors.indigo),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Nominal: ${invoiceData?['nominal']}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Status: ${invoiceData?['status']}', style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
```
