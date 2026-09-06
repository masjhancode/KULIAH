# Dokumentasi Widget: ListView.custom

## 1. Penjelasan Singkat & Fungsi
Konstruktor `ListView.custom` memberikan kontrol tingkat lanjut atas pembuatan elemen daftar menggunakan delegate `SliverChildDelegate`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `childrenDelegate` | `SliverChildDelegate` | Delegate pembuat anak (SliverChildBuilderDelegate atau SliverChildListDelegate). |
| `scrollDirection` | `Axis` | Arah pengguliran daftar. |
| `padding` | `EdgeInsetsGeometry` | Jarak inset internal area daftar. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ListViewCustomDemoApp());
}

class ListViewCustomDemoApp extends StatelessWidget {
  const ListViewCustomDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ListView.custom')),
        body: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('Item Custom #${index + 1}')),
            childCount: 15,
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Feed Berita & Pengumuman Utama Kampus)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const NewsFeedApp());
}

class NewsFeedApp extends StatelessWidget {
  const NewsFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Warta Kampus'),
          backgroundColor: Colors.indigo,
        ),
        body: ListView.custom(
          padding: const EdgeInsets.all(16.0),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      color: Colors.indigo.shade100,
                      child: Center(
                        child: Icon(Icons.newspaper, size: 48, color: Colors.indigo.shade400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pengumuman Penting #${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 4),
                          const Text('Informasi terkait jadwal wisuda periode mendatang dan syarat pendaftaran.', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: 5,
          ),
        ),
      ),
    );
  }
}
```
