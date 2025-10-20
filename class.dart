class Person {
  String nama;
  int usia;
  int beratbadan;
  String prodi;

  Person(this.nama, this.usia, this.beratbadan, this.prodi);
  void info() {
    print(
      "Hii nama saya ${nama} adalah seorang programmer dan saya sedang belajar dart",
    );
    print(
      'saat ini saya berusia ${usia} tahun dengan berat bedan ${beratbadan} kg',
    );
    print("Saya sedang belajar di prodi ${prodi}");
  }
}

void main() {
  Person person = Person("Yasir Muin", 20, 69, "Informatika");
  print(person.nama);
  print(person.usia);
  print(person.beratbadan);
  print(person.prodi);
  person.info();
}
