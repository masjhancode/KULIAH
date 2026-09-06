# Dokumentasi Widget: Scrollable

## 1. Penjelasan Singkat & Fungsi
Widget `Scrollable` merupakan komponen tingkat rendah (*low-level widget*) yang menangani gesture pengguliran dan mengelola posisi scroll melalui `ScrollPosition` dan `ScrollPhysics`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `viewportBuilder` | `ViewportBuilder` | Fungsi pembuat viewport yang merender konten berdasarkan offset scroll. |
| `axisDirection` | `AxisDirection` | Arah sumbu pengguliran (up, right, down, left). |
| `controller` | `ScrollController` | Pengontrol posisi scroll. |
| `physics` | `ScrollPhysics` | Objek penentu fisika pengguliran. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ScrollableDemoApp());
}

class ScrollableDemoApp extends StatelessWidget {
  const ScrollableDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Scrollable Widget')),
        body: Center(
          child: Text(
            'Scrollable adalah komponen low-level internal yang digunakan oleh ListView, GridView, dan SingleChildScrollView.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Monitoring Pengguliran & Tombol Kembali ke Atas)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ScrollControllerApp());
}

class ScrollControllerApp extends StatefulWidget {
  const ScrollControllerApp({super.key});

  @override
  State<ScrollControllerApp> createState() => _ScrollControllerAppState();
}

class _ScrollControllerAppState extends State<ScrollControllerApp> {
  final ScrollController _controller = ScrollController();
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset > 200 && !_showBackToTop) {
        setState(() => _showBackToTop = true);
      } else if (_controller.offset <= 200 && _showBackToTop) {
        setState(() => _showBackToTop = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Monitoring Scroll Position'), backgroundColor: Colors.indigo),
        body: ListView.builder(
          controller: _controller,
          itemCount: 30,
          itemBuilder: (c, i) => ListTile(title: Text('Item Pengumuman #${i + 1}')),
        ),
        floatingActionButton: _showBackToTop
            ? FloatingActionButton(
                backgroundColor: Colors.indigo,
                onPressed: () {
                  _controller.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                },
                child: const Icon(Icons.arrow_upward),
              )
            : null,
      ),
    );
  }
}
```
