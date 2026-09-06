# Dokumentasi Widget: Tooltip

## 1. Penjelasan Singkat & Fungsi
Widget `Tooltip` menyajikan kotak teks pembantu singkat saat elemen antarmuka ditekan lama atau di-hover kursor.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `message` | `String` | Teks petunjuk pembantu. |
| `child` | `Widget` | Widget sasaran tooltip. |
| `duration` | `Duration` | Durasi waktu tayang tooltip setelah dilepas. |

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
            message: 'Informasi tambahan',
            child: Icon(Icons.info),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tooltip Penjelas Istilah Akademik SKS & IPK)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AcademicTooltipOverlayApp());
}

class AcademicTooltipOverlayApp extends StatelessWidget {
  const AcademicTooltipOverlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Bantuan Akademik'), backgroundColor: Colors.indigo),
        body: const Center(
          child: Tooltip(
            message: 'Satuan Kredit Semester (SKS) menentukan beban perkuliahan.',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Total SKS: 24 ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(Icons.help_outline, color: Colors.indigo),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
