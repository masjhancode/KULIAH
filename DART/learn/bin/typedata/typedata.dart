void main() {
  String nama = "Yasir Muin";
  int umur = 20;
  double tinggi = 170.0;
  bool laki = true;
  dynamic data;
  data = 100;
  data = "Seratus";
  print("Nama Saya : $nama");
  print("Usia : $umur");
  print("Tinggi badan : $tinggi");
  // ignore: dead_code
  print("Jenis Kelamin : ${laki ? "Laki-laki" : "Perempuan"} ");
  print(data);
}
