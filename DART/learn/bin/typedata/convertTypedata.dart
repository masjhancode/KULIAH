void main() {
  int umur = 20;
  int tinggi = 170;
  String umurString = umur.toString();
  double tinggiDouble = umur.toDouble();
  int tinggiInt = tinggi.toInt();
  int stringToInt = int.parse("123");
  double stringToDouble = double.parse("123.45");
  String doubleToString = stringToDouble.toString();

  print("Umur (String): $umurString");
  print("Umur (double): $tinggiDouble");
  print("Tinggi (int): $tinggiInt");
  print("String ke int: $stringToInt");
  print("String ke double: $stringToDouble");
  print("Double ke String: $doubleToString");
}
