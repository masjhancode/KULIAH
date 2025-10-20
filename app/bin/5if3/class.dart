class Dosen {
  String? namadosen;
  int? nip;
}

class Mahasiswa extends Dosen {
  String? namamahasiswa;
  int? npm;
  Mahasiswa(this.namamahasiswa, this.npm, String? namadosen, int? nip)
    : super() {
    print("Nama Mahasiswa : $namamahasiswa");
    print("NPM Mahasiswa : $namamahasiswa");
    print("Nama Dosen PA : $namadosen");
    print("NIDN Dosen PA : $nip");
  }
}

void main() {
  Mahasiswa mahasiswa = Mahasiswa("melina", 07352211024, "Haidar", 95475744);
  print(mahasiswa);
}
