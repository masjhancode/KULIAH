# Dokumentasi Widget: SearchAnchor

## 1. Penjelasan Singkat & Fungsi
Widget `SearchAnchor` merupakan komponen pencarian Material 3 yang menyediakan tampilan bilah pencarian (*search bar*) lengkap dengan halaman/modal saran hasil pencarian.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `builder` | `SearchAnchorChildBuilder` | Fungsi pembuat widget SearchBar pemicu modal pencarian. |
| `suggestionsBuilder` | `SuggestionsBuilder` | Fungsi pembuat daftar saran pencarian (List<Widget>). |
| `searchController` | `SearchController` | Pengontrol kata kunci pencarian. |
| `isFullScreen` | `bool` | Menentukan apakah modal saran pencarian ditampilkan penuh layar. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SearchAnchorDemoApp());
}

class SearchAnchorDemoApp extends StatelessWidget {
  const SearchAnchorDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo SearchAnchor')),
        body: Center(
          child: SearchAnchor(
            builder: (context, controller) {
              return SearchBar(onTap: () => controller.openView());
            },
            suggestionsBuilder: (context, controller) => [
              const ListTile(title: Text('Saran 1')),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pencarian E-Book Perpustakaan Kampus (Material 3 SearchAnchor))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const LibrarySearchAnchorApp());
}

class LibrarySearchAnchorApp extends StatelessWidget {
  const LibrarySearchAnchorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(title: const Text('Perpustakaan Digital Kampus')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () => controller.openView(),
                leading: const Icon(Icons.search),
                hintText: 'Cari Judul Buku / Penulis...',
              );
            },
            suggestionsBuilder: (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(5, (int index) {
                final String item = 'Buku Referensi #${index + 1}';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    controller.closeView(item);
                  },
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
```
