# Dokumentasi Widget Animasi Flutter (Animation Widgets)

Dokumentasi ini menyajikan referensi komprehensif implementasi **16 Komponen Animasi** dalam Flutter untuk menyajikan animasi implisit otomatis, transisi antar widget, serta animasi eksplisit berbasis `AnimationController`.

---

## 1. Daftar Dokumen Animation Widgets

| No | Nama Widget | Fungsi Utama | Berkas Dokumentasi |
| :-: | :--- | :--- | :--- |
| 1 | **AnimatedContainer** | Animasi implisit perubahan atribut kontainer | [AnimatedContainer.md](AnimatedContainer.md) |
| 2 | **AnimatedOpacity** | Animasi implisit pemudaran transparansi | [AnimatedOpacity.md](AnimatedOpacity.md) |
| 3 | **AnimatedPadding** | Animasi implisit perubahan inset padding | [AnimatedPadding.md](AnimatedPadding.md) |
| 4 | **AnimatedAlign** | Animasi implisit pergeseran alignment | [AnimatedAlign.md](AnimatedAlign.md) |
| 5 | **AnimatedPositioned** | Animasi implisit posisi koordinat Stack | [AnimatedPositioned.md](AnimatedPositioned.md) |
| 6 | **AnimatedSize** | Animasi implisit penyesuaian dimensi ukuran | [AnimatedSize.md](AnimatedSize.md) |
| 7 | **AnimatedSwitcher** | Transisi animasi pemudaran pergantian widget | [AnimatedSwitcher.md](AnimatedSwitcher.md) |
| 8 | **AnimatedCrossFade** | Transisi silang (*cross-fade*) antar dua widget | [AnimatedCrossFade.md](AnimatedCrossFade.md) |
| 9 | **TweenAnimationBuilder** | Animasi kustom implisit berbasis rentang Tween | [TweenAnimationBuilder.md](TweenAnimationBuilder.md) |
| 10 | **Hero** | Transisi penerbangan visual antar rute halaman | [Hero.md](Hero.md) |
| 11 | **FadeTransition** | Animasi transisi pemudaran eksplisit | [FadeTransition.md](FadeTransition.md) |
| 12 | **ScaleTransition** | Animasi transisi pembesaran skala eksplisit | [ScaleTransition.md](ScaleTransition.md) |
| 13 | **SlideTransition** | Animasi transisi pergeseran vektor Offset eksplisit | [SlideTransition.md](SlideTransition.md) |
| 14 | **RotationTransition** | Animasi transisi putaran derajat rotasi eksplisit | [RotationTransition.md](RotationTransition.md) |
| 15 | **SizeTransition** | Animasi transisi penyesuaian clipping ukuran | [SizeTransition.md](SizeTransition.md) |
| 16 | **PositionedTransition** | Animasi transisi posisi relatif Stack eksplisit | [PositionedTransition.md](PositionedTransition.md) |

---

## 2. Struktur Generik Dokumen Widget
Setiap berkas dokumentasi `.md` disusun menggunakan 3 bagian standar berikut:
1. **Penjelasan Singkat & Fungsi**: Penjelasan peran dan fungsi utama animasi.
2. **Tabel Atribut & Penggunaannya**: Pemetaan nama atribut, tipe data Dart, dan fungsi penggunaannya.
3. **Contoh Kode Flutter**:
   - **3.1 Contoh Kode Dasar (Basic Usage)**
   - **3.2 Contoh Kode Studi Kasus UI (Academic Mobile UI)**
