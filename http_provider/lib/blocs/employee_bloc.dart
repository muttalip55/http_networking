import 'package:flutter/material.dart';
import 'package:http_provider/models/employee.dart';
import 'package:http_provider/services/employee_service.dart';
import 'package:provider/provider.dart';

class EmployeeBloc {
  late List<Employee> employees;
  final EmployeeService employeeService = EmployeeService();

  List<Employee> getAll(BuildContext context) {
    employees = Provider.of<List<Employee>?>(context)!;
    return employees;
  }

  Future<List<Employee>> fetchEmployees() {
    return employeeService.fetchemployees();
  }

  Future<Employee> fetchEmployee(int id) {
    return employeeService.fetchemployee(id);
  }
}

final employeeBloc = EmployeeBloc();
