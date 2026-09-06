# Dokumentasi Widget: CustomPaint & CustomPainter

## 1. Deskripsi & Fungsi Modul

Widget `CustomPaint` (bersama kelas `CustomPainter`) merupakan modul kanvas melukis tingkat rendah (*low-level 2D graphics canvas*) pada Flutter. Melalui metode `paint(Canvas canvas, Size size)`, pengembang dapat menggambar garis vector, kurva, lingkaran, serta pola bebas menggunakan objek `Paint`. Dalam Sistem Informasi Akademik (SIAKAD), `CustomPaint` digunakan untuk menangkap **Tanda Tangan Digital Dosen PA / Penguji Sidang**, menggambar denah tempat duduk ruang ujian, serta merender visualisasi grafik radar kompetensi lulusan.

### 1.1 Aktor Pengguna
1. **Dosen Pembimbing / Penguji**: Membubuhi tanda tangan digital langsung di layar sentuh hp/tablet pada lembar persetujuan skripsi.
2. **Administrator Akademik**: Menyiapkan templat formulir digital legalitas kampus.
3. **Mahasiswa**: Melihat tanda tangan digital resmi pengesahan pada KHS atau Surat Bebas Pustaka.

### 1.2 Referensi Regulasi
1. **UU ITE No. 11 Tahun 2008 & PP No. 71 Tahun 2019**:
   - Keabsahan dan kekuatan hukum tanda tangan elektronik (*digital signature*) pada dokumen publik.
2. **UU No. 12 Tahun 2012 tentang Pendidikan Tinggi (UU Dikti)**:
   - *Pasal 35*: Akuntabilitas pengesahan dokumen administrasi hasil belajar mahasiswa.
3. **Permendikbudristek No. 53 Tahun 2023**:
   - Legalitas verifikasi berkas kelulusan dan berita acara ujian sidang secara elektronik.

---

## 2. Alur Proses & Kebutuhan Fungsional

### 2.1 Alur Proses Penorehan Tanda Tangan Digital
1. Dosen membuka modal dialog pengesahan dokumen pada aplikasi SIAKAD Mobile.
2. Saat jari/stylus digeser pada area kanvas `CustomPaint`, koordinat `Offset` ditangkap via gestur `GestureDetector`.
3. `CustomPainter` mengeksekusi metode `canvas.drawLine()` untuk menggambar vektor garis tanda tangan secara *real-time*.
4. Hasil goresan tanda tangan dienkripsi dan disimpan sebagai berkas gambar PNG transparansi tinggi.

### 2.2 Kebutuhan Fungsional

| ID Kebutuhan | Deskripsi Kebutuhan Fungsional | Label Prioritas |
| :--- | :--- | :--- |
| **REQ-CPT-01** | Sistem **WAJIB** menyediakan kanvas melukis yang merespons goresan sentuhan secara *real-time*. | `[WAJIB]` |
| **REQ-CPT-02** | Sistem **WAJIB** menyediakan fungsi pembersih (*reset/clear*) untuk menghapus goresan tanda tangan jika terjadi kesalahan. | `[WAJIB]` |
| **REQ-CPT-03** | Sistem **SEHARUSNYA** mengonversi koordinat vektor goresan menjadi objek gambar PNG transparan. | `[SEHARUSNYA]` |
| **REQ-CPT-04** | Sistem **DAPAT** memberikan pilihan ketebalan garis stroke pen (*strokeWidth*) dan warna tinta pen. | `[DAPAT]` |

---

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `painter` | `CustomPainter?` | **(WAJIB)** Objek turunan `CustomPainter` yang menangani prosedur penggambaran di kanvas latar depan. |
| `foregroundPainter` | `CustomPainter?` | Objek turunan `CustomPainter` yang menggambar di atas widget `child`. |
| `size` | `Size` | Ukuran dimensi luas wilayah kanvas melukis. |
| `child` | `Widget?` | Widget anak yang berada di bawah lapisan kanvas `CustomPaint`. |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicCustomPaintApp());
}

class BasicCustomPaintApp extends StatelessWidget {
  const BasicCustomPaintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic CustomPaint')),
        body: Center(
          child: CustomPaint(
            size: const Size(200, 200),
            painter: CirclePainter(),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      color = Colors.indigo
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 80, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
```

### 4.2 Contoh Kode Studi Kasus UI (Kanvas Tanda Tangan Digital Dosen SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadSignatureApp());
}

class SiakadSignatureApp extends StatelessWidget {
  const SiakadSignatureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tanda Tangan SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const SignatureScreen(),
    );
  }
}

class SignatureScreen extends StatefulWidget {
  const SignatureScreen({super.key});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final List<Offset?> _points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PENGESAHAN TANDA TANGAN DOSEN'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() => _points.clear()),
            tooltip: 'Hapus Goresan',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dokumen: Berita Acara Ujian Sidang Skripsi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Text('Dosen Penguji: Dr. Eng. Ir. Hendra, M.T.'),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.indigo, width: 2),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: GestureDetector(
                  onPanUpdate: (DragUpdateDetails details) {
                    RenderBox renderBox = context.findRenderObject() as RenderBox;
                    setState(() {
                      _points.add(renderBox.globalToLocal(details.globalPosition));
                    });
                  },
                  onPanEnd: (DragEndDetails details) {
                    _points.add(null);
                  },
                  child: CustomPaint(
                    painter: SignaturePainter(_points),
                    size: Size.infinite,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tanda tangan digital berhasil disimpan!'), backgroundColor: Colors.green),
                );
              },
              icon: const Icon(Icons.check),
              label: const Text('Simpan & Sahkan Berita Acara'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  final List<Offset?> points;

  SignaturePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.indigo.shade900
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3.5;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) => oldDelegate.points != points;
}
```
