# Dokumentasi Widget: ElevatedButton

## 1. Penjelasan Singkat & Fungsi
Widget `ElevatedButton` digunakan untuk membuat tombol utama yang memiliki penonjolan bayangan (*elevation*). Tombol ini ideal untuk aksi primer yang membutuhkan penekanan hirarki visual.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `onPressed` | `VoidCallback` | Callback fungsi yang dieksekusi saat tombol ditekan (jika null, tombol berstatus disabled). |
| `child` | `Widget` | Widget label atau ikon di dalam tombol. |
| `style` | `ButtonStyle` | Kustomisasi gaya tombol (warna latar, ukuran padding, bentuk sudut, bayangan). |
| `onLongPress` | `VoidCallback` | Callback fungsi saat tombol ditekan tahan lama. |
| `focusNode` | `FocusNode` | Objek pemfokusan navigasi keyboard. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ElevatedButtonDemoApp());
}

class ElevatedButtonDemoApp extends StatelessWidget {
  const ElevatedButtonDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ElevatedButton')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Simpan Data'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tombol Konfirmasi Simpan KRS Semester Ganjil)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KrsSubmitButtonApp());
}

class KrsSubmitButtonApp extends StatelessWidget {
  const KrsSubmitButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pengisian KRS'), backgroundColor: Colors.indigo),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {},
                icon: const Icon(Icons.check_circle, color: Colors.white),
                label: const Text(
                  'Konfirmasi & Submit KRS',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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
