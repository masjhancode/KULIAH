# Dokumentasi Widget: PieChart (Grafik Lingkaran & Donut)

## 1. Deskripsi & Fungsi Modul

Widget `PieChart` (Grafik Lingkaran & Donut) merupakan komponen visualisasi data proporsional yang membagi lingkaran menjadi sektor-sektor busur (*sections/wedges*) sesuai dengan persentase kontribusi relatif data. Dalam Sistem Informasi Akademik (SIAKAD), grafik ini digunakan untuk menyajikan distribusi perolehan nilai mutu mata kuliah (A, B, C, D, E), sebaran persentase kelulusan tepat waktu, dan porsi alokasi jenis SKS.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `sections` | `List<PieChartSectionData>` | **(WAJIB)** Daftar bagian busur lingkaran yang menentukan nilai, warna, radius, dan label teks. |
| `centerSpaceRadius` | `double` | Jari-jari ruang kosong di tengah grafik (diisi nilai `> 0` untuk membuat Donut Chart). |
| `centerSpaceColor` | `Color?` | Warna latar belakang area lingkaran tengah Donut Chart. |
| `sectionsSpace` | `double` | Jarak celah spasi di antara sektor-sektor busur lingkaran. |
| `startDegreeOffset` | `double` | Sudut rotasi awal pembuatan sektor busur grafik (default: `0.0` derajat). |
| `pieTouchData` | `PieTouchData` | Callback dan efek animasi pembesaran sektor saat disentuh oleh pengguna. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const BasicPieChartApp());
}

class BasicPieChartApp extends StatelessWidget {
  const BasicPieChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PieSliceData> slices = [
      PieSliceData(value: 40, color: Colors.green, label: 'A'),
      PieSliceData(value: 35, color: Colors.blue, label: 'B'),
      PieSliceData(value: 15, color: Colors.orange, label: 'C'),
      PieSliceData(value: 10, color: Colors.red, label: 'D'),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic Pie Chart')),
        body: Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: CustomPaint(
              painter: SimplePiePainter(slices),
            ),
          ),
        ),
      ),
    );
  }
}

class PieSliceData {
  final double value;
  final Color color;
  final String label;

  PieSliceData({required this.value, required this.color, required this.label});
}

class SimplePiePainter extends CustomPainter {
  final List<PieSliceData> slices;

  SimplePiePainter(this.slices);

  @override
  void paint(Canvas canvas, Size size) {
    final double total = slices.fold(0, (sum, item) => sum + item.value);
    double startAngle = -pi / 2;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    for (var slice in slices) {
      final double sweepAngle = (slice.value / total) * 2 * pi;
      final paint = Paint()
        ..color = slice.color
        ..style = PaintingStyle.fill;

      canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
```

### 4.2 Contoh Kode Studi Kasus UI (Distribusi Mutu Nilai Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const SiakadPieChartApp());
}

class SiakadPieChartApp extends StatelessWidget {
  const SiakadPieChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Distribusi Nilai SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const NilaiPieChartDashboard(),
    );
  }
}

class NilaiPieChartDashboard extends StatelessWidget {
  const NilaiPieChartDashboard({super.key});

  final List<GradeItem> _grades = const [
    GradeItem(grade: 'Sangat Memuaskan (A)', count: 48, percentage: '60%', color: Colors.green),
    GradeItem(grade: 'Memuaskan (B)', count: 24, percentage: '30%', color: Colors.blue),
    GradeItem(grade: 'Cukup (C)', count: 6, percentage: '7.5%', color: Colors.amber),
    GradeItem(grade: 'Kurang (D/E)', count: 2, percentage: '2.5%', color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DISTRIBUSI MUTU NILAI LULUS'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'Proporsi Mutu Matakuliah Selesai',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                  const SizedBox(height: 4),
                  const Text('Total: 80 Matakuliah (110 SKS Lulus)'),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 220,
                    height: 220,
                    child: CustomPaint(
                      painter: DonutChartPainter(_grades),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: _grades.map((item) => _buildGradeTile(item)).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradeTile(GradeItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(color: item.color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              Text(item.grade, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          Text(
            '${item.count} MK (${item.percentage})',
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

class GradeItem {
  final String grade;
  final double count;
  final String percentage;
  final Color color;

  const GradeItem({
    required this.grade,
    required this.count,
    required this.percentage,
    required this.color,
  });
}

class DonutChartPainter extends CustomPainter {
  final List<GradeItem> items;

  DonutChartPainter(this.items);

  @override
  void paint(Canvas canvas, Size size) {
    final double total = items.fold(0, (sum, item) => sum + item.count);
    double startAngle = -pi / 2;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    final strokeWidth = radius * 0.45; // Make donut style

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    for (var item in items) {
      final double sweepAngle = (item.count / total) * 2 * pi;
      paint.color = item.color;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      startAngle += sweepAngle;
    }

    // Render Text in Center of Donut
    final TextPainter textPainter = TextPainter(
      text: const TextSpan(
        text: 'IPK 3.68\nSangat Baik',
        style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: 14, height: 1.2),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(center.dx - (textPainter.width / 2), center.dy - (textPainter.height / 2)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
```
