# Dokumentasi Widget: CupertinoTabScaffold

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoTabScaffold` menggabungkan `CupertinoTabBar` dengan perender halaman `tabBuilder` untuk membangun antarmuka navigasi tab iOS yang mempertahankan state tiap tab.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `tabBar` | `CupertinoTabBar` | Objek CupertinoTabBar bagian bawah (wajib). |
| `tabBuilder` | `IndexedWidgetBuilder` | Callback perender `Widget Function(BuildContext, int index)` yang mengembalikan `CupertinoTabView` (wajib). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoTabScaffoldDemoApp());
}

class CupertinoTabScaffoldDemoApp extends StatelessWidget {
  const CupertinoTabScaffoldDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings'),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) => CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(middle: Text('Tab $index')),
              child: Center(child: Text('Konten Tab $index')),
            ),
          );
        },
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Tata Letak Utama Multi-Tab Portal SIAKAD Mobile iOS)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const SiakadIosTabScaffoldApp());
}

class SiakadIosTabScaffoldApp extends StatelessWidget {
  const SiakadIosTabScaffoldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.doc_text), label: 'Jadwal'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.chart_bar), label: 'KHS'),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(middle: Text(index == 0 ? 'Jadwal Kuliah' : 'KHS Semester')),
                child: Center(child: Text(index == 0 ? 'Daftar Hari Perkuliahan' : 'Rincian Nilai SKS')),
              );
            },
          );
        },
      ),
    );
  }
}
```
