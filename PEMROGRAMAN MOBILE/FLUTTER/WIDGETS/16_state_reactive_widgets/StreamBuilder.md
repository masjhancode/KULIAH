# Dokumentasi Widget: StreamBuilder

## 1. Penjelasan Singkat & Fungsi
Widget `StreamBuilder` merender antarmuka yang terus-menerus diperbarui secara reaktif berdasarkan aliran data berkesinambungan (*data stream*) `Stream<T>` (seperti WebSocket atau polling server).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `stream` | `Stream<T>?` | Objek aliran data Stream<T> yang didengarkan. |
| `builder` | `AsyncWidgetBuilder<T>` | Callback perender `Widget Function(BuildContext, AsyncSnapshot<T>)`. |
| `initialData` | `T?` | Nilai data awal. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const StreamBuilderDemoApp());
}

class StreamBuilderDemoApp extends StatelessWidget {
  const StreamBuilderDemoApp({super.key});

  Stream<int> _countStream() async* {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo StreamBuilder')),
        body: Center(
          child: StreamBuilder<int>(
            stream: _countStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Menunggu stream...');
              }
              return Text('Detik ke-${snapshot.data}', style: const TextStyle(fontSize: 30));
            },
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Layar Live Chat Konsultasi Akademik DPA Real-Time)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DpaLiveChatStreamApp());
}

class DpaLiveChatStreamApp extends StatelessWidget {
  const DpaLiveChatStreamApp({super.key});

  Stream<String> _getChatStream() async* {
    yield 'Pesan terhubung...';
    await Future.delayed(const Duration(seconds: 2));
    yield 'DPA: Halo Ahmad, ada kendala pengisian KRS?';
    await Future.delayed(const Duration(seconds: 3));
    yield 'DPA: SKS Anda sudah disetujui ya.';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Konsultasi DPA (Live)'), backgroundColor: Colors.indigo),
        body: Center(
          child: StreamBuilder<String>(
            stream: _getChatStream(),
            builder: (context, snapshot) {
              return Card(
                margin: const EdgeInsets.all(16),
                color: Colors.indigo.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    snapshot.data ?? 'Memuat saluran ruang obrolan...',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
```
