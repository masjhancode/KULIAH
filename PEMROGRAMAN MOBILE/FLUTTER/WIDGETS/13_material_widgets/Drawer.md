# Dokumentasi Widget: Drawer

## 1. Penjelasan Singkat & Fungsi
Widget `Drawer` merupakan panel navigasi samping (*side navigation menu*) yang muncul saat diusap dari tepi layar atau ditekan tombol menu ikon hamburger.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget hierarki menu (umumnya ListView diawali UserAccountsDrawerHeader). |
| `elevation` | `double` | Tingkat bayangan penonjolan panel Drawer. |
| `width` | `double` | Ukuran lebar panel navigasi samping. |
| `backgroundColor` | `Color` | Warna latar belakang panel Drawer. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DrawerDemoApp());
}

class DrawerDemoApp extends StatelessWidget {
  const DrawerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Drawer')),
        drawer: Drawer(
          child: ListView(
            children: const [
              DrawerHeader(child: Text('Menu Utama')),
              ListTile(title: Text('Beranda')),
              ListTile(title: Text('Profil')),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Menu Samping Navigasi Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadDrawerApp());
}

class SiakadDrawerApp extends StatelessWidget {
  const SiakadDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('SIAKAD Mobile'), backgroundColor: Colors.indigo),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo),
                accountName: Text('Ahmad Fauzi', style: TextStyle(fontWeight: FontWeight.bold)),
                accountEmail: Text('ahmad.fauzi@mahasiswa.ac.id'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.indigo),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard, color: Colors.indigo),
                title: const Text('Dasbor Akademik'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.assignment, color: Colors.indigo),
                title: const Text('Kartu Rencana Studi (KRS)'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.grade, color: Colors.indigo),
                title: const Text('Kartu Hasil Studi (KHS)'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet, color: Colors.indigo),
                title: const Text('Tagihan SPP & Keuangan'),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Keluar Aplikasi', style: TextStyle(color: Colors.red)),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: const Center(child: Text('Usap dari kiri atau tekan tombol menu.')),
      ),
    );
  }
}
```
