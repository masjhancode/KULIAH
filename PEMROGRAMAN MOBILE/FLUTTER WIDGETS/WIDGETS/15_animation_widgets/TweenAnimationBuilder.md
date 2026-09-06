# Dokumentasi Widget: TweenAnimationBuilder

## 1. Penjelasan Singkat & Fungsi
Widget `TweenAnimationBuilder` memfasilitasi pembuatan animasi kustom tanpa memerlukan pengontrol `AnimationController` (*implicit animation*), dengan menentukan rentang nilai `Tween`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `tween` | `Tween<T>` | Objek rentang perubahan nilai awal ke akhir (misal: Tween<double>(begin: 0, end: 1)). |
| `duration` | `Duration` | Durasi animasi. |
| `builder` | `ValueWidgetBuilder<T>` | Fungsi pembuat widget anak berdasarkan nilai variabel animasi bertahap. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const TweenAnimationDemoApp());
}

class TweenAnimationDemoApp extends StatelessWidget {
  const TweenAnimationDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo TweenAnimationBuilder')),
        body: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return Opacity(opacity: value, child: child);
            },
            child: const Text('Fade In Tween', style: TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Animasi Penghitungan Angka Akumulasi IPK Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const IpkCounterTweenApp());
}

class IpkCounterTweenApp extends StatelessWidget {
  const IpkCounterTweenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Akumulasi IPK'), backgroundColor: Colors.indigo),
        body: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 3.85),
            duration: const Duration(seconds: 2),
            curve: Curves.easeOutExpo,
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(value.toStringAsFixed(2), style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.indigo)),
                  const Text('IPK Kumulatif Mahasiswa', style: TextStyle(color: Colors.grey)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
```
