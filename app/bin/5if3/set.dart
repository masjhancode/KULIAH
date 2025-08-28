void main(List<String> args) {
  Set<dynamic> angka = {1, 2, 3, 4, 5};
  print(angka.length);
  print(angka.add(2));
  print(angka.remove(4));
  print(angka.contains(4));
  angka.clear();
  print("konversi type data set ke list : ${angka.toList().runtimeType}");
  print(angka);
}
