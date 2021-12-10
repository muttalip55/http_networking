import 'package:http_provider/models/employee.dart';
import 'package:http_provider/services/employee_service.dart';

class EmployeePhoneBloc {
  late String phone;
  final EmployeeService employeeService = EmployeeService();



  static String employeePhone(Employee employee) {
    return employee.phone;
  }
}

final employeePhoneBloc = EmployeePhoneBloc();
