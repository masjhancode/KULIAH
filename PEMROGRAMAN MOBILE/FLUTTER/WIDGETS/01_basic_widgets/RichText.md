# Dokumentasi Widget: RichText

## 1. Penjelasan Singkat & Fungsi
Widget `RichText` digunakan untuk menampilkan teks yang terdiri dari beberapa segmen dengan gaya visual (style) berbeda dalam satu rangkaian kalimat atau paragraf.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `text` | `InlineSpan` | Objek akar InlineSpan (umumnya TextSpan) yang menampung hierarki segmen teks. |
| `textAlign` | `TextAlign` | Menentukan perataan teks paragraf secara keseluruhan. |
| `overflow` | `TextOverflow` | Menangani pemotongan jika paragraf melebihi batas area tampilan. |
| `maxLines` | `int` | Batas maksimal jumlah baris yang dirender. |
| `textDirection` | `TextDirection` | Arah penulisan teks (left-to-right atau right-to-left). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RichTextDemoApp());
}

class RichTextDemoApp extends StatelessWidget {
  const RichTextDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo RichText Widget')),
        body: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black87),
              children: [
                TextSpan(text: 'Status Studi: '),
                TextSpan(
                  text: 'AKTIF',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
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

### 3.2 Contoh Kode Studi Kasus UI (Label Status Pembayaran & SKS KRS)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const StatusRichTextApp());
}

class StatusRichTextApp extends StatelessWidget {
  const StatusRichTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      children: [
                        TextSpan(text: 'Total SKS Diambil: '),
                        TextSpan(text: '24 SKS ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
                        TextSpan(text: '(Batas Maksimal)', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      children: [
                        TextSpan(text: 'Status Registrasi SPP: '),
                        TextSpan(text: 'LUNAS ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                        TextSpan(text: '✓', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
