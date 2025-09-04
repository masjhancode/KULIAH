import 'dart:io';

void main() {
  stdout.write("Cek Hari  : ");
  int nilai = int.parse(stdin.readLineSync()!);
  switch (nilai) {
    case 1:
      print("Senin");
      break;
    case 2:
      print("Rabu");
      break;
    case 3:
      print("Selasa");
      break;
    default:
      print("Bukan Hari");
  }
}
