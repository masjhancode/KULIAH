# Dokumentasi Widget: LineChart (Grafik Garis)

## 1. Deskripsi & Fungsi Modul

Widget `LineChart` (Grafik Garis) merupakan komponen visualisasi data kontinu bertingkat (*time series data*) yang menghubungkan titik-titik nilai koordinat menggunakan segmen garis lurus atau kurva halus. Dalam Sistem Informasi Akademik (SIAKAD), grafik ini digunakan untuk memantau tren perkembangan Indeks Prestasi Semester (IPS) dan Indeks Prestasi Kumulatif (IPK) mahasiswa dari semester ke semester.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `lineBarsData` | `List<LineChartBarData>` | **(WAJIB)** Daftar rincian data kurva garis yang berisi himpunan titik `FlSpot(x, y)`. |
| `minY` / `maxY` | `double` | Rentang nilai batas minimum dan maksimum sumbu Y (misal: `0.0` sampai `4.0`). |
| `isCurved` | `bool` | Menentukan apakah garis grafik berbentuk kurva mulus (*smooth bezier*) atau garis lurus patah. |
| `barWidth` | `double` | Ketebalan ketebalan garis grafik dalam satuan piksel. |
| `belowBarData` | `BarAreaData` | Mengatur warna isian gradien (*fill gradient*) di bawah garis grafik. |
| `dotData` | `FlDotData` | Mengatur tampilan titik lingkaran penanda (*dots*) pada tiap titik koordinat data. |
| `titlesData` | `FlTitlesData` | Konfigurasi teks label judul untuk sumbu horizontal (X) dan vertikal (Y). |
| `lineTouchData` | `LineTouchData` | Pengaturan efek interaktif dan tooltip pop-up data saat titik grafik disentuh. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicLineChartApp());
}

class BasicLineChartApp extends StatelessWidget {
  const BasicLineChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Offset> points = const [
      Offset(1, 3.20),
      Offset(2, 3.45),
      Offset(3, 3.30),
      Offset(4, 3.65),
      Offset(5, 3.80),
      Offset(6, 3.85),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic Line Chart')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text('Tren IPK Mahasiswa', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Expanded(
                child: CustomPaint(
                  size: Size.infinite,
                  painter: SimpleLinePainter(points),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleLinePainter extends CustomPainter {
  final List<Offset> points;

  SimpleLinePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..color = Colors.indigo
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final paintDot = Paint()
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.fill;

    final Path path = Path();
    final double maxY = 4.0;
    final double stepX = size.width / (points.length + 1);

    for (int i = 0; i < points.length; i++) {
      double x = (i + 1) * stepX;
      double y = size.height - ((points[i].dy / maxY) * size.height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      canvas.drawCircle(Offset(x, y), 5, paintDot);
    }

    canvas.drawPath(path, paintLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
```

### 4.2 Contoh Kode Studi Kasus UI (Tren Evaluasi IPK Mahasiswa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadIpkLineChartApp());
}

class SiakadIpkLineChartApp extends StatelessWidget {
  const SiakadIpkLineChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grafik Tren IPK SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const IpkLineChartDashboard(),
    );
  }
}

class IpkLineChartDashboard extends StatelessWidget {
  const IpkLineChartDashboard({super.key});

  final List<IpkRecord> _records = const [
    IpkRecord(semester: 'Sem 1', ips: 3.25, ipk: 3.25),
    IpkRecord(semester: 'Sem 2', ips: 3.50, ipk: 3.38),
    IpkRecord(semester: 'Sem 3', ips: 3.60, ipk: 3.45),
    IpkRecord(semester: 'Sem 4', ips: 3.80, ipk: 3.54),
    IpkRecord(semester: 'Sem 5', ips: 3.90, ipk: 3.61),
    IpkRecord(semester: 'Sem 6', ips: 4.00, ipk: 3.68),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIAGRAM TREN IPK & IPS MAHASISWA'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Perkembangan Performa Akademik', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo)),
                          Text('Ahmad Fauzi (2026090123)', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Chip(
                        avatar: Icon(Icons.star, color: Colors.amber, size: 18),
                        label: Text('IPK: 3.68', style: TextStyle(fontWeight: FontWeight.bold)),
                        backgroundColor: Colors.indigoAccent,
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 240,
                    child: CustomPaint(
                      size: Size.infinite,
                      painter: SiakadIpkLinePainter(_records),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLegend(Colors.indigo, 'Indeks Prestasi Kumulatif (IPK)'),
                      const SizedBox(width: 20),
                      _buildLegend(Colors.amber.shade700, 'Indeks Prestasi Semester (IPS)'),
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

  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
      ],
    );
  }
}

class IpkRecord {
  final String semester;
  final double ips;
  final double ipk;

  const IpkRecord({
    required this.semester,
    required this.ips,
    required this.ipk,
  });
}

class SiakadIpkLinePainter extends CustomPainter {
  final List<IpkRecord> records;

  SiakadIpkLinePainter(this.records);

  @override
  void paint(Canvas canvas, Size size) {
    final double chartHeight = size.height - 30;
    final double stepX = size.width / (records.length - 0.5);
    final double maxY = 4.0;
    final double minY = 2.0; // Scale starting from 2.00 for zoom effect

    final gridPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 1;

    // Draw Y axis Grid Lines
    for (int i = 0; i <= 4; i++) {
      double val = minY + (i * (maxY - minY) / 4);
      double y = chartHeight - (i * (chartHeight / 4));
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final pathIpk = Path();
    final pathIps = Path();

    final paintIpk = Paint()
      ..color = Colors.indigo
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke;

    final paintIps = Paint()
      ..color = Colors.amber.shade700
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    final dotPaintIpk = Paint()..color = Colors.indigo;
    final dotPaintIps = Paint()..color = Colors.amber.shade700;

    final TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (int i = 0; i < records.length; i++) {
      double x = (i + 0.3) * stepX;

      double yIpk = chartHeight - (((records[i].ipk - minY) / (maxY - minY)) * chartHeight);
      double yIps = chartHeight - (((records[i].ips - minY) / (maxY - minY)) * chartHeight);

      if (i == 0) {
        pathIpk.moveTo(x, yIpk);
        pathIps.moveTo(x, yIps);
      } else {
        pathIpk.lineTo(x, yIpk);
        pathIps.lineTo(x, yIps);
      }

      canvas.drawCircle(Offset(x, yIpk), 5, dotPaintIpk);
      canvas.drawCircle(Offset(x, yIps), 4, dotPaintIps);

      // Render X labels
      textPainter.text = TextSpan(
        text: records[i].semester,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black87),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x - (textPainter.width / 2), chartHeight + 8));
    }

    canvas.drawPath(pathIps, paintIps);
    canvas.drawPath(pathIpk, paintIpk);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
```
