# Dokumentasi Widget: BottomSheet

## 1. Penjelasan Singkat & Fungsi
Widget `BottomSheet` merupakan panel yang terangkat dari batas bawah layar untuk menyajikan pilihan aksi tambahan atau konten sekunder tanpa meninggalkan konteks halaman utama.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `builder` | `WidgetBuilder` | Callback fungsi pembuat hierarki konten widget di dalam BottomSheet. |
| `backgroundColor` | `Color` | Warna latar belakang panel BottomSheet. |
| `shape` | `ShapeBorder` | Bentuk lengkungan sudut panel (misal RoundedRectangleBorder dengan radius atas). |
| `isScrollControlled` | `bool` | Menentukan apakah modal dapat mengembang penuh layar (full height). |
| `showDragHandle` | `bool` | Menampilkan pegangan geser (*drag handle bar*) pada bagian atas panel Material 3. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BottomSheetDemoApp());
}

class BottomSheetDemoApp extends StatelessWidget {
  const BottomSheetDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo BottomSheet')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const SizedBox(
                  height: 200,
                  child: Center(child: Text('Konten BottomSheet')),
                ),
              );
            },
            child: const Text('Buka BottomSheet'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Modal Rincian Pembayaran SPP Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PaymentBottomSheetApp());
}

class PaymentBottomSheetApp extends StatelessWidget {
  const PaymentBottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Rincian Keuangan'), backgroundColor: Colors.indigo),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Rincian Tagihan SPP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('SPP Variabel (24 SKS)'), Text('Rp 3.600.000')],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Biaya Praktikum'), Text('Rp 750.000')],
                        ),
                        const Divider(height: 24),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Pembayaran', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Rp 4.350.000', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo, fontSize: 16)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Bayar Sekarang via VA', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text('Lihat Rincian SPP', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
```
