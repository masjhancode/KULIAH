# Dokumentasi Widget: CircularProgressIndicator

## 1. Penjelasan Singkat & Fungsi
Widget `CircularProgressIndicator` menampilkan indikator proses muat data (*loading indicator*) berbentuk busur lingkaran berputar yang mengindikasikan bahwa proses asinkron sedang berjalan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `double?` | Nilai kemajuan persentase (0.0 hingga 1.0). Jika null, animasi berputar tanpa batas/indeterminate. |
| `color` | `Color` | Warna busur garis putar indikator. |
| `backgroundColor` | `Color` | Warna jalur latar belakang lingkaran. |
| `strokeWidth` | `double` | Ketebalan fisik garis busur lingkaran (default: 4.0). |
| `valueColor` | `Animation<Color?>` | Objek animasi perubahan warna busur. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CircularProgressDemoApp());
}

class CircularProgressDemoApp extends StatelessWidget {
  const CircularProgressDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo CircularProgressIndicator')),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Indikator Loading Pengambilan Data Jadwal Kuliah Real-Time)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ScheduleLoadingApp());
}

class ScheduleLoadingApp extends StatelessWidget {
  const ScheduleLoadingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Jadwal Perkuliahan'), backgroundColor: Colors.indigo),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.indigo, strokeWidth: 5),
              SizedBox(height: 16),
              Text('Mengambil data jadwal dari server SIAKAD...', style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
```
