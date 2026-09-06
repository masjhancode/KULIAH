# Dokumentasi Widget: SearchBar (Material 3)

## 1. Deskripsi & Fungsi Modul

Widget `SearchBar` (bersama `SearchAnchor`) merupakan komponen pencarian *real-time* berbasis standar Material 3 pada Flutter. Widget ini menyajikan bidang masukan pencarian modern lengkap dengan ikon pencarian, tombol pembersih (*clear button*), dan overlay daftar saran rekomendasi (*search suggestions*). Dalam Sistem Informasi Akademik (SIAKAD), widget ini digunakan untuk pencarian cepat nama mahasiswa, NIM, nama dosen pengampu, atau daftar mata kuliah KRS.

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `controller` | `TextEditingController?` | Pengontrol teks masukan di dalam bilah pencarian. |
| `hintText` | `String?` | Teks petunjuk transparan saat bidang pencarian kosong (misal: "Cari Nama / NIM Mahasiswa..."). |
| `leading` | `Widget?` | Widget ikon di sisi kiri bilah pencarian (biasanya `Icon(Icons.search)`). |
| `trailing` | `Iterable<Widget>?` | List widget ikon di sisi kanan (misal: tombol mik/clear). |
| `onChanged` | `ValueChanged<String>?` | Callback fungsi saat kata kunci pencarian berubah. |
| `onSubmitted` | `ValueChanged<String>?` | Callback fungsi saat pengguna menekan tombol Enter/Search pada papan ketik. |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicSearchBarApp());
}

class BasicSearchBarApp extends StatelessWidget {
  const BasicSearchBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic SearchBar M3')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchBar(
            hintText: 'Cari kata kunci...',
            leading: const Icon(Icons.search),
            onChanged: (String query) {
              print('Kueri pencarian: $query');
            },
          ),
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Pencarian Mata Kuliah KRS SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadSearchMatkulApp());
}

class SiakadSearchMatkulApp extends StatelessWidget {
  const SiakadSearchMatkulApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pencarian SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const SearchMatkulScreen(),
    );
  }
}

class SearchMatkulScreen extends StatefulWidget {
  const SearchMatkulScreen({super.key});

  @override
  State<SearchMatkulScreen> createState() => _SearchMatkulScreenState();
}

class _SearchMatkulScreenState extends State<SearchMatkulScreen> {
  final List<MatkulModel> _allMatkul = [
    MatkulModel(kode: 'TIF101', nama: 'Pemrograman Terintegrasi Sistem', sks: 3),
    MatkulModel(kode: 'TIF102', nama: 'Basis Data Lanjut', sks: 4),
    MatkulModel(kode: 'TIF103', nama: 'Kecerdasan Buatan', sks: 3),
    MatkulModel(kode: 'TIF104', nama: 'Pemrograman Mobile Flutter', sks: 3),
    MatkulModel(kode: 'TIF105', nama: 'Jaringan Komputer & Keamanan', sks: 3),
  ];

  List<MatkulModel> _filteredMatkul = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredMatkul = _allMatkul;
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredMatkul = _allMatkul
          .where((m) => m.nama.toLowerCase().contains(query.toLowerCase()) || m.kode.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KATALOG MATA KULIAH KRS'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Cari Kode atau Nama Mata Kuliah...',
              leading: const Icon(Icons.search, color: Colors.indigo),
              trailing: [
                if (_searchController.text.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      _onSearchChanged('');
                    },
                  ),
              ],
              onChanged: _onSearchChanged,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMatkul.length,
              itemBuilder: (context, index) {
                final item = _filteredMatkul[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: Text(item.kode.substring(3), style: const TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  title: Text(item.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Kode: ${item.kode} | Beban: ${item.sks} SKS'),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Ambil'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MatkulModel {
  final String kode;
  final String nama;
  final int sks;

  MatkulModel({required this.kode, required this.nama, required this.sks});
}
```
