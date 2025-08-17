# Tugas Praktek – Variabel & Tipe Data Dart

## Judul
**Program Sistem Penilaian Mahasiswa dengan Conditional Statement di Dart**

### Deskripsi

Anda diminta untuk membuat sebuah program sederhana menggunakan bahasa Dart yang dapat menentukan nilai akhir mahasiswa dalam bentuk huruf **(grade)** berdasarkan skor ujian yang diperoleh. Program harus memanfaatkan conditional statement **(if-else atau switch-case)** untuk melakukan pengelompokan nilai.

Program akan menerima input berupa skor numerik **(rentang 0 – 100)**, lalu mengeluarkan output berupa grade huruf sesuai aturan berikut:

- Skor 85 – 100 → A
- Skor 70 – 84 → B
- Skor 60 – 69 → C
- Skor 50 – 59 → D
- Skor < 50 → E

### Ketentuan Pengerjaan
1. Input skor dimasukkan oleh pengguna (user input).
2. Validasi input harus dilakukan (nilai tidak boleh kurang dari 0 atau lebih dari 100). Jika input tidak valid, tampilkan pesan error.
3. Gunakan salah satu dari dua cara:
    3.1. if-else statement, atau
    3.2. switch-case statement.

### Output harus menampilkan pesan dengan format:
- Skor Anda: 75
- Grade Anda: B

Program harus rapi, menggunakan nama variabel yang sesuai, dan diberi komentar singkat untuk menjelaskan logika.

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