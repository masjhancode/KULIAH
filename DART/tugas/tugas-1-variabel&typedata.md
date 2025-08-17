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
3. Push ke repository GitHub.

## Ketentuan Pengumpulan Tugas di GitHub
1. Pembuatan Repository
   - Setiap mahasiswa wajib membuat repository baru di akun GitHub masing-masing dengan nama
   ```pemrograman-mobile-tugas-conditional-nama-nim```
   - Repository bersifat public agar dosen bisa melakukan pengecekan
2. Struktur Folder & File.
   - Semua file tugas disimpan dalam folder utama dengan struktur berikut
   ```
      ├── src/
      │   └── tugas.dart
      ├── README.md
      ```
   - File **README.md** harus berisi:
      - Identitas mahasiswa (Nama & NIM)
      - Deskripsi singkat program
      - Instruksi cara menjalankan program
3. Commit & Push
   - Mahasiswa wajib melakukan commit dengan pesan yang jelas
   - Contoh pesan commit:
   ```Menambahkan program Sistem Penilaian Mahasiswa Memperbaiki validasi input```
   - Setelah selesai, push ke repository GitHub masing-masing
4. Pengumpulan Tautan Repository
   - Mahasiswa mengumpulkan link repository GitHub melalui Virtual Class Unkhair
     ```Contoh link : https://github.com/username/pemrograman-mobile-tugas-conditional-nama-nim```
