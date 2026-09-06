# Dokumentasi Widget Responsif & Adaptif Flutter (Responsive & Adaptive Widgets)

Dokumentasi ini menyajikan referensi komprehensif implementasi **9 Komponen Responsif & Adaptif** dalam Flutter untuk menangani penyesuaian ukuran layar multi-perangkat (HP, Tablet, Desktop), orientasi layar, proteksi notch, serta fleksibilitas tata letak.

---

## 1. Daftar Dokumen Responsive & Adaptive Widgets

| No | Nama Widget | Fungsi Utama | Berkas Dokumentasi |
| :-: | :--- | :--- | :--- |
| 1 | **MediaQuery** | Informasi dimensi fisik layar dan inset sistem | [MediaQuery.md](MediaQuery.md) |
| 2 | **LayoutBuilder** | Pembangun tata letak berbasis batasan `BoxConstraints` | [LayoutBuilder.md](LayoutBuilder.md) |
| 3 | **OrientationBuilder** | Pembangun tata letak berbasis orientasi (*portrait/landscape*) | [OrientationBuilder.md](OrientationBuilder.md) |
| 4 | **SafeArea** | Pembungkus penghindar poni (*notch*) dan status bar | [SafeArea.md](SafeArea.md) |
| 5 | **FractionallySizedBox** | Ukuran dimensi fraksi proporsional relatif | [FractionallySizedBox.md](FractionallySizedBox.md) |
| 6 | **AspectRatio** | Pengunci rasio perbandingan lebar dibanding tinggi | [AspectRatio.md](AspectRatio.md) |
| 7 | **FittedBox** | Penyesuai skala dimensi otomatis (*scaling*) | [FittedBox.md](FittedBox.md) |
| 8 | **Expanded** | Pengisi sisa ruang kosong pada Row/Column | [Expanded.md](Expanded.md) |
| 9 | **Flexible** | Pengatur fleksibilitas dimensi anak pada Row/Column | [Flexible.md](Flexible.md) |

---

## 2. Struktur Generik Dokumen Widget
Setiap berkas dokumentasi `.md` disusun menggunakan 3 bagian standar berikut:
1. **Penjelasan Singkat & Fungsi**: Penjelasan peran dan fungsi utama adaptivitas.
2. **Tabel Atribut & Penggunaannya**: Pemetaan nama atribut, tipe data Dart, dan fungsi penggunaannya.
3. **Contoh Kode Flutter**:
   - **3.1 Contoh Kode Dasar (Basic Usage)**
   - **3.2 Contoh Kode Studi Kasus UI (Academic Mobile UI)**
