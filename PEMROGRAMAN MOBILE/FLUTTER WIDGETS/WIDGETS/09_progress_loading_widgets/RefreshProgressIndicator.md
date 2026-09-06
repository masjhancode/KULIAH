# Dokumentasi Widget: RefreshProgressIndicator

## 1. Penjelasan Singkat & Fungsi
Widget `RefreshProgressIndicator` merupakan animasi busur lingkaran proses muat ulang khusus yang ditayangkan melayang di atas daftar scroll saat gestur tarik-untuk-perbarui (*pull-to-refresh*) dipicu.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `double?` | Nilai rotasi kemajuan tarik. |
| `color` | `Color` | Warna busur putar. |
| `backgroundColor` | `Color` | Warna latar bundar melayang. |
| `strokeWidth` | `double` | Ketebalan garis busur lingkaran. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RefreshProgressDemoApp());
}

class RefreshProgressDemoApp extends StatelessWidget {
  const RefreshProgressDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo RefreshProgressIndicator')),
        body: const Center(
          child: RefreshProgressIndicator(),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Indikator Visual Proses Sinkronisasi Nilai KHS Terbaru)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RefreshKhsApp());
}

class RefreshKhsApp extends StatelessWidget {
  const RefreshKhsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Sinkronisasi Nilai KHS'), backgroundColor: Colors.indigo),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RefreshProgressIndicator(
                color: Colors.indigo,
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 16),
              Text('Menyinkronkan data transkrip KHS terbaru...'),
            ],
          ),
        ),
      ),
    );
  }
}
```
