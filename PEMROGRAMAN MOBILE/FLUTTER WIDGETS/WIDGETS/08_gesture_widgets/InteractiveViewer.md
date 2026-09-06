# Dokumentasi Widget: InteractiveViewer

## 1. Penjelasan Singkat & Fungsi
Widget `InteractiveViewer` memungkinkan pengguna melakukan navigasi geser pan (*panning*) dan perbesaran dicubit (*pinch-to-zoom*) pada konten anak.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget konten yang dapat diperbesar dan digeser. |
| `minScale` | `double` | Batas skala perkecilan minimum (default: 0.8). |
| `maxScale` | `double` | Batas skala perbesaran maksimum (default: 2.5). |
| `boundaryMargin` | `EdgeInsets` | Batas marjin area batas luar pergeseran. |
| `constrained` | `bool` | Menentukan apakah konten dibatasi ukuran parent. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const InteractiveViewerDemoApp());
}

class InteractiveViewerDemoApp extends StatelessWidget {
  const InteractiveViewerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo InteractiveViewer')),
        body: Center(
          child: InteractiveViewer(
            minScale: 0.5,
            maxScale: 4.0,
            child: Image.network('https://via.placeholder.com/300'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Interaktif Viewer Zoom Peta Denah Kampus & Ruang Ujian)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CampusMapZoomApp());
}

class CampusMapZoomApp extends StatelessWidget {
  const CampusMapZoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Peta Denah Kampus (Pinch to Zoom)'), backgroundColor: Colors.indigo),
        body: Center(
          child: InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(20),
            minScale: 0.8,
            maxScale: 5.0,
            child: Image.network(
              'https://via.placeholder.com/600x400/1A237E/FFFFFF?text=DENAH+GEDUNG+KAMPUS',
            ),
          ),
        ),
      ),
    );
  }
}
```
