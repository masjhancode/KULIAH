# Dokumentasi Widget: NestedScrollView

## 1. Penjelasan Singkat & Fungsi
Widget `NestedScrollView` digunakan untuk mengintegrasikan pengguliran bersarang (*nested scroll views*), memadukan pengguliran bagian luar (*outer header*) dengan bagian dalam (*inner body*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `headerSliverBuilder` | `NestedScrollViewHeaderSliverBuilder` | Fungsi pembuat daftar sliver header di bagian luar. |
| `body` | `Widget` | Widget bagian dalam (umumnya TabBarView berisi ListView atau GridView). |
| `controller` | `ScrollController` | Pengontrol posisi scroll. |
| `physics` | `ScrollPhysics` | Perilaku animasi scroll. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const NestedScrollViewDemoApp());
}

class NestedScrollViewDemoApp extends StatelessWidget {
  const NestedScrollViewDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              const SliverAppBar(
                title: Text('NestedScrollView'),
                pinned: true,
                bottom: TabBar(
                  tabs: [Tab(text: 'Tab 1'), Tab(text: 'Tab 2')],
                ),
              ),
            ],
            body: TabBarView(
              children: [
                ListView.builder(itemCount: 20, itemBuilder: (c, i) => ListTile(title: Text('Tab 1 Item $i'))),
                ListView.builder(itemCount: 20, itemBuilder: (c, i) => ListTile(title: Text('Tab 2 Item $i'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Profil Dosen & Publikasi Ilmiah)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DosenProfileNestedApp());
}

class DosenProfileNestedApp extends StatelessWidget {
  const DosenProfileNestedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                title: const Text('Profil Dosen'),
                backgroundColor: Colors.indigo,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors.indigo.shade100,
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(radius: 36, child: Icon(Icons.person, size: 40)),
                          SizedBox(height: 8),
                          Text('Dr. Ir. Hendra, M.T.', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                bottom: const TabBar(
                  tabs: [Tab(text: 'Jurnal & Publikasi'), Tab(text: 'Kelas Pengampu')],
                ),
              ),
            ],
            body: TabBarView(
              children: [
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (c, i) => ListTile(
                    leading: const Icon(Icons.article),
                    title: Text('Publikasi Ilmiah #${i + 1}'),
                    subtitle: const Text('Jurnal Nasional Terakreditasi Sinta 2'),
                  ),
                ),
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (c, i) => ListTile(
                    leading: const Icon(Icons.class_),
                    title: Text('Kelas Pengampu #${i + 1}'),
                    subtitle: const Text('Semester Ganjil 2026/2027'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
