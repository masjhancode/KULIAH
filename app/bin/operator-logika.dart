void main(List<String> args) {
  String username = "admin";
  int password = 123;
  int x = 10;
  int y = 20;

  var hasil = x < y ? "benar" : "salah";
  print(hasil);

  print(username == "admin" && password == 123);
  print(username == "admin" || password == 123);
  print(!(username == "admin" && password == 123));
}
