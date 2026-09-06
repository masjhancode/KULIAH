# Dokumentasi Widget: BarChart (Grafik Batang)

## 1. Deskripsi & Fungsi Modul

Widget `BarChart` (Grafik Batang) merupakan komponen visualisasi data kuantitatif kategorikal dalam bentuk batang vertikal atau horizontal pada Flutter. Dalam Sistem Informasi Akademik (SIAKAD), grafik ini digunakan untuk menyajikan perbandingan perolehan SKS per semester, rekapitulasi jumlah mahasiswa per angkatan, serta perbandingan beban SKS dosen.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `barGroups` | `List<BarChartGroupData>` | **(WAJIB)** Daftar kelompok data batang yang akan dirender pada grafik. |
| `maxY` | `double` | Nilai ambang batas maksimum pada sumbu vertikal Y (misal: 24 SKS). |
| `minY` | `double` | Nilai ambang batas minimum pada sumbu vertikal Y (biasanya `0`). |
| `titlesData` | `FlTitlesData` | Konfigurasi teks label judul untuk sumbu atas, bawah (X), kiri (Y), dan kanan. |
| `gridData` | `FlGridData` | Mengatur garis latar kisi-kisi (*gridlines*) horizontal dan vertikal. |
| `barTouchData` | `BarTouchData` | Callback dan konfigurasi respon sentuhan serta tooltip saat batang diklik. |
| `borderData` | `FlBorderData` | Menentukan garis batas border di sekeliling area grafik. |
| `alignment` | `BarChartAlignment` | Menentukan penjajaran antar kelompok batang (`spaceAround`, `spaceBetween`, `spaceEvenly`). |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicBarChartApp());
}

class BasicBarChartApp extends StatelessWidget {
  const BasicBarChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> values = [18, 20, 22, 24, 21, 24];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic Bar Chart')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text('Rekap SKS per Semester', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Expanded(
                child: CustomPaint(
                  size: Size.infinite,
                  painter: SimpleBarChartPainter(values),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleBarChartPainter extends CustomPainter {
  final List<double> values;

  SimpleBarChartPainter(this.values);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      color = Colors.indigo
      ..style = PaintingStyle.fill;

    final double barWidth = size.width / (values.length * 2);
    final double maxVal = 24.0;

    for (int i = 0; i < values.length; i++) {
      final double barHeight = (values[i] / maxVal) * size.height;
      final double x = (i * 2 + 0.5) * barWidth;
      final double y = size.height - barHeight;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, barWidth, barHeight),
          const Radius.circular(6),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
```

### 4.2 Contoh Kode Studi Kasus UI (Dashboard Perolehan SKS Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadBarChartDashboardApp());
}

class SiakadBarChartDashboardApp extends StatelessWidget {
  const SiakadBarChartDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visualisasi SKS SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const SksBarChartScreen(),
    );
  }
}

class SksBarChartScreen extends StatelessWidget {
  const SksBarChartScreen({super.key});

  final List<SemesterSksData> _sksData = const [
    SemesterSksData(semester: 'Sem 1', sksWajib: 18, sksPilihan: 0),
    SemesterSksData(semester: 'Sem 2', sksWajib: 20, sksPilihan: 0),
    SemesterSksData(semester: 'Sem 3', sksWajib: 18, sksPilihan: 3),
    SemesterSksData(semester: 'Sem 4', sksWajib: 18, sksPilihan: 6),
    SemesterSksData(semester: 'Sem 5', sksWajib: 15, sksPilihan: 9),
    SemesterSksData(semester: 'Sem 6', sksWajib: 12, sksPilihan: 9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIAGRAM REKAPITULASI SKS AKADEMIK'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Perkembangan SKS Tempuh',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
                      ),
                      Chip(
                        label: Text('Total: 128 SKS'),
                        backgroundColor: Colors.indigoAccent,
                        labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('Berdasarkan Data Pelaporan PDDikti Semester 1 - 6'),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 250,
                    child: CustomPaint(
                      size: Size.infinite,
                      painter: SiakadBarChartPainter(_sksData),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLegendItem(Colors.indigo, 'SKS Wajib'),
                      const SizedBox(width: 20),
                      _buildLegendItem(Colors.amber.shade700, 'SKS Pilihan'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(width: 14, height: 14, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3))),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
      ],
    );
  }
}

class SemesterSksData {
  final String semester;
  final double sksWajib;
  final double sksPilihan;

  const SemesterSksData({
    required this.semester,
    required this.sksWajib,
    required this.sksPilihan,
  });
}

class SiakadBarChartPainter extends CustomPainter {
  final List<SemesterSksData> data;

  SiakadBarChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final double maxSks = 24.0;
    final double chartHeight = size.height - 30; // 30px for X axis labels
    final double groupWidth = size.width / data.length;
    final double barWidth = groupWidth * 0.3;

    final paintWajib = Paint()..color = Colors.indigo;
    final paintPilihan = Paint()..color = Colors.amber.shade700;
    final gridPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    // Draw background grid lines
    for (int i = 0; i <= 4; i++) {
      double y = chartHeight - (i * (chartHeight / 4));
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (int i = 0; i < data.length; i++) {
      double groupX = i * groupWidth;
      
      // SKS Wajib Bar
      double wajibHeight = (data[i].sksWajib / maxSks) * chartHeight;
      double wajibX = groupX + groupWidth * 0.15;
      double wajibY = chartHeight - wajibHeight;
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(wajibX, wajibY, barWidth, wajibHeight), const Radius.circular(4)),
        paintWajib,
      );

      // SKS Pilihan Bar
      double pilihanHeight = (data[i].sksPilihan / maxSks) * chartHeight;
      double pilihanX = wajibX + barWidth + 4;
      double pilihanY = chartHeight - pilihanHeight;
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(pilihanX, pilihanY, barWidth, pilihanHeight), const Radius.circular(4)),
        paintPilihan,
      );

      // Draw X axis Label (Semester)
      textPainter.text = TextSpan(
        text: data[i].semester,
        style: const TextStyle(color: Colors.black87, fontSize: 11, fontWeight: FontWeight.bold),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(groupX + (groupWidth - textPainter.width) / 2, chartHeight + 8));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
```
