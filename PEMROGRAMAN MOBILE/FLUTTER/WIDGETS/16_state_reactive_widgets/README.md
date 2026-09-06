# Dokumentasi Widget State & Reaktif Flutter (State & Reactive Widgets)

Dokumentasi ini menyajikan referensi komprehensif implementasi **6 Komponen State & Reaktif** dalam Flutter untuk menangani manajemen status lokal, perenderan berbasis `Future` & `Stream`, serta optimasi rebuild widget reaktif.

---

## 1. Daftar Dokumen State & Reactive Widgets

| No | Nama Widget | Fungsi Utama | Berkas Dokumentasi |
| :-: | :--- | :--- | :--- |
| 1 | **StatefulBuilder** | Manajemen status (*state*) lokal terisolasi | [StatefulBuilder.md](StatefulBuilder.md) |
| 2 | **ValueListenableBuilder** | Rebuild khusus berbasis pendengar `ValueNotifier` | [ValueListenableBuilder.md](ValueListenableBuilder.md) |
| 3 | **AnimatedBuilder** | Rebuild khusus terisolasi animasi `Listenable` | [AnimatedBuilder.md](AnimatedBuilder.md) |
| 4 | **FutureBuilder** | Perender antarmuka dinamis berbasis tugas `Future` (API) | [FutureBuilder.md](FutureBuilder.md) |
| 5 | **StreamBuilder** | Perender reaktif aliran data berkesinambungan `Stream` | [StreamBuilder.md](StreamBuilder.md) |
| 6 | **ListenableBuilder** | Perender reaktif terisolasi pendengar `ChangeNotifier` | [ListenableBuilder.md](ListenableBuilder.md) |

---

## 2. Struktur Generik Dokumen Widget
Setiap berkas dokumentasi `.md` disusun menggunakan 3 bagian standar berikut:
1. **Penjelasan Singkat & Fungsi**: Penjelasan peran dan fungsi utama manajemen state/reaktif.
2. **Tabel Atribut & Penggunaannya**: Pemetaan nama atribut, tipe data Dart, dan fungsi penggunaannya.
3. **Contoh Kode Flutter**:
   - **3.1 Contoh Kode Dasar (Basic Usage)**
   - **3.2 Contoh Kode Studi Kasus UI (Academic Mobile UI)**
