import 'dart:math';
import 'dart:io';

void main() {
  int random = Random().nextInt(10);
  while (random > 0) {
    print("hint : $random");
    stdout.write('masukan nilai : ');
    String input = stdin.readLineSync()!;
    int result = int.parse(input);
    print("Benar jawabnya adalah $result");
    if (result == random) {
      print("Benar jawabnya adalah $result");
      break;
    }
  }
}
