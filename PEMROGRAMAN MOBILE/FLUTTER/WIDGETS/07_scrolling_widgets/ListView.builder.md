# Dokumentasi Widget: ListView.builder

## 1. Penjelasan Singkat & Fungsi
Konstruktor `ListView.builder` digunakan untuk merender daftar elemen secara dinamis dan efisien (*lazy loading*), merender item hanya saat muncul pada area tampilan (*viewport*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `itemCount` | `int` | Jumlah total item yang ada pada daftar. |
| `itemBuilder` | `IndexedWidgetBuilder` | Callback fungsi perender widget item berdasarkan indeks. |
| `scrollDirection` | `Axis` | Arah sumbu pengguliran (Axis.vertical atau Axis.horizontal). |
| `padding` | `EdgeInsetsGeometry` | Jarak inset internal area daftar. |
| `physics` | `ScrollPhysics` | Perilaku animasi scroll. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ListViewBuilderDemoApp());
}

class ListViewBuilderDemoApp extends StatelessWidget {
  const ListViewBuilderDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo ListView.builder')),
        body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text('Data Mahasiswa Ke-${index + 1}'),
              subtitle: const Text('Status: Aktif'),
            );
          },
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Riwayat Transkrip KHS Semesteran)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const KhsHistoryApp());
}

class KhsHistoryApp extends StatelessWidget {
  const KhsHistoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> semesters = List.generate(
      8,
      (i) => {'semester': i + 1, 'ips': (3.5 + (i % 4) * 0.1).toStringAsFixed(2), 'sks': 20 + (i % 3)},
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Riwayat KHS Semesteran'),
          backgroundColor: Colors.indigo,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: semesters.length,
          itemBuilder: (context, index) {
            final data = semesters[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: Text('S${data['semester']}', style: const TextStyle(color: Colors.white)),
                ),
                title: Text('Kartu Hasil Studi - Semester ${data['semester']}'),
                subtitle: Text('SKS Diambil: ${data['sks']} SKS'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('IPS: ${data['ips']}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                    const Text('LULUS', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
```
