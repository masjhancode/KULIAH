# Dokumentasi Widget: ModalBottomSheet

## 1. Penjelasan Singkat & Fungsi
Fungsi `showModalBottomSheet` menampilkan lembar bawah modal sementara yang memblokir interaksi latar belakang sampai pengguna membuat keputusan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `context` | `BuildContext` | Konteks build lokasi pemanggilan modal. |
| `builder` | `WidgetBuilder` | Fungsi perender isi konten modal. |
| `isScrollControlled` | `bool` | Menentukan apakah modal dapat mengembang penuh layar. |
| `shape` | `ShapeBorder` | Bentuk lengkungan sudut atas panel modal. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ModalBottomSheetDemoApp());
}

class ModalBottomSheetDemoApp extends StatelessWidget {
  const ModalBottomSheetDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ModalBottomSheet')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const SizedBox(height: 200, child: Center(child: Text('Modal BottomSheet'))),
              );
            },
            child: const Text('Buka Modal'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Modal Rincian Tagihan & Metode Pembayaran SPP)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PaymentModalBottomSheetApp());
}

class PaymentModalBottomSheetApp extends StatelessWidget {
  const PaymentModalBottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Rincian SPP'), backgroundColor: Colors.indigo),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Total Pembayaran SPP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 12),
                      const Text('Rp 4.350.000', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo)),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Bayar Sekarang', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Text('Lihat Tagihan', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
```
