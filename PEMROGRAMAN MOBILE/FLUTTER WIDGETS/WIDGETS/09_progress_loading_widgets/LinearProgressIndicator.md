# Dokumentasi Widget: LinearProgressIndicator

## 1. Penjelasan Singkat & Fungsi
Widget `LinearProgressIndicator` menampilkan bilah indikator kemajuan berbentuk garis horizontal melintang yang menunjukkan persentase selesainya suatu proses.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `double?` | Nilai kemajuan persentase (0.0 hingga 1.0). Jika null, animasi meluncur tanpa batas. |
| `color` | `Color` | Warna pengisi garis kemajuan. |
| `backgroundColor` | `Color` | Warna lintasan garis latar belakang. |
| `minHeight` | `double` | Ketebalan tinggi fisik bilah garis (default: 4.0). |
| `valueColor` | `Animation<Color?>` | Objek animasi perubahan warna garis. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const LinearProgressDemoApp());
}

class LinearProgressDemoApp extends StatelessWidget {
  const LinearProgressDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo LinearProgressIndicator')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: LinearProgressIndicator(value: 0.6),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Bilah Kemajuan (Progress Bar) Upload Berkas Dokumen Skripsi)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const UploadSkripsiProgressApp());
}

class UploadSkripsiProgressApp extends StatelessWidget {
  const UploadSkripsiProgressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Unggah Proposal Skripsi'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Mengunggah: Draft_Proposal_Skripsi.pdf', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              LinearProgressIndicator(
                value: 0.82,
                minHeight: 8,
                color: Colors.indigo,
                backgroundColor: Colors.indigoSeries,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Status: 82% terunggah'),
                  Text('4.1 MB / 5.0 MB'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
