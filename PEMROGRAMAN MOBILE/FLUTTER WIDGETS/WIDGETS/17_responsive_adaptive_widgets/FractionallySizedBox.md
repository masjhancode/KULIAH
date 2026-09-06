# Dokumentasi Widget: FractionallySizedBox

## 1. Penjelasan Singkat & Fungsi
Widget `FractionallySizedBox` menentukan ukuran dimensi anak (*width* dan *height*) secara proporsional berdasarkan persentase fraksi ruang induk yang tersedia.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `widthFactor` | `double?` | Faktor lebar fraksi relatif terhadap induk (0.0 hingga 1.0, contoh: 0.8 = 80%). |
| `heightFactor` | `double?` | Faktor tinggi fraksi relatif terhadap induk (0.0 hingga 1.0). |
| `alignment` | `AlignmentGeometry` | Penjajaran posisi anak di dalam batas kontainer (default: Alignment.center). |
| `child` | `Widget` | Widget anak penampung. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FractionallySizedBoxDemoApp());
}

class FractionallySizedBoxDemoApp extends StatelessWidget {
  const FractionallySizedBoxDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FractionallySizedBox')),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey.shade300,
            child: FractionallySizedBox(
              widthFactor: 0.7,
              heightFactor: 0.5,
              child: ElevatedButton(onPressed: () {}, child: const Text('70% x 50%')),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tombol Aksi Kustom Berukuran 85% dari Lebar Layar Perangkat)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveButtonFractionApp());
}

class ResponsiveButtonFractionApp extends StatelessWidget {
  const ResponsiveButtonFractionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Form Pengajuan Skripsi'), backgroundColor: Colors.indigo),
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.85,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {},
              child: const Text('Kirim Pengajuan Proposal (85% Lebar)', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
      ),
    );
  }
}
```
