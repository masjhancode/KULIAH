# Dokumentasi Widget: FilledButton

## 1. Penjelasan Singkat & Fungsi
Widget `FilledButton` merupakan tombol utama berlatar belakang warna solid penuh berbasis standar Material 3. Memiliki penekanan visual tertinggi pada antarmuka.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onPressed` | `VoidCallback` | Callback respon saat tombol ditekan. |
| `child` | `Widget` | Widget label atau komponen di dalam tombol. |
| `style` | `ButtonStyle` | Pengaturan gaya penampakan tombol Material 3. |
| `onLongPress` | `VoidCallback` | Callback respon saat tombol ditekan lama. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FilledButtonDemoApp());
}

class FilledButtonDemoApp extends StatelessWidget {
  const FilledButtonDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FilledButton')),
        body: Center(
          child: FilledButton(
            onPressed: () {},
            child: const Text('Login Masuk'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tombol Bayar SPP Sekarang (Material 3))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PaySppFilledButtonApp());
}

class PaySppFilledButtonApp extends StatelessWidget {
  const PaySppFilledButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(title: const Text('Keuangan Mahasiswa')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_balance_wallet),
                label: const Text('Bayar Tagihan SPP Sekarang', style: TextStyle(fontSize: 16)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
