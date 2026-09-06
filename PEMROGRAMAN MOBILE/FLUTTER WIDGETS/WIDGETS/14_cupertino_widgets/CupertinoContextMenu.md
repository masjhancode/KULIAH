# Dokumentasi Widget: CupertinoContextMenu

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoContextMenu` menyediakan menu konteks tekan lama gaya iOS (iOS 3D Touch / Long Press preview) dengan efek blur latar belakang dan kartu menu melayang.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget visual anak utama yang dapat ditekan lama (wajib). |
| `actions` | `List<Widget>` | Daftar widget `CupertinoContextMenuAction` sebagai opsi menu melayang (wajib). |
| `previewBuilder` | `ContextMenuPreviewBuilder?` | Callback kustom penampil preview. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoContextMenuDemoApp());
}

class CupertinoContextMenuDemoApp extends StatelessWidget {
  const CupertinoContextMenuDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: CupertinoContextMenu(
              actions: [
                CupertinoContextMenuAction(
                  child: const Text('Aksi 1'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
              child: Container(color: CupertinoColors.activeBlue, child: const Center(child: Text('Press Me', style: TextStyle(color: CupertinoColors.white)))),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Menu Konteks Tekan Lama Kartu Matkul Opsi Lihat Silabus / Cetak KHS)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CourseCardIosContextMenuApp());
}

class CourseCardIosContextMenuApp extends StatelessWidget {
  const CourseCardIosContextMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('Daftar Matkul iOS')),
        child: Center(
          child: SizedBox(
            width: 280,
            height: 120,
            child: CupertinoContextMenu(
              actions: [
                CupertinoContextMenuAction(
                  child: const Text('Lihat Silabus Matkul'),
                  onPressed: () => Navigator.pop(context),
                ),
                CupertinoContextMenuAction(
                  child: const Text('Unduh Materi PDF'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CupertinoColors.activeBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Pemrograman Seluler (IF2026)', style: TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Tekan lama untuk menu pintas', style: TextStyle(color: CupertinoColors.white, fontSize: 12)),
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
