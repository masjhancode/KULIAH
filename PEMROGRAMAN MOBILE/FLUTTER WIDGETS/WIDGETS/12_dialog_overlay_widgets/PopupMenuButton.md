# Dokumentasi Widget: PopupMenuButton

## 1. Penjelasan Singkat & Fungsi
Widget `PopupMenuButton` menampilkan tombol yang memunculkan daftar menu pilihan pop-up melayang (`PopupMenuItem`) saat ditekan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `itemBuilder` | `PopupMenuItemBuilder<T>` | Callback pembuat daftar item menu PopupMenuItem<T>. |
| `onSelected` | `PopupMenuItemSelected<T>` | Callback saat salah satu item menu dipilih. |
| `icon` | `Widget` | Widget ikon pemicu menu pop-up. |
| `tooltip` | `String` | Teks petunjuk tombol. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PopupMenuDemoApp());
}

class PopupMenuDemoApp extends StatelessWidget {
  const PopupMenuDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo PopupMenuButton'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (val) {},
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'edit', child: Text('Edit')),
                const PopupMenuItem(value: 'delete', child: Text('Hapus')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Menu Pop-up Filter & Ekspor Transkrip Nilai)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const TranscriptPopupMenuApp());
}

class TranscriptPopupMenuApp extends StatelessWidget {
  const TranscriptPopupMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Transkrip Nilai'),
          backgroundColor: Colors.indigo,
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onSelected: (val) {},
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'pdf', child: Row(children: [Icon(Icons.picture_as_pdf, color: Colors.red), SizedBox(width: 8), Text('Ekspor PDF')])),
                const PopupMenuItem(value: 'excel', child: Row(children: [Icon(Icons.table_chart, color: Colors.green), SizedBox(width: 8), Text('Ekspor Excel')])),
              ],
            ),
          ],
        ),
        body: const Center(child: Text('Halaman Transkrip Nilai')),
      ),
    );
  }
}
```
