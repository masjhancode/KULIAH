class Dosen {
  String? namadosen;
  String? jurusandosen;
  int? nidn;
  Dosen(this.namadosen, this.jurusandosen, this.nidn);
}

class Mahasiswa extends Dosen {
  String? nama;
  int? npm;
  String? jurusan;
  Mahasiswa(
    this.nama,
    this.npm,
    this.jurusan,
    String? namadosen,
    String? jurusandosen,
    int? nidn,
  ) : super(namadosen, jurusandosen, nidn) {
    print("Nama : $nama");
    print("Npm : $npm");
    print("Jurusan : $jurusan");
    print("Nama Dosen : $namadosen");
    print("NIDN : $nidn");
    print("Jurusan : $jurusandosen");
  }
}

main() {
  Mahasiswa mahasiswa = Mahasiswa(
    "Destita",
    07352211024,
    "Informatika",
    "Haidar",
    " Informatika",
    95475744,
  );
  print(mahasiswa);
}
