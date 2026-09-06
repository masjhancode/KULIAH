# Dokumentasi Widget: RefreshIndicator

## 1. Penjelasan Singkat & Fungsi
Widget `RefreshIndicator` membungkus komponen scrollable (`ListView`, `CustomScrollView`) untuk mendeteksi gestur tarik-ke-bawah (*pull-to-refresh*) dan menjalankan callback `onRefresh` pembaruan data secara asinkron.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onRefresh` | `RefreshCallback` | Callback fungsi asinkron (Future<void>) yang dieksekusi saat gestur tarik dipicu. |
| `child` | `Widget` | Widget berformat scrollable di dalam penampung. |
| `color` | `Color` | Warna busur putar indikator. |
| `backgroundColor` | `Color` | Warna latar lingkaran melayang. |
| `displacement` | `double` | Jarak penimbulan indikator dari batas atas. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RefreshIndicatorDemoApp());
}

class RefreshIndicatorDemoApp extends StatelessWidget {
  const RefreshIndicatorDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo RefreshIndicator')),
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          child: ListView(
            children: const [
              ListTile(title: Text('Tarik ke bawah untuk refresh')),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Gestur Pull-to-Refresh Pembaruan Pengumuman Kampus)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const NewsRefreshApp());
}

class NewsRefreshApp extends StatefulWidget {
  const NewsRefreshApp({super.key});

  @override
  State<NewsRefreshApp> createState() => _NewsRefreshAppState();
}

class _NewsRefreshAppState extends State<NewsRefreshApp> {
  List<String> _news = ['Jadwal UTS Semester Ganjil Diumumkan', 'Pengajuan Beasiswa UKT Dibuka'];

  Future<void> _refreshNews() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _news.insert(0, 'Pengumuman Baru: Seminar Nasional IoT (${DateTime.now().second} dtk)');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pengumuman Kampus'), backgroundColor: Colors.indigo),
        body: RefreshIndicator(
          color: Colors.indigo,
          onRefresh: _refreshNews,
          child: ListView.builder(
            itemCount: _news.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.campaign, color: Colors.indigo),
                  title: Text(_news[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Diunggah oleh Bagian Kemahasiswaan'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
```
