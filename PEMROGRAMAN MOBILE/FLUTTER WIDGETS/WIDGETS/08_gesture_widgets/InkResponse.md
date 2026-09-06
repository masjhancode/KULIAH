# Dokumentasi Widget: InkResponse

## 1. Penjelasan Singkat & Fungsi
Widget `InkResponse` merupakan area respon gestur sentuhan Material yang memungkinkan riak gelombang (*ink splash*) meluap keluar dari batas widget (*unclipped*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onTap` | `VoidCallback` | Callback fungsi sentuhan. |
| `child` | `Widget` | Widget anak penampung. |
| `containedInkWell` | `bool` | Jika false, gelombang riak meluap keluar dari lingkaran batas. |
| `highlightShape` | `BoxShape` | Bentuk sorotan (circle, rectangle). |
| `radius` | `double` | Jari-jari jangkauan maksimal gelombang riak. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const InkResponseDemoApp());
}

class InkResponseDemoApp extends StatelessWidget {
  const InkResponseDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo InkResponse')),
        body: Center(
          child: InkResponse(
            onTap: () {},
            child: const Icon(Icons.star, size: 48),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Respons Sentuhan Ikon Lingkaran Akses Cepat Jadwal)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CircularInkResponseApp());
}

class CircularInkResponseApp extends StatelessWidget {
  const CircularInkResponseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Quick Action Menu'), backgroundColor: Colors.indigo),
        body: Center(
          child: InkResponse(
            containedInkWell: false,
            highlightShape: BoxShape.circle,
            radius: 36,
            splashColor: Colors.indigo.withOpacity(0.4),
            onTap: () {},
            child: const CircleAvatar(
              radius: 28,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.school, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
```
