# Dokumentasi Widget: GestureDetector

## 1. Penjelasan Singkat & Fungsi
Widget `GestureDetector` mendeteksi gestur fisik seperti ketukan (*tap*), ketukan ganda (*double tap*), tekan lama (*long press*), dan geseran (*drag/pan*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onTap` | `VoidCallback` | Callback fungsi saat ketukan tunggal terdeteksi. |
| `onDoubleTap` | `VoidCallback` | Callback fungsi saat ketukan ganda cepat terdeteksi. |
| `onLongPress` | `VoidCallback` | Callback fungsi saat sentuhan ditahan lama. |
| `onPanUpdate` | `GestureDragUpdateCallback` | Callback fungsi respon saat terjadi geseran jari (pan/drag). |
| `child` | `Widget` | Widget anak yang mendengarkan deteksi gestur. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const GestureDetectorDemoApp());
}

class GestureDetectorDemoApp extends StatelessWidget {
  const GestureDetectorDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo GestureDetector')),
        body: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blue,
              child: const Text('Ketuk Saya', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pendeteksi Ketukan Ganda untuk Bookmark Materi Kuliah)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BookmarkGestureApp());
}

class BookmarkGestureApp extends StatefulWidget {
  const BookmarkGestureApp({super.key});

  @override
  State<BookmarkGestureApp> createState() => _BookmarkGestureAppState();
}

class _BookmarkGestureAppState extends State<BookmarkGestureApp> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Materi Modul 1'), backgroundColor: Colors.indigo),
        body: Center(
          child: GestureDetector(
            onDoubleTap: () {
              setState(() => _isBookmarked = !_isBookmarked);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(_isBookmarked ? 'Materi Disimpan!' : 'Bookmark Dihapus')),
              );
            },
            child: Card(
              color: Colors.indigo.shade50,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      size: 48,
                      color: Colors.indigo,
                    ),
                    const SizedBox(height: 12),
                    const Text('Ketuk 2x untuk Menyimpan Modul', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
