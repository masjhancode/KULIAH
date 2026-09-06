# Dokumentasi Widget: SearchDelegate (showSearch)

## 1. Deskripsi & Fungsi Modul

Kelas `SearchDelegate` (dipicu via `showSearch()`) merupakan komponen pencarian *fullscreen modal view* pada Flutter yang menyediakan antarmuka pencarian dedicated lengkap dengan tombol kembali, tombol pembersih, tampilan saran saat mengetik (`buildSuggestions`), dan layar penyaji hasil pencarian utama (`buildResults`). Dalam Sistem Informasi Akademik (SIAKAD), `SearchDelegate` digunakan untuk pencarian repositori skripsi/alumni dan katalog perpustakaan digital kampus.

## 2. Tabel Atribut & Penggunaannya

| Atribut / Method | Tipe Data / Return | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `query` | `String` | Teks kata kunci pencarian yang sedang diketikkan pengguna saat ini. |
| `buildActions()` | `List<Widget>?` | **(WAJIB)** Mengembalikan daftar widget aksi di pojok kanan app bar (misal tombol hapus `Icons.clear`). |
| `buildLeading()` | `Widget?` | **(WAJIB)** Mengembalikan widget navigasi di pojok kiri (misal tombol kembali `Icons.arrow_back`). |
| `buildResults()` | `Widget` | **(WAJIB)** Mengembalikan widget tampilan hasil akhir setelah tombol pencarian ditekan. |
| `buildSuggestions()` | `Widget` | **(WAJIB)** Mengembalikan widget rekomendasi kata kunci terpopuler saat pengguna sedang mengetik. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicSearchDelegateApp());
}

class BasicSearchDelegateApp extends StatelessWidget {
  const BasicSearchDelegateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Basic SearchDelegate'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SimpleSearchDelegate());
              },
            ),
          ],
        ),
        body: const Center(child: Text('Ketuk ikon pencarian di atas')),
      ),
    );
  }
}

class SimpleSearchDelegate extends SearchDelegate {
  final List<String> _data = ['Algoritma', 'Basis Data', 'Flutter', 'Kecerdasan Buatan'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text('Hasil untuk: $query'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _data.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestions[index]),
        onTap: () {
          query = suggestions[index];
          showResults(context);
        },
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Modal Search Repositori Skripsi Kampus SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadSearchRepoApp());
}

class SiakadSearchRepoApp extends StatelessWidget {
  const SiakadSearchRepoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repositori SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const RepoHomeScreen(),
    );
  }
}

class RepoHomeScreen extends StatelessWidget {
  const RepoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REPOSITORI SKRIPSI KAMPUS'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SkripsiSearchDelegate());
            },
            tooltip: 'Cari Judul Skripsi',
          ),
        ],
      ),
      body: const Center(
        child: Text('Tekan tombol pencarian di pojok kanan atas'),
      ),
    );
  }
}

class SkripsiSearchDelegate extends SearchDelegate {
  final List<SkripsiModel> _repo = [
    SkripsiModel(judul: 'Penerapan Algoritma Naive Bayes pada Sentiment Analysis SIAKAD', penulis: 'Rian Hidayat', tahun: '2025'),
    SkripsiModel(judul: 'Rancang Bangun Sistem Presensi Geofencing Berbasis Flutter', penulis: 'Ahmad Fauzi', tahun: '2026'),
    SkripsiModel(judul: 'Analisis Performa Sistem Cloud Database PDDikti', penulis: 'Siti Aminah', tahun: '2024'),
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _repo.where((s) => s.judul.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: const Icon(Icons.book, color: Colors.indigo),
            title: Text(item.judul, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Penulis: ${item.penulis} (${item.tahun})'),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _repo.where((s) => s.judul.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final item = suggestions[index];
        return ListTile(
          leading: const Icon(Icons.history),
          title: Text(item.judul),
          onTap: () {
            query = item.judul;
            showResults(context);
          },
        );
      },
    );
  }
}

class SkripsiModel {
  final String judul;
  final String penulis;
  final String tahun;

  SkripsiModel({required this.judul, required this.penulis, required this.tahun});
}
```
