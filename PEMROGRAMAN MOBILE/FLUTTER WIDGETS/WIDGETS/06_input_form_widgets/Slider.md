# Dokumentasi Widget: Slider

## 1. Penjelasan Singkat & Fungsi
Widget `Slider` merupakan bilah geser interaktif untuk memilih nilai kontinu atau diskrit dari rentang angka tertentu (*min* hingga *max*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `double` | Nilai posisi petunjuk geser saat ini. |
| `onChanged` | `ValueChanged<double>` | Callback respon saat posisi petunjuk digeser. |
| `min` | `double` | Batas nilai terkecil (default: 0.0). |
| `max` | `double` | Batas nilai terbesar (default: 1.0). |
| `divisions` | `int` | Jumlah pembagian diskrit interval nilai. |
| `label` | `String` | Teks balon keterangan yang muncul saat petunjuk digeser. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SliderDemoApp());
}

class SliderDemoApp extends StatelessWidget {
  const SliderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Slider')),
        body: Center(
          child: Slider(
            value: 50,
            min: 0,
            max: 100,
            onChanged: (v) {},
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Input Skala Penilaian Kepuasan Layanan Kampus)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SatisfactionSliderApp());
}

class SatisfactionSliderApp extends StatefulWidget {
  const SatisfactionSliderApp({super.key});

  @override
  State<SatisfactionSliderApp> createState() => _SatisfactionSliderAppState();
}

class _SatisfactionSliderAppState extends State<SatisfactionSliderApp> {
  double _score = 8;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Survei Layanan Perpustakaan'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('Tingkat Kepuasan: ${_score.round()} / 10', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Slider(
                value: _score,
                min: 1,
                max: 10,
                divisions: 9,
                activeColor: Colors.indigo,
                label: _score.round().toString(),
                onChanged: (val) => setState(() => _score = val),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
