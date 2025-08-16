# Tugas Praktek – Variabel & Tipe Data Dart

## Judul Tugas
**Aplikasi Penghitung Gaji Karyawan Sederhana**

## Deskripsi Kasus
Seorang karyawan ingin membuat program Dart untuk menghitung **gaji bersih** berdasarkan data karyawan berikut:

- Nama karyawan (`String`)
- Jumlah jam kerja dalam seminggu (`int`)
- Upah per jam (`double`)
- Status karyawan: tetap atau kontrak (`bool`, `true` = tetap, `false` = kontrak)

Program harus:

1. Menyimpan data karyawan menggunakan variabel dengan tipe data yang sesuai.
2. Menghitung gaji kotor:  
   ```dart
   gaji_kotor = jam_kerja * upah_per_jam
