# Dokumentasi Widget: InputChip

## 1. Penjelasan Singkat & Fungsi
Widget `InputChip` merupakan chip entri data yang merespon gestur sentuhan, penyeleksian, dan tombol penghapusan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `label` | `Widget` | Widget teks masukan chip. |
| `selected` | `bool` | Status penyeleksian chip. |
| `onSelected` | `ValueChanged<bool>` | Callback respon saat chip ditekan seleksi. |
| `onDeleted` | `VoidCallback` | Callback fungsi tombol hapus. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const InputChipDemoApp());
}

class InputChipDemoApp extends StatelessWidget {
  const InputChipDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo InputChip')),
        body: Center(
          child: InputChip(
            label: const Text('Flutter'),
            onSelected: (v) {},
            onDeleted: () {},
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Chip Dynamic Topik Bimbingan Skripsi Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SkripsiTopicChipApp());
}

class SkripsiTopicChipApp extends StatefulWidget {
  const SkripsiTopicChipApp({super.key});

  @override
  State<SkripsiTopicChipApp> createState() => _SkripsiTopicChipAppState();
}

class _SkripsiTopicChipAppState extends State<SkripsiTopicChipApp> {
  final List<String> _topics = ['Mobile Dev', 'AI & Machine Learning', 'Cyber Security'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Topik Skripsi'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 8,
            children: _topics.map((topic) {
              return InputChip(
                label: Text(topic),
                onDeleted: () {
                  setState(() => _topics.remove(topic));
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
```
