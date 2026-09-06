# Dokumentasi Widget Navigasi Flutter (Navigation Widgets & Classes)

Dokumentasi ini menyajikan referensi komprehensif implementasi **7 Komponen & Kelas Navigasi** dalam Flutter untuk menangani tumpukan halaman (*navigation stack*), rute transisi kustom, navigasi deklaratif Router API, serta pengiriman argumen data antar layar.

---

## 1. Daftar Dokumen Navigation Widgets

| No | Nama Widget / Kelas | Fungsi Utama | Berkas Dokumentasi |
| :-: | :--- | :--- | :--- |
| 1 | **Navigator** | Pengelola tumpukan navigasi halaman (stack LIFO) | [Navigator.md](Navigator.md) |
| 2 | **MaterialPageRoute** | Pengolah rute modal bawaan platform Material | [MaterialPageRoute.md](MaterialPageRoute.md) |
| 3 | **PageRouteBuilder** | Pembuat transisi animasi rute halaman kustom | [PageRouteBuilder.md](PageRouteBuilder.md) |
| 4 | **Hero** | Transisi animasi elemen visual terpaut antar rute | [Hero.md](Hero.md) |
| 5 | **Router** | Pengelola rute navigasi deklaratif (*Router API / Navigator 2.0*) | [Router.md](Router.md) |
| 6 | **Route** | Kelas representasi data dan status rute halaman | [Route.md](Route.md) |
| 7 | **ModalRoute** | Rute pemblokir navigasi & pengambil argumen data | [ModalRoute.md](ModalRoute.md) |

---

## 2. Struktur Generik Dokumen Widget
Setiap berkas dokumentasi `.md` disusun menggunakan 3 bagian standar berikut:
1. **Penjelasan Singkat & Fungsi**: Penjelasan peran dan fungsi utama navigasi.
2. **Tabel Atribut & Penggunaannya**: Pemetaan nama atribut, tipe data Dart, dan fungsi penggunaannya.
3. **Contoh Kode Flutter**:
   - **3.1 Contoh Kode Dasar (Basic Usage)**
   - **3.2 Contoh Kode Studi Kasus UI (Academic Mobile UI)**
