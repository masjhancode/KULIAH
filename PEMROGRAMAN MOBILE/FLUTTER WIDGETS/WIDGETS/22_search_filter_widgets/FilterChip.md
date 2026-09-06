# Dokumentasi Widget: FilterChip

## 1. Deskripsi & Fungsi Modul

Widget `FilterChip` merupakan komponen penyaring data berbentuk tombol kapsul (*chip*) pada Flutter yang mendukung seleksi multi-pilihan (*multi-select*). Widget ini digunakan untuk mengaktifkan atau menonaktifkan kriteria penyaringan data akademik dalam tampilan daftar (seperti filter berdasarkan Semester, Rumpun Keahlian, atau Status Kehadiran).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `label` | `Widget` | **(WAJIB)** Widget label teks deskripsi opsi filter (misal `Text('Semester 4')`). |
| `selected` | `bool` | **(WAJIB)** Status boolean apakah tombol filter sedang aktif/tercentang atau tidak. |
| `onSelected` | `ValueChanged<bool>?` | **(WAJIB)** Callback fungsi saat status tombol filter diubah oleh pengguna. |
| `avatar` | `Widget?` | Widget ikon tambahan di sisi kiri label teks (misal ikon tanda centang). |
| `selectedColor` | `Color?` | Warna latar belakang tombol filter saat statusnya terpilih (`true`). |
| `checkmarkColor` | `Color?` | Warna ikon tanda centang indikator seleksi. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicFilterChipApp());
}

class BasicFilterChipApp extends StatefulWidget {
  const BasicFilterChipApp({super.key});

  @override
  State<BasicFilterChipApp> createState() => _BasicFilterChipAppState();
}

class _BasicFilterChipAppState extends State<BasicFilterChipApp> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic FilterChip')),
        body: Center(
          child: FilterChip(
            label: const Text('Mata Kuliah Wajib'),
            selected: _isSelected,
            onSelected: (bool selected) {
              setState(() {
                _isSelected = selected;
              });
            },
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Filter Multi-Kategori Jadwal Kuliah SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadFilterChipApp());
}

class SiakadFilterChipApp extends StatelessWidget {
  const SiakadFilterChipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filter SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const FilterJadwalScreen(),
    );
  }
}

class FilterJadwalScreen extends StatefulWidget {
  const FilterJadwalScreen({super.key});

  @override
  State<FilterJadwalScreen> createState() => _FilterJadwalScreenState();
}

class _FilterJadwalScreenState extends State<FilterJadwalScreen> {
  final List<String> _filters = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat'];
  final Set<String> _selectedFilters = {'Senin'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PENYARINGAN JADWAL KULIAH'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pilih Hari Perkuliahan:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8.0,
              children: _filters.map((hari) {
                final bool isSelected = _selectedFilters.contains(hari);
                return FilterChip(
                  label: Text(hari),
                  selected: isSelected,
                  selectedColor: Colors.indigo.shade100,
                  checkmarkColor: Colors.indigo,
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        _selectedFilters.add(hari);
                      } else {
                        _selectedFilters.remove(hari);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const Divider(height: 32),
            Text('Hari Terpilih: ${_selectedFilters.join(', ')}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
          ],
        ),
      ),
    );
  }
}
```
