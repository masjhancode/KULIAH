# Dokumentasi Widget: BottomSheet

## 1. Penjelasan Singkat & Fungsi
Widget `BottomSheet` merupakan panel persisten yang menempel pada bagian bawah layar `Scaffold` untuk menyajikan informasi berkesinambungan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onClosing` | `VoidCallback` | Callback saat lembar bawah ditutup. |
| `builder` | `WidgetBuilder` | Fungsi pembuat isi widget BottomSheet. |
| `backgroundColor` | `Color` | Warna latar belakang panel. |
| `elevation` | `double` | Tingkat bayangan penonjolan panel. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PersistentBottomSheetDemoApp());
}

class PersistentBottomSheetDemoApp extends StatelessWidget {
  const PersistentBottomSheetDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Persistent BottomSheet')),
        bottomSheet: Container(
          height: 80,
          color: Colors.indigo.shade100,
          child: const Center(child: Text('Persistent BottomSheet Panel')),
        ),
        body: const Center(child: Text('Konten Utama')),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Panel BottomSheet Persisten Pemutar Audio Pembelajaran)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const AudioPlayerBottomSheetApp());
}

class AudioPlayerBottomSheetApp extends StatelessWidget {
  const AudioPlayerBottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Materi Kuliah PodCast'), backgroundColor: Colors.indigo),
        body: const Center(child: Text('Daftar Rekaman Kuliah')),
        bottomSheet: Container(
          height: 70,
          color: Colors.indigo,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Audio 01: Dasar Flutter', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('Dr. Ir. Hendra', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
              IconButton(icon: const Icon(Icons.pause_circle_filled, color: Colors.white, size: 36), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
```
