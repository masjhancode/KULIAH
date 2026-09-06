# Dokumentasi Widget: SimpleDialog

## 1. Penjelasan Singkat & Fungsi
Widget `SimpleDialog` menyajikan dialog pilihan sederhana yang berisi daftar opsi `SimpleDialogOption` untuk memilih satu alternatif dari beberapa opsi.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `title` | `Widget` | Widget judul dialog pilihan. |
| `children` | `List<Widget>` | Daftar item pilihan SimpleDialogOption. |
| `shape` | `ShapeBorder` | Bentuk dan lengkungan sudut dialog. |
| `contentPadding` | `EdgeInsetsGeometry` | Jarak bantalan dalam isi dialog. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SimpleDialogDemoApp());
}

class SimpleDialogDemoApp extends StatelessWidget {
  const SimpleDialogDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo SimpleDialog')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  title: const Text('Pilih Akun'),
                  children: [
                    SimpleDialogOption(onPressed: () => Navigator.pop(context), child: const Text('Akun A')),
                    SimpleDialogOption(onPressed: () => Navigator.pop(context), child: const Text('Akun B')),
                  ],
                ),
              );
            },
            child: const Text('Pilih Akun'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Dialog Pemilihan Peran Akses SIAKAD Mobile)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RoleSelectSimpleDialogApp());
}

class RoleSelectSimpleDialogApp extends StatelessWidget {
  const RoleSelectSimpleDialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Ganti Peran Akses'), backgroundColor: Colors.indigo),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  title: const Text('Pilih Peran Akses Sistem', style: TextStyle(fontWeight: FontWeight.bold)),
                  children: [
                    SimpleDialogOption(
                      onPressed: () => Navigator.pop(context),
                      child: const ListTile(leading: Icon(Icons.school, color: Colors.indigo), title: Text('Mahasiswa S1')),
                    ),
                    SimpleDialogOption(
                      onPressed: () => Navigator.pop(context),
                      child: const ListTile(leading: Icon(Icons.person, color: Colors.indigo), title: Text('Asisten Dosen')),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Ganti Peran Akses', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
```
