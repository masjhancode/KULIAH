void main(List<String> args) {
  Map<String, dynamic> users = {
    "name": "Yasir Muin",
    "age": 20,
    "height": 170.0,
    "isMale": false,
  };
  users.forEach((key, value) {
    print("$key: $value");
  });
}
