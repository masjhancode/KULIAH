# Dokumentasi Widget: MenuAnchor

## 1. Penjelasan Singkat & Fungsi
Widget `MenuAnchor` merupakan komponen Material 3 yang menautkan menu peningkap (*context menu*) berkesinambungan pada widget pemicu (*anchor*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `menuChildren` | `List<Widget>` | Daftar item menu (MenuItemButton). |
| `builder` | `MenuAnchorChildBuilder` | Fungsi pembuat widget tombol pemicu. |
| `controller` | `MenuController` | Pengontrol untuk membukanya secara programatis. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MenuAnchorOverlayDemoApp());
}

class MenuAnchorOverlayDemoApp extends StatelessWidget {
  const MenuAnchorOverlayDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo MenuAnchor')),
        body: Center(
          child: MenuAnchor(
            menuChildren: [
              MenuItemButton(onPressed: () {}, child: const Text('Opsi 1')),
            ],
            builder: (context, controller, child) {
              return ElevatedButton(
                onPressed: () => controller.isOpen ? controller.close() : controller.open(),
                child: const Text('Buka Menu'),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Menu Contextual Akses Cepat Dokumen KHS (Material 3))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KhsMenuAnchorApp());
}

class KhsMenuAnchorApp extends StatelessWidget {
  const KhsMenuAnchorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('KHS Mahasiswa'),
          actions: [
            MenuAnchor(
              menuChildren: [
                MenuItemButton(leadingIcon: const Icon(Icons.print), onPressed: () {}, child: const Text('Cetak KHS')),
                MenuItemButton(leadingIcon: const Icon(Icons.share), onPressed: () {}, child: const Text('Bagikan KHS')),
              ],
              builder: (context, controller, child) {
                return IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () => controller.isOpen ? controller.close() : controller.open(),
                );
              },
            ),
          ],
        ),
        body: const Center(child: Text('Tampilan Kartu Hasil Studi')),
      ),
    );
  }
}
```
