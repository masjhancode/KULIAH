# Dokumentasi Widget: Tooltip

## 1. Penjelasan Singkat & Fungsi
Widget `Tooltip` menyajikan kotak petunjuk teks pembantu (*floating hint text*) saat pengguna menahan sentuhan (*hover/long press*) pada widget target.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `message` | `String` | Teks petunjuk bantuan yang akan ditayangkan. |
| `child` | `Widget` | Widget sasaran tempat penempelan tooltip. |
| `duration` | `Duration` | Durasi penayangan tooltip setelah dilepas. |
| `decoration` | `Decoration` | Kustomisasi kotak latar tooltip. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const TooltipDemoApp());
}

class TooltipDemoApp extends StatelessWidget {
  const TooltipDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Tooltip')),
        body: const Center(
          child: Tooltip(
            message: 'Ini adalah tombol bantuan',
            child: Icon(Icons.info),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tooltip Penjelas Istilah SKS & IPK Akademik)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AcademicTooltipApp());
}

class AcademicTooltipApp extends StatelessWidget {
  const AcademicTooltipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Istilah Akademik'), backgroundColor: Colors.indigo),
        body: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('IPK Kumulatif: 3.85 '),
              Tooltip(
                message: 'Indeks Prestasi Kumulatif gabungan seluruh semester.',
                child: Icon(Icons.help_outline, size: 18, color: Colors.indigo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
