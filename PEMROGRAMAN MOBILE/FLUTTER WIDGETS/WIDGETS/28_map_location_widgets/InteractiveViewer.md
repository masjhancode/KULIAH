# Dokumentasi Widget: InteractiveViewer

## 1. Deskripsi & Fungsi Modul

Widget `InteractiveViewer` merupakan komponen pemodelan gestur pan dan zoom interaktif pada Flutter. Widget ini memungkinkan pengguna memperbesar (*zoom-in*), memperkecil (*zoom-out*), dan menggeser (*pan/drag*) gambar denah tata letak atau diagram besar. Dalam Sistem Informasi Akademik (SIAKAD), `InteractiveViewer` digunakan untuk menampilkan **Denah Gedung Kampus**, Denah Tempat Duduk Ruang Ujian, serta Peta Wilayah Kampus Utama.

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget?` | **(WAJIB)** Widget anak yang akan diberi kapabilitas pan dan zoom interaktif (biasanya `Image`). |
| `minScale` | `double` | Batas minimal skala pengecilan gambar denah (default: `0.8`). |
| `maxScale` | `double` | Batas maksimal skala pembesaran gambar denah (default: `2.5`). |
| `panEnabled` | `bool` | Mengaktifkan gestur seret usapan untuk menggeser denah. |
| `scaleEnabled` | `bool` | Mengaktifkan gestur cubit dua jari untuk memperbesar/memperkecil denah. |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicInteractiveViewerApp());
}

class BasicInteractiveViewerApp extends StatelessWidget {
  const BasicInteractiveViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic InteractiveViewer')),
        body: Center(
          child: InteractiveViewer(
            minScale: 0.5,
            maxScale: 4.0,
            child: Container(
              width: 250,
              height: 250,
              color: Colors.indigo,
              child: const Center(child: Text('Cubit / Geser Gambar Ini', style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Pelihat Denah Ruang Ujian Kampus SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadInteractiveDenahApp());
}

class SiakadInteractiveDenahApp extends StatelessWidget {
  const SiakadInteractiveDenahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Denah SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const DenahUjianScreen(),
    );
  }
}

class DenahUjianScreen extends StatefulWidget {
  const DenahUjianScreen({super.key});

  @override
  State<DenahUjianScreen> createState() => _DenahUjianScreenState();
}

class _DenahUjianScreenState extends State<DenahUjianScreen> {
  final TransformationController _transformationController = TransformationController();

  void _resetZoom() {
    _transformationController.value = Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DENAH LOKASI RUANG UJIAN'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.restart_alt),
            onPressed: _resetZoom,
            tooltip: 'Reset Zoom',
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Gunakan dua jari untuk memperbesar denah kursi meja ujian:', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: InteractiveViewer(
              transformationController: _transformationController,
              minScale: 0.8,
              maxScale: 3.5,
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.indigo),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.meeting_room, size: 80, color: Colors.indigo),
                      const SizedBox(height: 12),
                      const Text('DENAH GEBANG LAB 301', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo)),
                      const SizedBox(height: 8),
                      Chip(
                        label: const Text('Meja Anda: Nomor 14 (Baris 2, Kolom 3)'),
                        backgroundColor: Colors.amber.shade200,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```
