# Dokumentasi Widget: Dialog.fullscreen

## 1. Penjelasan Singkat & Fungsi
Konstruktor `Dialog.fullscreen` menampilkan dialog modal yang mengembang penuh layar (*full screen*), sangat cocok untuk formulir pengisian data kompleks.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `child` | `Widget` | Widget tata letak halaman penuh di dalam dialog. |
| `backgroundColor` | `Color` | Warna latar belakang dialog fullscreen. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FullscreenDialogDemoApp());
}

class FullscreenDialogDemoApp extends StatelessWidget {
  const FullscreenDialogDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Dialog Fullscreen')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Dialog.fullscreen(
                  child: Scaffold(
                    appBar: AppBar(title: const Text('Dialog Fullscreen')),
                    body: const Center(child: Text('Konten Fullscreen')),
                  ),
                ),
              );
            },
            child: const Text('Buka Dialog Fullscreen'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Fullscreen Dialog Form Pengajuan Judul Skripsi)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ProposalFullscreenDialogApp());
}

class ProposalFullscreenDialogApp extends StatelessWidget {
  const ProposalFullscreenDialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Pengajuan Skripsi'), backgroundColor: Colors.indigo),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Dialog.fullscreen(
                  child: Scaffold(
                    appBar: AppBar(
                      title: const Text('Form Pengajuan Judul Skripsi'),
                      backgroundColor: Colors.indigo,
                      leading: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const TextField(decoration: InputDecoration(labelText: 'Usulan Judul Skripsi', border: OutlineInputBorder())),
                          const SizedBox(height: 16),
                          const TextField(maxLines: 4, decoration: InputDecoration(labelText: 'Ringkasan Abstrak', border: OutlineInputBorder())),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Kirim Proposal', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            child: const Text('Ajukan Judul Skripsi', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
```
