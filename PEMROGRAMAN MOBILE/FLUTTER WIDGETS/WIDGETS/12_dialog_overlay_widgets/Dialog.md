# Dokumentasi Widget: Dialog

## 1. Penjelasan Singkat & Fungsi
Widget `Dialog` merupakan jendela dialog kontainer kustom yang memberikan kebebasan penuh dalam merancang struktur tata letak antarmuka di dalamnya.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget tata letak kustom di dalam dialog. |
| `shape` | `ShapeBorder` | Bentuk garis luar dan sudut dialog. |
| `elevation` | `double` | Tingkat bayangan penonjolan dialog. |
| `backgroundColor` | `Color` | Warna latar belakang dialog. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CustomDialogDemoApp());
}

class CustomDialogDemoApp extends StatelessWidget {
  const CustomDialogDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Dialog Custom')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [Text('Dialog Custom')],
                    ),
                  ),
                ),
              );
            },
            child: const Text('Buka Dialog Custom'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Custom Dialog Kartu Identitas Digital Mahasiswa (KTM))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KtmCustomDialogApp());
}

class KtmCustomDialogApp extends StatelessWidget {
  const KtmCustomDialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('KTM Digital'), backgroundColor: Colors.indigo),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircleAvatar(radius: 40, backgroundColor: Colors.indigo, child: Icon(Icons.person, size: 50, color: Colors.white)),
                        const SizedBox(height: 12),
                        const Text('Ahmad Fauzi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const Text('NIM: 2026090123', style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 16),
                        const Icon(Icons.qr_code, size: 100),
                        const SizedBox(height: 16),
                        ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup')),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: const Text('Tampilkan KTM Digital', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
```
