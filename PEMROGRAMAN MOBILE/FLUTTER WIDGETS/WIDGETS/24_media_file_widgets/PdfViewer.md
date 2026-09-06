# Dokumentasi Widget: PdfViewer (Pelihat Berkas PDF)

## 1. Deskripsi & Fungsi Modul

Widget `PdfViewer` (menggunakan paket standar seperti `flutter_pdfview` atau `syncfusion_flutter_pdfviewer`) merupakan komponen penyaji dokumen digital berformat PDF pada Flutter. Dalam Sistem Informasi Akademik (SIAKAD), widget ini digunakan untuk menampilkan dokumen resmi kampus secara *in-app* tanpa perlu mengunduh aplikasi luar, seperti Transkrip Nilai Cetak, Sertifikat E-Ijazah, Kartu Hasil Studi (KHS) bertanda tangan digital, serta Berita Acara Ujian Sidang.


## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `filePath` | `String?` | Jalur lokasi file PDF yang tersimpan di memori perangkat lokal. |
| `urlPath` | `String?` | URL endpoint jaringan untuk memuat dokumen PDF secara online dari server. |
| `enableSwipe` | `bool` | Mengaktifkan gestur usapan (*swipe*) untuk beralih halaman PDF. |
| `autoSpacing` | `bool` | Menambahkan jarak spasi otomatis antarhalaman dokumen. |
| `onPageChanged` | `void Function(int, int)?` | Callback fungsi saat nomor halaman PDF yang aktif berubah. |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicPdfViewerApp());
}

class BasicPdfViewerApp extends StatelessWidget {
  const BasicPdfViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic PDF Viewer')),
        body: const Center(
          child: Text('Placeholder: Menggunakan PDFView(filePath: "/path/transkrip.pdf")'),
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Pratinjau E-Ijazah & Transkrip SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadPdfPreviewApp());
}

class SiakadPdfPreviewApp extends StatelessWidget {
  const SiakadPdfPreviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dokumen SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const TranskripPdfScreen(),
    );
  }
}

class TranskripPdfScreen extends StatefulWidget {
  const TranskripPdfScreen({super.key});

  @override
  State<TranskripPdfScreen> createState() => _TranskripPdfScreenState();
}

class _TranskripPdfScreenState extends State<TranskripPdfScreen> {
  int _currentPage = 1;
  final int _totalPages = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRATINJAU DOKUMEN KHS / TRANSKRIP'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Mengunduh berkas Transkrip_Ahmad_Fauzi.pdf...'), backgroundColor: Colors.indigo),
              );
            },
            tooltip: 'Unduh PDF',
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: Colors.indigo.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Halaman $_currentPage dari $_totalPages', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: _currentPage > 1 ? () => setState(() => _currentPage--) : null,
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: _currentPage < _totalPages ? () => setState(() => _currentPage++) : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.picture_as_pdf, size: 80, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('TRANSKRIP AKADEMIK SEMENTARA - HALAMAN $_currentPage', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('NIM: 2026090123 | Nama: Ahmad Fauzi'),
                    const SizedBox(height: 12),
                    Chip(
                      avatar: const Icon(Icons.verified, color: Colors.green),
                      label: const Text('Terverifikasi Digital PDDikti'),
                      backgroundColor: Colors.green.shade50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```
