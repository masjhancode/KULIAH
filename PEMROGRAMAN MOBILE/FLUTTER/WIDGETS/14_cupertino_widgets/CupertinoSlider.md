# Dokumentasi Widget: CupertinoSlider

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoSlider` memfasilitasi pemilih nilai numerik linier bergaya iOS dengan pergeseran thumb bulat.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `double` | Nilai posisi slider saat ini (wajib). |
| `onChanged` | `ValueChanged<double>?` | Callback perubahan pergeseran slider. |
| `min` | `double` | Nilai minimum. |
| `max` | `double` | Nilai maksimum. |
| `activeColor` | `Color?` | Warna trek aktif slider. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoSliderDemoApp());
}

class CupertinoSliderDemoApp extends StatefulWidget {
  const CupertinoSliderDemoApp({super.key});

  @override
  State<CupertinoSliderDemoApp> createState() => _CupertinoSliderDemoAppState();
}

class _CupertinoSliderDemoAppState extends State<CupertinoSliderDemoApp> {
  double _val = 50.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: CupertinoSlider(
            value: _val,
            min: 0.0,
            max: 100.0,
            onChanged: (v) => setState(() => _val = v),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Slider Bobot Filter Jarak Kampus pada Peta Lokasi Ruang Ujian)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CampusDistanceSliderIosApp());
}

class CampusDistanceSliderIosApp extends StatefulWidget {
  const CampusDistanceSliderIosApp({super.key});

  @override
  State<CampusDistanceSliderIosApp> createState() => _CampusDistanceSliderIosAppState();
}

class _CampusDistanceSliderIosAppState extends State<CampusDistanceSliderIosApp> {
  double _distance = 5.0;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('Filter Jarak Kampus')),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Radius Jarak: ${_distance.toStringAsFixed(1)} KM', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                CupertinoSlider(
                  value: _distance,
                  min: 1.0,
                  max: 20.0,
                  onChanged: (val) => setState(() => _distance = val),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
