void main() {
  List<dynamic> students = ["John", "Mary", "David", "Emma", 10];

  // untuk menampilkan data di list ada beberapa cara yang bisa kita lakukan diantaranya:
  print(students); // cara pertma
  for (var item in students) {
    //cara kedua
    print(item);
  }
  for (var item in students) {
    //cara ke tiga
    print(item);
  }
  students.map((print)).toList(); // cara ke empat
}
