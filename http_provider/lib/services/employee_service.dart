import 'package:http/http.dart' as http;
import "dart:convert" as convert;
import 'package:http_provider/models/employee.dart';

class EmployeeService {
  static EmployeeService _singleton = EmployeeService._iternal();

  factory EmployeeService() {
    return _singleton;
  }
  EmployeeService._iternal();

  Future<List<Employee>> fetchemployees() async {
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await http.get(uri);
    var jsonResponse = convert.jsonDecode(response.body) as List;
    return jsonResponse.map((employee) => Employee.fromMap(employee)).toList();
  }

  Future<Employee> fetchemployee(int id) async {
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users/$id");
    var response = await http.get(uri);
    var jsonResponse = convert.jsonDecode(response.body);
    return Employee.fromMap(jsonResponse);
  }
}
