# Dokumentasi Widget: SingleChildScrollView

## 1. Penjelasan Singkat & Fungsi
Widget `SingleChildScrollView` digunakan untuk membungkus widget tunggal (*single child*) agar dapat digulir (*scrollable*) saat ukuran konten melebihi batas layar fisik.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget anak tunggal yang dimasukkan ke dalam area scrollable. |
| `scrollDirection` | `Axis` | Arah sumbu pengguliran (Axis.vertical atau Axis.horizontal). |
| `padding` | `EdgeInsetsGeometry` | Jarak inset batas internal di sekeliling konten scroll. |
| `physics` | `ScrollPhysics` | Perilaku pengguliran (BouncingScrollPhysics, ClampingScrollPhysics, NeverScrollableScrollPhysics). |
| `controller` | `ScrollController` | Pengontrol untuk memantau atau memanipulasi posisi scroll. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SingleChildScrollViewDemoApp());
}

class SingleChildScrollViewDemoApp extends StatelessWidget {
  const SingleChildScrollViewDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo SingleChildScrollView')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: List.generate(
              15,
              (index) => Card(
                child: ListTile(
                  title: Text('Item Formulir Ke-${index + 1}'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Formulir Pengajuan Cuti Akademik)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CutiFormApp());
}

class CutiFormApp extends StatelessWidget {
  const CutiFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Formulir Pengajuan Cuti Kuliah'),
          backgroundColor: Colors.indigo,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Informasi Mahasiswa', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: 'Ahmad Fauzi (2026090123)',
                decoration: const InputDecoration(labelText: 'Nama / NIM', border: OutlineInputBorder()),
                readOnly: true,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: 'Teknik Informatika - Semester 6',
                decoration: const InputDecoration(labelText: 'Program Studi', border: OutlineInputBorder()),
                readOnly: true,
              ),
              const SizedBox(height: 24),
              const Text('Alasan Pengajuan Cuti', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              TextField(
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Tuliskan alasan pengajuan cuti akademik secara detail...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                value: true,
                onChanged: (val) {},
                title: const Text('Saya menyetujui seluruh ketentuan Cuti Akademik Universitas.'),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                  onPressed: () {},
                  child: const Text('Kirim Pengajuan Cuti', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
