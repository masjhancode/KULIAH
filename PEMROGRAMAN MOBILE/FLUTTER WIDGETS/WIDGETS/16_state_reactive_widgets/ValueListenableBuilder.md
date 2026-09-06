# Dokumentasi Widget: ValueListenableBuilder

## 1. Penjelasan Singkat & Fungsi
Widget `ValueListenableBuilder` secara efisien membangun kembali (*rebuild*) hanya bagian widget yang tergantung pada perubahan nilai variabel `ValueNotifier<T>`, tanpa melakukan rebuild pada widget di atasnya.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `valueListenable` | `ValueListenable<T>` | Objek pendengar variabel ValueNotifier<T> (wajib). |
| `builder` | `ValueWidgetBuilder<T>` | Callback fungsi perender `Widget Function(BuildContext, T value, Widget? child)`. |
| `child` | `Widget?` | Sub-pohon widget statis yang tidak perlu di-rebuild saat nilai berubah. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ValueListenableDemoApp());
}

class ValueListenableDemoApp extends StatelessWidget {
  const ValueListenableDemoApp({super.key});

  static final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ValueListenableBuilder')),
        body: Center(
          child: ValueListenableBuilder<int>(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text('Nilai: $value', style: const TextStyle(fontSize: 24));
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _counter.value++,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Penghitung Total SKS Terpilih Real-Time pada Form KRS Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KrsSksNotifierApp());
}

class KrsSksNotifierApp extends StatelessWidget {
  const KrsSksNotifierApp({super.key});

  static final ValueNotifier<int> totalSksNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('KRS Planner'),
          backgroundColor: Colors.indigo,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: ValueListenableBuilder<int>(
                  valueListenable: totalSksNotifier,
                  builder: (context, totalSks, child) {
                    return Text('$totalSks / 24 SKS', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16));
                  },
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            CheckboxListTile(
              title: const Text('Pemrograman Seluler (3 SKS)'),
              value: true,
              onChanged: (val) {
                totalSksNotifier.value += (val == true ? 3 : -3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
```
