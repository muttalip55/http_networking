import 'package:flutter/material.dart';
import 'package:http_provider/blocs/employee_bloc.dart';
import 'package:http_provider/blocs/employee_phone_bloc.dart';
import 'package:http_provider/models/employee.dart';
import 'package:provider/provider.dart';

class EmployeeInfo extends StatelessWidget {
   final int id;
   final String name;
  const EmployeeInfo({required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: FutureProvider(
        create: (context) => employeeBloc.fetchEmployee(id),
        child: Center(child: Consumer<Employee?>(
          builder: (context, employee, widget) {
            return (employee != null)
                ? buildPhone(employee)
                : CircularProgressIndicator();
          },
        )),
        initialData: null,
      ),
    );
  }

  Widget buildPhone(Employee employee) {
    return Text(
        "Employee Phone number ${EmployeePhoneBloc.employeePhone(employee)}");
  }
}
