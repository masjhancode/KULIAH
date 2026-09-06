# Dokumentasi Widget: CustomPaintChart (Diagram Grafis Custom Canvas)

## 1. Deskripsi & Fungsi Modul

Widget `CustomPaintChart` memanfaatkan widget `CustomPaint` dan kelas `CustomPainter` pada Flutter untuk merender grafik data kustom tingkat lanjut secara langsung ke atas layar melalui antarmuka `Canvas` 2D. Dalam Sistem Informasi Akademik (SIAKAD), widget ini digunakan untuk merender grafik jaring (*Radar/Spider Chart*) guna memvisualisasikan Capaian Pembelajaran Lulusan (CPL), kompetensi akademik, serta visualisasi radar akreditasi BAN-PT.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `painter` | `CustomPainter?` | **(WAJIB)** Objek turunan `CustomPainter` yang mendefinisikan instruksi menggambar garis/grafik pada Canvas. |
| `foregroundPainter` | `CustomPainter?` | Objek painter opsional yang dirender di atas elemen anak (`child`). |
| `size` | `Size` | Ukuran dimensi kanvas area grafik (misal: `Size(300, 300)`). |
| `isComplex` | `bool` | Petunjuk mengoptimalkan performa penggambaran kanvas kompleks yang membutuhkan caching. |
| `willChange` | `bool` | Petunjuk optimasi bahwa lukisan kanvas akan berubah pada frame berikutnya. |
| `child` | `Widget?` | Widget turunan opsional yang ditempatkan di bawah lukisan `painter`. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicCustomPaintChartApp());
}

class BasicCustomPaintChartApp extends StatelessWidget {
  const BasicCustomPaintChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic CustomPaint Chart')),
        body: Center(
          child: CustomPaint(
            size: const Size(200, 200),
            painter: SimpleCircleProgressPainter(0.75),
          ),
        ),
      ),
    );
  }
}

class SimpleCircleProgressPainter extends CustomPainter {
  final double percentage;

  SimpleCircleProgressPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = Colors.indigo
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, bgPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.57, // Start top
      6.28 * percentage,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
```

### 4.2 Contoh Kode Studi Kasus UI (Radar Chart Capaian Pembelajaran Lulusan CPL SIAKAD)

```dart
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const SiakadRadarChartApp());
}

class SiakadRadarChartApp extends StatelessWidget {
  const SiakadRadarChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radar CPL SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const CplRadarChartDashboard(),
    );
  }
}

class CplRadarChartDashboard extends StatelessWidget {
  const CplRadarChartDashboard({super.key});

  final List<CplIndicator> _cplData = const [
    CplIndicator(label: 'Sikap & Etika', score: 0.90),
    CplIndicator(label: 'Pengetahuan Dasar', score: 0.85),
    CplIndicator(label: 'Pemrograman', score: 0.95),
    CplIndicator(label: 'Analisis Sistem', score: 0.80),
    CplIndicator(label: 'Kerja Sama Tim', score: 0.88),
    CplIndicator(label: 'Komunikasi', score: 0.78),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIAGRAM RADAR CPL LULUSAN'),
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
                    'Evaluasi Capaian Pembelajaran (CPL)',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                  const SizedBox(height: 4),
                  const Text('Kurikulum MBKM Prodi Teknik Informatika'),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 280,
                    height: 280,
                    child: CustomPaint(
                      painter: CplRadarChartPainter(_cplData),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Rata-rata Skor CPL: 86.0% (Kategori Sangat Baik)',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CplIndicator {
  final String label;
  final double score; // Range 0.0 to 1.0

  const CplIndicator({required this.label, required this.score});
}

class CplRadarChartPainter extends CustomPainter {
  final List<CplIndicator> indicators;

  CplRadarChartPainter(this.indicators);

  @override
  void paint(Canvas canvas, Size size) {
    final int numAxes = indicators.length;
    final center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2.6;
    final double angleStep = (2 * pi) / numAxes;

    final gridPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final axisPaint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final fillPaint = Paint()
      ..color = Colors.indigo.withOpacity(0.35)
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = Colors.indigo
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    // 1. Draw Concentric Polygons (Grid 20%, 40%, 60%, 80%, 100%)
    for (int level = 1; level <= 5; level++) {
      double levelRadius = (level / 5.0) * radius;
      Path gridPath = Path();
      for (int i = 0; i < numAxes; i++) {
        double angle = i * angleStep - pi / 2;
        double x = center.dx + levelRadius * cos(angle);
        double y = center.dy + levelRadius * sin(angle);
        if (i == 0) {
          gridPath.moveTo(x, y);
        } else {
          gridPath.lineTo(x, y);
        }
      }
      gridPath.close();
      canvas.drawPath(gridPath, gridPaint);
    }

    // 2. Draw Radial Axis Lines & Labels
    final TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (int i = 0; i < numAxes; i++) {
      double angle = i * angleStep - pi / 2;
      double x = center.dx + radius * cos(angle);
      double y = center.dy + radius * sin(angle);
      canvas.drawLine(center, Offset(x, y), axisPaint);

      // Draw Label Outside
      double labelX = center.dx + (radius + 22) * cos(angle);
      double labelY = center.dy + (radius + 16) * sin(angle);

      textPainter.text = TextSpan(
        text: indicators[i].label,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(labelX - textPainter.width / 2, labelY - textPainter.height / 2),
      );
    }

    // 3. Draw CPL Value Polygon
    Path valPath = Path();
    for (int i = 0; i < numAxes; i++) {
      double angle = i * angleStep - pi / 2;
      double valRadius = indicators[i].score * radius;
      double x = center.dx + valRadius * cos(angle);
      double y = center.dy + valRadius * sin(angle);

      if (i == 0) {
        valPath.moveTo(x, y);
      } else {
        valPath.lineTo(x, y);
      }
      canvas.drawCircle(Offset(x, y), 4, Paint()..color = Colors.indigo);
    }
    valPath.close();

    canvas.drawPath(valPath, fillPaint);
    canvas.drawPath(valPath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
```
