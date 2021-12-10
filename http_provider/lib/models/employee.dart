class Employee {
  late final int id;
  late final String name;
  late final String phone;
  late final String email;

  Employee(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email});

  Employee.fromMap(Map<String, dynamic> parsedJson)
      : id = parsedJson["id"],
        name = parsedJson["name"],
        email = parsedJson["email"],
        phone = parsedJson["phone"];
}
