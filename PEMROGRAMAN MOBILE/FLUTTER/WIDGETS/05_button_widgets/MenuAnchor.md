# Dokumentasi Widget: MenuAnchor

## 1. Penjelasan Singkat & Fungsi
Widget `MenuAnchor` merupakan komponen Material 3 yang menautkan menu peningkap (*dropdown context menu*) ke widget pemicu (*anchor*) tertentu.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `menuChildren` | `List<Widget>` | Daftar item menu (MenuItemButton atau SubmenuButton). |
| `builder` | `MenuAnchorChildBuilder` | Fungsi pembuat widget pemicu (anchor) tempat menu menempel. |
| `controller` | `MenuController` | Pengontrol untuk membuka atau menutup menu programatis. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MenuAnchorDemoApp());
}

class MenuAnchorDemoApp extends StatelessWidget {
  const MenuAnchorDemoApp({super.key});

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
              MenuItemButton(onPressed: () {}, child: const Text('Opsi 2')),
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

### 3.2 Contoh Kode Studi Kasus UI (Menu Contextual Ekspor Document KHS (Material 3 MenuAnchor))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KhsExportMenuAnchorApp());
}

class KhsExportMenuAnchorApp extends StatelessWidget {
  const KhsExportMenuAnchorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('KHS Semester 5'),
          actions: [
            MenuAnchor(
              menuChildren: [
                MenuItemButton(
                  leadingIcon: const Icon(Icons.picture_as_pdf),
                  onPressed: () {},
                  child: const Text('Ekspor ke PDF'),
                ),
                MenuItemButton(
                  leadingIcon: const Icon(Icons.table_chart),
                  onPressed: () {},
                  child: const Text('Ekspor ke Excel'),
                ),
                MenuItemButton(
                  leadingIcon: const Icon(Icons.print),
                  onPressed: () {},
                  child: const Text('Cetak Langsung'),
                ),
              ],
              builder: (context, controller, child) {
                return IconButton(
                  icon: const Icon(Icons.more_vert),
                  tooltip: 'Opsi Ekspor',
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
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
