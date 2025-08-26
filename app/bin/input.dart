import 'dart:io';

void main(List<String> args) {
  String? name;
  int? usia;
  stdout.write("Masukkan Nama : ");
  name = stdin.readLineSync();
  stdout.write("Masukkan Usia : ");
  usia = int.parse(stdin.readLineSync()!);
  print(name);
  print(usia.runtimeType);
}
