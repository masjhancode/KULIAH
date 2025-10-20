import "dart:io";

main() {
  String username = "admin";
  int password = 123;
  stdout.write("masukan useranme : ");
  String? inputUsername = stdin.readLineSync();
  stdout.write("masukan Password : ");
  int? inputPassword = int.parse(stdin.readLineSync()!);

  if (inputUsername == username && inputPassword == password) {
    print("Login Berhasil");
  } else {
    print("Login Gagal");
  }
}
