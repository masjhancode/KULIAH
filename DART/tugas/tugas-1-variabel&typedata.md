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
   gaji_kotor = jam_kerja * upah_per_jam ```
3. Jika karyawan tetap (true), potong 10% untuk pajak, jika kontrak (false) potong 5%.
4. Menampilkan nama karyawan, gaji kotor, pajak, dan gaji bersih.

Selain itu, mahasiswa wajib menggunakan Git & GitHub untuk mengupload tugas yang suda dikerjakan:
1. Membuat repository baru dengan nama : Tugas 1 - Variabel dan Tipe Data Dart
2. Commit setiap perubahan besar
3. Push ke repository GitHub