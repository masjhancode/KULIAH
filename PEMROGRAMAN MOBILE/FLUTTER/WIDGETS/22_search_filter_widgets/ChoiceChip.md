# Dokumentasi Widget: ChoiceChip

## 1. Deskripsi & Fungsi Modul

Widget `ChoiceChip` merupakan komponen tombol seleksi tunggal (*single-select chip*) pada Flutter yang digunakan untuk memilih satu opsi utama dari sekumpulan pilihan yang saling eksklusif (*radio button style chip*). Dalam Sistem Informasi Akademik (SIAKAD), widget ini digunakan untuk memilih status kehadiran presensi ("Hadir", "Izin", "Sakit", "Alpa") atau memilih status filter angkatan.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `label` | `Widget` | **(WAJIB)** Label teks deskripsi opsi (misal `Text('Hadir')`). |
| `selected` | `bool` | **(WAJIB)** Status boolean apakah opsi ini sedang terpilih (`true`). |
| `onSelected` | `ValueChanged<bool>?` | **(WAJIB)** Callback fungsi saat opsi ini ditekan pengguna. |
| `selectedColor` | `Color?` | Warna latar belakang tombol saat opsi aktif terpilih. |
| `disabledColor` | `Color?` | Warna latar belakang tombol saat opsi nonaktif. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicChoiceChipApp());
}

class BasicChoiceChipApp extends StatefulWidget {
  const BasicChoiceChipApp({super.key});

  @override
  State<BasicChoiceChipApp> createState() => _BasicChoiceChipAppState();
}

class _BasicChoiceChipAppState extends State<BasicChoiceChipApp> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic ChoiceChip')),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: const Text('Ganjil'),
                selected: _value == 1,
                onSelected: (bool selected) {
                  setState(() => _value = selected ? 1 : _value);
                },
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text('Genap'),
                selected: _value == 2,
                onSelected: (bool selected) {
                  setState(() => _value = selected ? 2 : _value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Input Status Presensi Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadChoiceChipApp());
}

class SiakadChoiceChipApp extends StatelessWidget {
  const SiakadChoiceChipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Presensi ChoiceChip SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const PresensiChoiceScreen(),
    );
  }
}

class PresensiChoiceScreen extends StatefulWidget {
  const PresensiChoiceScreen({super.key});

  @override
  State<PresensiChoiceScreen> createState() => _PresensiChoiceScreenState();
}

class _PresensiChoiceScreenState extends State<PresensiChoiceScreen> {
  String _selectedStatus = 'Hadir';
  final List<String> _statusOptions = ['Hadir', 'Izin', 'Sakit', 'Alpa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VERIFIKASI KEHADIRAN MAHASISWA'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ahmad Fauzi (2026090123)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Text('Mata Kuliah: Pemrograman Terintegrasi Sistem'),
            const SizedBox(height: 20),
            const Text('Pilih Status Kehadiran:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: _statusOptions.map((status) {
                final bool isSelected = _selectedStatus == status;
                return ChoiceChip(
                  label: Text(status),
                  selected: isSelected,
                  selectedColor: status == 'Hadir' ? Colors.green.shade200 : Colors.indigo.shade100,
                  onSelected: (bool selected) {
                    if (selected) {
                      setState(() {
                        _selectedStatus = status;
                      });
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Status presensi disimpan: $_selectedStatus'), backgroundColor: Colors.indigo),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white),
              child: const Text('Simpan Presensi'),
            ),
          ],
        ),
      ),
    );
  }
}
```
