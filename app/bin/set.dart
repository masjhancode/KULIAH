void main(List<String> args) {
  Set<dynamic> angka = {1, 2, 3, 4, 5};
  print(angka.length);
  print(angka.add(6));
  print(angka.remove(1));
  print(angka.contains(1));
  angka.clear();
  print(angka.runtimeType);
  print(angka.toList().runtimeType);
}
