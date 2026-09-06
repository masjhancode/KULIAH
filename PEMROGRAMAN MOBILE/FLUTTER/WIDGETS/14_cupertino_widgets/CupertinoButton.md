# Dokumentasi Widget: CupertinoButton

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoButton` menampilkan tombol interaktif gaya iOS dengan respon animasi redup transparansi (*opacity fade*) saat ditekan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget label anak (wajib). |
| `onPressed` | `VoidCallback?` | Callback pemicu klik. |
| `color` | `Color?` | Warna latar belakang tombol (jika menggunakan varian filled). |
| `borderRadius` | `BorderRadius?` | Lengkung sudut tombol (default: 8.0). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoButtonDemoApp());
}

class CupertinoButtonDemoApp extends StatelessWidget {
  const CupertinoButtonDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(onPressed: () {}, child: const Text('Tombol Biasa')),
              CupertinoButton.filled(onPressed: () {}, child: const Text('Tombol Filled')),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tombol Aksi Pembayaran SPP via Apple Pay / Bank di iOS)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const SppPayIosButtonApp());
}

class SppPayIosButtonApp extends StatelessWidget {
  const SppPayIosButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('Pembayaran SPP')),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton.filled(
                  color: CupertinoColors.activeBlue,
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.creditcard),
                      SizedBox(width: 8),
                      Text('Bayar SPP Rp 4.500.000'),
                    ],
                  ),
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
