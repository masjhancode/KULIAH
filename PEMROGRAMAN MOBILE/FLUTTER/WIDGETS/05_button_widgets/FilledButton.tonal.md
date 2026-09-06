# Dokumentasi Widget: FilledButton.tonal

## 1. Penjelasan Singkat & Fungsi
Konstruktor `FilledButton.tonal` membuat tombol Material 3 berlatar belakang warna kontras tonal sekunder yang lebih lembut namun tetap mudah terlihat.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onPressed` | `VoidCallback` | Callback fungsi saat tombol ditekan. |
| `child` | `Widget` | Widget anak di dalam tombol tonal. |
| `style` | `ButtonStyle` | Objek penentu gaya latar tonal, padding, dan sudut. |
| `onLongPress` | `VoidCallback` | Callback saat ditekan lama. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FilledTonalDemoApp());
}

class FilledTonalDemoApp extends StatelessWidget {
  const FilledTonalDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FilledButton.tonal')),
        body: Center(
          child: FilledButton.tonal(
            onPressed: () {},
            child: const Text('Batal / Reset'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tombol Unduh Transkrip Nilai PDF (Tonal Button))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DownloadTranscriptApp());
}

class DownloadTranscriptApp extends StatelessWidget {
  const DownloadTranscriptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(title: const Text('Profil Transkrip Akademik')),
        body: Center(
          child: FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.download),
            label: const Text('Unduh Transkrip Nilai (PDF)'),
          ),
        ),
      ),
    );
  }
}
```
