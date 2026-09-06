# Dokumentasi Widget: RangeSlider

## 1. Penjelasan Singkat & Fungsi
Widget `RangeSlider` merupakan bilah geser ganda yang memungkinkan pengguna memilih rentang dua nilai (*start* dan *end*) secara bersamaan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `values` | `RangeValues` | Objek penampung nilai rentang awal dan akhir (RangeValues(start, end)). |
| `onChanged` | `ValueChanged<RangeValues>` | Callback respon saat posisi petunjuk rentang digeser. |
| `min` | `double` | Nilai batas terkecil. |
| `max` | `double` | Nilai batas terbesar. |
| `divisions` | `int` | Jumlah pembagian interval nilai diskrit. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RangeSliderDemoApp());
}

class RangeSliderDemoApp extends StatelessWidget {
  const RangeSliderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo RangeSlider')),
        body: Center(
          child: RangeSlider(
            values: const RangeValues(20, 80),
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

### 3.2 Contoh Kode Studi Kasus UI (Filter Rentang Jam Perkuliahan (07:00 - 18:00 WIB))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const TimeRangeSliderApp());
}

class TimeRangeSliderApp extends StatefulWidget {
  const TimeRangeSliderApp({super.key});

  @override
  State<TimeRangeSliderApp> createState() => _TimeRangeSliderAppState();
}

class _TimeRangeSliderAppState extends State<TimeRangeSliderApp> {
  RangeValues _timeRange = const RangeValues(8, 14);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Filter Jam Kuliah'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Rentang Jam: ${_timeRange.start.round()}:00 - ${_timeRange.end.round()}:00 WIB',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              RangeSlider(
                values: _timeRange,
                min: 7,
                max: 18,
                divisions: 11,
                activeColor: Colors.indigo,
                labels: RangeLabels('${_timeRange.start.round()}:00', '${_timeRange.end.round()}:00'),
                onChanged: (val) => setState(() => _timeRange = val),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
