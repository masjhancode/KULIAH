void main() {
  Map<String, dynamic> users = {
    "name": "Yasir Muin",
    "age": 20,
    "height": 170.0,
    "isMale": true,
  };
  users.forEach((key, value) {
    print("$key: $value");
  });
}
