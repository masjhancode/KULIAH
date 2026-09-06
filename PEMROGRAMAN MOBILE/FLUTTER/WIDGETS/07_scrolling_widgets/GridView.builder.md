# Dokumentasi Widget: GridView.builder

## 1. Penjelasan Singkat & Fungsi
Konstruktor `GridView.builder` membuat tata letak grid dinamis yang merender elemen secara efisien (*lazy loading*) hanya saat masuk ke area layar.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `gridDelegate` | `SliverGridDelegate` | Delegate pengatur tata letak kisi. |
| `itemCount` | `int` | Jumlah total elemen item pada grid. |
| `itemBuilder` | `IndexedWidgetBuilder` | Fungsi perender widget item berdasarkan indeks. |
| `padding` | `EdgeInsetsGeometry` | Jarak inset di sekeliling area grid. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const GridViewBuilderDemoApp());
}

class GridViewBuilderDemoApp extends StatelessWidget {
  const GridViewBuilderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo GridView.builder')),
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 40,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue.shade50,
              child: Center(child: Text('Item Grid #${index + 1}')),
            );
          },
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Direktori Dosen & Staf Pengajar Program Studi)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const LecturerDirectoryApp());
}

class LecturerDirectoryApp extends StatelessWidget {
  const LecturerDirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Direktori Dosen Informatika'),
          backgroundColor: Colors.indigo,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.person, color: Colors.white, size: 32),
                  ),
                  const SizedBox(height: 8),
                  Text('Dosen #${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Text('NIDN: 040102830${index}', style: TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
```
