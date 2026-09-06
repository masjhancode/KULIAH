# Dokumentasi Widget: CupertinoAlertDialog

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoAlertDialog` menampilkan dialog konfirmasi modal khas iOS dengan sudut melengkung halus dan tombol aksi bergaris pemisah.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `title` | `Widget?` | Widget judul dialog iOS. |
| `content` | `Widget?` | Widget pesan bodi dialog. |
| `actions` | `List<Widget>` | Daftar widget `CupertinoDialogAction` untuk pilihan aksi. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoDialogDemoApp());
}

class CupertinoDialogDemoApp extends StatelessWidget {
  const CupertinoDialogDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Builder(
            builder: (context) => CupertinoButton.filled(
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('Konfirmasi'),
                    content: const Text('Apakah Anda yakin?'),
                    actions: [
                      CupertinoDialogAction(child: const Text('Batal'), onPressed: () => Navigator.pop(context)),
                      CupertinoDialogAction(isDestructiveAction: true, child: const Text('Hapus'), onPressed: () => Navigator.pop(context)),
                    ],
                  ),
                );
              },
              child: const Text('Buka Dialog iOS'),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Dialog Modal Konfirmasi Pembatalan Matkul KRS Bergaya iOS)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const KrsCancelIosDialogApp());
}

class KrsCancelIosDialogApp extends StatelessWidget {
  const KrsCancelIosDialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('Rincian KRS')),
        child: Center(
          child: Builder(
            builder: (context) => CupertinoButton(
              color: CupertinoColors.destructiveRed,
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('Batalkan Matkul?'),
                    content: const Text('Apakah Anda yakin ingin membatalkan matkul Pemrograman Seluler dari rencana studi?'),
                    actions: [
                      CupertinoDialogAction(child: const Text('Batal'), onPressed: () => Navigator.pop(context)),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Ya, Batalkan'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Batalkan Matkul'),
            ),
          ),
        ),
      ),
    );
  }
}
```
