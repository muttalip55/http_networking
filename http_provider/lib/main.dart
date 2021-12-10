import 'package:flutter/material.dart';
import 'package:http_provider/blocs/employee_bloc.dart';
import 'package:http_provider/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
        create: (context) => employeeBloc.fetchEmployees(),
        catchError: (context, error) {
          print(error.toString());
        },
        initialData: null,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: Home(),
        ));
  }
}
