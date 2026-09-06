# Dokumentasi Widget: ActionChip

## 1. Penjelasan Singkat & Fungsi
Widget `ActionChip` merupakan chip penanda pemicu aksi cepat (*quick action button*) yang merespon sentuhan pengguna.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `label` | `Widget` | Widget label perintah aksi. |
| `onPressed` | `VoidCallback` | Callback fungsi saat chip ditekan. |
| `avatar` | `Widget` | Widget ikon di sebelah kiri label. |
| `backgroundColor` | `Color` | Warna latar belakang chip. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ActionChipDemoApp());
}

class ActionChipDemoApp extends StatelessWidget {
  const ActionChipDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ActionChip')),
        body: Center(
          child: ActionChip(
            avatar: const Icon(Icons.share),
            label: const Text('Bagikan'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tombol Aksi Cepat "Download KHS" & "Bagikan Jadwal")

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ActionChipQuickApp());
}

class ActionChipQuickApp extends StatelessWidget {
  const ActionChipQuickApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Aksi Cepat Document'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ActionChip(
                avatar: const Icon(Icons.download, color: Colors.indigo),
                label: const Text('Unduh KHS (PDF)'),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
              ActionChip(
                avatar: const Icon(Icons.share, color: Colors.indigo),
                label: const Text('Bagikan Jadwal'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
