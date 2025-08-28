import 'dart:io';

void main() {
  stdout.write("Masukan Panjang :");
  int panjang = int.parse(stdin.readLineSync()!);
  stdout.write("Masukan Panjang :");
  int lebar = int.parse(stdin.readLineSync()!);
  print(panjang * lebar);
}
