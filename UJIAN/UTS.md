## Aplikasi Pemesanan Transportasi “SmartRide”
Buatlah sebuah program berbasis OOP dengan bahasa Dart yang mensimulasikan sistem pemesanan transportasi terpadu (misalnya taksi, bus, dan pesawat). Program harus memanfaatkan class, inheritance, encapsulation, polymorphism, dan function.

1. Kelas Abstrak Transportasi
Kelas ini berfungsi sebagai kelas induk dari semua jenis transportasi.
Atribut yang dimiliki:
id → kode unik kendaraan
nama → nama transportasi (contoh: “Bus TransJakarta”, “Garuda Indonesia”)
_tarifDasar → tarif dasar (bersifat private)
kapasitas → jumlah maksimal penumpang

Method yang dimiliki:
double hitungTarif(int jumlahPenumpang); → method abstrak untuk menghitung biaya perjalanan
void tampilInfo(); → menampilkan informasi transportasi
Getter untuk _tarifDasar

2. Kelas Turunan
a. Kelas Taksi (turunan dari Transportasi)
Atribut tambahan:
jarak → jarak perjalanan (dalam kilometer)
Rumus perhitungan tarif:
total = _tarifDasar * jarak
b. Kelas Bus (turunan dari Transportasi)
Atribut tambahan:
adaWifi → nilai boolean (true/false)
Rumus perhitungan tarif:
total = (_tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0)
c. Kelas Pesawat (turunan dari Transportasi)
Atribut tambahan:
kelas → tipe kelas penerbangan (“Ekonomi” atau “Bisnis”)
Rumus perhitungan tarif:
total = _tarifDasar * jumlahPenumpang * (kelas == "Bisnis" ? 1.5 : 1.0)
3. Kelas Pemesanan
Kelas ini digunakan untuk menyimpan data pemesanan pelanggan.

Atribut:
idPemesanan → kode unik pemesanan
namaPelanggan → nama pelanggan
transportasi → objek dari kelas Transportasi
jumlahPenumpang → jumlah penumpang
totalTarif → total biaya perjalanan

Method:
void cetakStruk() → menampilkan detail pemesanan ke layar
Map<String, dynamic> toMap() → mengubah data pemesanan menjadi bentuk Map (simulasi database)

4. Fungsi Global
Buat fungsi global bernama:
Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang)
Fungsi ini akan:
Menghitung total biaya perjalanan menggunakan hitungTarif()
Mengembalikan objek Pemesanan yang berisi seluruh informasi transaksi
Selain itu, buat fungsi global lain:
void tampilSemuaPemesanan(List<Pemesanan> daftar)
yang akan menampilkan semua riwayat pemesanan pelanggan.

5. Fungsi main()
Program utama harus:
Membuat beberapa objek transportasi (misalnya 1 taksi, 1 bus, 1 pesawat) dengan nilai atribut berbeda.
Memanggil fungsi buatPemesanan() untuk membuat beberapa data pemesanan pelanggan.
Menyimpan semua data ke dalam List<Pemesanan>.
Menampilkan seluruh hasil transaksi menggunakan tampilSemuaPemesanan().

## kriteria Penilaian Ujian
| Aspek                          | Penilaian |
| ------------------------------ | --------- |
| Abstraksi dan Pewarisan Kelas  | 25%       |
| Enkapsulasi dan Akses Data     | 15%       |
| Polimorfisme dan Fungsi Global | 25%       |
| Logika Program dan Output      | 25%       |
| Kerapian dan Komentar Kode     | 10%       |

## Ketentuan Ujian
1. buat program secara live codding di youtube dengan syarat harus memperlihatkan wajah di kamera dan memberikan penjelsan pada baris kode atau fungsi yang di buat
2. link youtube live codding di kumpul di github readme.md
3. link github di kumpul di class room
