# Dokumentasi Widget: LayoutBuilder

## 1. Penjelasan Singkat & Fungsi
Widget `LayoutBuilder` membangun pohon widget berdasarkan batasan ukuran kontainer induk (*BoxConstraints*) yang dikirimkan oleh widget induknya.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `builder` | `Widget Function(BuildContext, BoxConstraints)` | Callback fungsi perender yang menerima konteks dan objek batasan BoxConstraints (maxWidth, maxHeight, minWidth, minHeight). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutBuilderDemoApp());
}

class LayoutBuilderDemoApp extends StatelessWidget {
  const LayoutBuilderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo LayoutBuilder')),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 500) {
              return const Center(child: Text('Layout Lebar (>500px)'));
            } else {
              return const Center(child: Text('Layout Sempit (<=500px)'));
            }
          },
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Penyesuaian Grid Kartu Modul Akademik (2 Kolom HP vs 4 Kolom Tablet))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ModuleGridAdaptiveApp());
}

class ModuleGridAdaptiveApp extends StatelessWidget {
  const ModuleGridAdaptiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Daftar Modul Matkul'), backgroundColor: Colors.indigo),
        body: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.indigo.shade50,
                  child: Center(child: Text('Modul ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold))),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
```
