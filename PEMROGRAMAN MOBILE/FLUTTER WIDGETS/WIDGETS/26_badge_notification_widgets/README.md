# Dokumentasi Widget Badge, Notification & Banner Flutter

Dokumentasi ini menyajikan referensi komprehensif implementasi **3 Modul Widget Badge, Notification & Banner** dalam kerangka kerja Flutter untuk mengelola lencana penanda notifikasi pesan bimbingan, spanduk pengumuman pembayaran UKT persisten, serta petunjuk teks melayang dalam Sistem Informasi Akademik (SIAKAD).

---

## 1. Deskripsi Modul & Konsolidasi Regulasi Pendidikan Tinggi

Modul widget *Badge, Notification & Banner* ini dikembangkan untuk mendukung ketepatan penyampaian informasi penting perguruan tinggi sesuai regulasi:
1. **UU No. 12 Tahun 2012 tentang Pendidikan Tinggi (UU Dikti)**: Transparansi pengumuman jadwal dan akuntabilitas penyampaian informasi akademik (Pasal 35).
2. **Permendikbudristek No. 53 Tahun 2023 tentang Penjaminan Mutu Pendidikan Tinggi**: Kepastian keterampaian pemberitahuan penting terkait evaluasi studi dan pembayaran UKT.
3. **Standar PDDikti & BAN-PT**: Kemudahan aksesibilitas informasi akademik darurat.

---

## 2. Daftar Berkas Dokumen Badge Widgets

| No | Nama Berkas Dokumen | Nama Widget / Tipe | Peran Utama & Penggunaan Akademik SIAKAD |
| :-: | :--- | :--- | :--- |
| 1 | **[Badge.md](Badge.md)** | `Badge` | Lencana penanda angka notifikasi pesan bimbingan skripsi baru. |
| 2 | **[MaterialBanner.md](MaterialBanner.md)** | `MaterialBanner` | Spanduk pengumuman persisten untuk pemberitahuan perpanjangan pembayaran UKT. |
| 3 | **[Tooltip.md](Tooltip.md)** | `Tooltip` | Petunjuk teks melayang untuk memberikan bantuan pada tombol ikon cetak KHS. |

---

## 3. Pemetaan Aktor & Kebutuhan Fungsional

### 3.1 Pemetaan Aktor Pengguna

| Modul Badge Widgets | Mahasiswa | Dosen PA | Admin Kampus | Assessor BAN-PT |
| :--- | :-: | :-: | :-: | :-: |
| `Badge` | **✓** | **✓** | **✓** | - |
| `MaterialBanner` | **✓** | **✓** | **✓** | - |
| `Tooltip` | **✓** | **✓** | **✓** | - |

### 3.2 Matriks Kebutuhan Fungsional

| ID Kebutuhan | Deskripsi Kebutuhan Fungsional | Label Prioritas |
| :--- | :--- | :--- |
| **REQ-BDG-SYS-01** | Sistem **WAJIB** merender lencana penanda angka notifikasi secara akurat di atas ikon target. | `[WAJIB]` |
| **REQ-BDG-SYS-02** | Sistem **WAJIB** menayangkan spanduk pengumuman persisten `MaterialBanner` hingga ditutup oleh pengguna. | `[WAJIB]` |
| **REQ-BDG-SYS-03** | Sistem **SEHARUSNYA** memberikan teks petunjuk `Tooltip` saat tombol ikon ditekan lama (*long-press*). | `[SEHARUSNYA]` |
| **REQ-BDG-SYS-04** | Sistem **DAPAT** mengizinkan pemicuan tindakan navigasi langsung dari tombol aksi banner pengumuman. | `[DAPAT]` |

---

## 4. Struktur Generik Dokumen Widget

Setiap berkas dokumentasi `.md` di dalam folder ini disusun secara konsisten mengikuti struktur hierarki berikut:
1. **Deskripsi & Fungsi Modul**: Menguraikan latar belakang widget dan peran antarmukanya pada aplikasi Flutter.
2. **Tabel Atribut & Penggunaannya**: Pemetaan detail nama atribut Dart, tipe data, serta penjelasan fungsi pengaplikasiannya.
3. **Contoh Kode Flutter**:
   - **3.1 Contoh Kode Dasar (Basic Usage)**
   - **3.2 Contoh Kode Studi Kasus UI Akademik SIAKAD** (Aplikasi runnable siap pakai bertema lencana notifikasi, banner UKT, dan tooltip cetak KHS).
