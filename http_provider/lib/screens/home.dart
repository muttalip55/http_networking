import 'package:flutter/material.dart';
import 'package:http_provider/blocs/employee_bloc.dart';
import 'package:http_provider/models/employee.dart';
import 'package:http_provider/screens/employee_info.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Employee> employees = employeeBloc.getAll(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empoyees"),
      ),
      body: (employees == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                return ListTile(
                  subtitle: Text(employees[index].email),
                  title: Text(employees[index].name),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EmployeeInfo(
                            id: employees[index].id,
                            name: employees[index].name)));
                  },
                );
              }),
    );
  }
}
