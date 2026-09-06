# Dokumentasi Widget: FutureBuilder

## 1. Penjelasan Singkat & Fungsi
Widget `FutureBuilder` merender tampilan antarmuka secara dinamis berdasarkan snapshot status terkini dari operasi asinkron tunggal `Future<T>` (seperti request API HTTP).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `future` | `Future<T>?` | Objek tugas asinkron Future<T> yang didengarkan. |
| `builder` | `AsyncWidgetBuilder<T>` | Callback perender `Widget Function(BuildContext, AsyncSnapshot<T>)` yang memeriksa snapshot.connectionState dan snapshot.data / snapshot.error. |
| `initialData` | `T?` | Data awal sebelum Future menyelesaikan eksekusi. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FutureBuilderDemoApp());
}

class FutureBuilderDemoApp extends StatelessWidget {
  const FutureBuilderDemoApp({super.key});

  Future<String> _fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Data Berhasil Dimuat!';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FutureBuilder')),
        body: Center(
          child: FutureBuilder<String>(
            future: _fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return Text(snapshot.data ?? 'Kosong', style: const TextStyle(fontSize: 20));
            },
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pengambilan Data Profil Mahasiswa & IPK dari Backend REST API)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentApiFutureApp());
}

class StudentApiFutureApp extends StatelessWidget {
  const StudentApiFutureApp({super.key});

  Future<Map<String, dynamic>> _getStudentProfile() async {
    await Future.delayed(const Duration(seconds: 2));
    return {'nama': 'Ahmad Fauzi', 'nim': '2026090123', 'ipk': 3.85};
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Profil Mahasiswa'), backgroundColor: Colors.indigo),
        body: Center(
          child: FutureBuilder<Map<String, dynamic>>(
            future: _getStudentProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator(color: Colors.indigo), SizedBox(height: 12), Text('Menghubungkan ke API SIAKAD...')],
                );
              } else if (snapshot.hasError) {
                return const Text('Gagal memuat profil mahasiswa');
              }
              final data = snapshot.data!;
              return Card(
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(data['nama'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('NIM: ${data['nim']}'),
                      const Divider(),
                      Text('IPK: ${data['ipk']}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                    ],
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
