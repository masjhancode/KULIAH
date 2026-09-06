# Dokumentasi Widget Gestur Flutter (Gesture Widgets)

Dokumentasi ini menyajikan referensi komprehensif implementasi **10 Komponen Gestur & Interaksi** dalam Flutter untuk menangani respon ketukan, usapan (*swipe*), penyeretan (*drag & drop*), perbesaran (*zoom*), serta pemblokiran interaksi pengguna.

---

## 1. Daftar Dokumen Gesture Widgets

| No | Nama Widget | Fungsi Utama | Berkas Dokumentasi |
| :-: | :--- | :--- | :--- |
| 1 | **GestureDetector** | Deteksi gestur fisik non-visual (tap, double tap, pan) | [GestureDetector.md](GestureDetector.md) |
| 2 | **InkWell** | Respon gestur dengan efek riak air (*ink splash ripple*) | [InkWell.md](InkWell.md) |
| 3 | **InkResponse** | Respon gestur sentuhan Material yang meluap (*unclipped*) | [InkResponse.md](InkResponse.md) |
| 4 | **Draggable** | Widget yang dapat diseret (*drag*) | [Draggable.md](Draggable.md) |
| 5 | **DragTarget** | Zona penerima pengedropan (*drop target*) | [DragTarget.md](DragTarget.md) |
| 6 | **LongPressDraggable** | Widget yang dapat diseret setelah ditekan lama | [LongPressDraggable.md](LongPressDraggable.md) |
| 7 | **Dismissible** | Gestur usap untuk menghapus item (*swipe to dismiss*) | [Dismissible.md](Dismissible.md) |
| 8 | **InteractiveViewer** | Navigasi perbesaran dicubit (*pinch-to-zoom*) dan pan | [InteractiveViewer.md](InteractiveViewer.md) |
| 9 | **AbsorbPointer** | Memblokir seluruh interaksi gestur sentuhan | [AbsorbPointer.md](AbsorbPointer.md) |
| 10 | **IgnorePointer** | Mengabaikan sentuhan dan meneruskannya ke belakang | [IgnorePointer.md](IgnorePointer.md) |

---

## 2. Struktur Generik Dokumen Widget
Setiap berkas dokumentasi `.md` disusun menggunakan 3 bagian standar berikut:
1. **Penjelasan Singkat & Fungsi**: Penjelasan peran dan fungsi utama gestur.
2. **Tabel Atribut & Penggunaannya**: Pemetaan nama atribut, tipe data Dart, dan fungsi penggunaannya.
3. **Contoh Kode Flutter**:
   - **3.1 Contoh Kode Dasar (Basic Usage)**
   - **3.2 Contoh Kode Studi Kasus UI (Academic Mobile UI)**
