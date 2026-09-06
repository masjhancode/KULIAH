# Dokumentasi Widget: CupertinoActionSheet

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoActionSheet` menampilkan opsi tindakan pilihan bergaya iOS (*action sheet*) dari bagian bawah layar.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `title` | `Widget?` | Widget judul action sheet. |
| `message` | `Widget?` | Widget pesan informasi. |
| `actions` | `List<Widget>?` | Daftar tombol pilihan `CupertinoActionSheetAction`. |
| `cancelButton` | `Widget?` | Tombol pembatalan di bagian bawah terpisah (CupertinoActionSheetAction). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoActionSheetDemoApp());
}

class CupertinoActionSheetDemoApp extends StatelessWidget {
  const CupertinoActionSheetDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Builder(
            builder: (context) => CupertinoButton.filled(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: const Text('Pilih Opsi'),
                    actions: [
                      CupertinoActionSheetAction(onPressed: () => Navigator.pop(context), child: const Text('Opsi 1')),
                    ],
                    cancelButton: CupertinoActionSheetAction(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
                  ),
                );
              },
              child: const Text('Buka Action Sheet'),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Lembar Aksi Pilihan Unduh Dokumen Transkrip KHS (PDF / Excel))

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const ExportKhsIosActionSheetApp());
}

class ExportKhsIosActionSheetApp extends StatelessWidget {
  const ExportKhsIosActionSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('Cetak KHS')),
        child: Center(
          child: Builder(
            builder: (context) => CupertinoButton.filled(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: const Text('Ekspor Dokumen KHS'),
                    message: const Text('Pilih format dokumen resmi yang ingin diunduh:'),
                    actions: [
                      CupertinoActionSheetAction(onPressed: () => Navigator.pop(context), child: const Text('Unduh Format PDF Resmi')),
                      CupertinoActionSheetAction(onPressed: () => Navigator.pop(context), child: const Text('Unduh Format Excel (XLSX)')),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'),
                    ),
                  ),
                );
              },
              child: const Text('Ekspor Dokumen KHS'),
            ),
          ),
        ),
      ),
    );
  }
}
```
