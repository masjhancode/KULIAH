class Dosen {
  String? nama;
  int? nidn;
  info() {
    print("Nama Dosen : $nama");
    print("Nidn : $nidn");
  }
}

class Mahasiswa extends Dosen {
  String? name;
  int? npm;
  String? pa;

  Mahasiswa(this.name, this.npm, this.pa);

  @override
  void info() {
    print("Nama Mahasiswa : $name");
    print("Npm : $npm");
    print("Dosen PA : $nama");
  }
}

void main() {
  Mahasiswa mahasiswa = Mahasiswa("Yasir Muin", 07351411105, "Amal Khairan");
  mahasiswa.info();
}
