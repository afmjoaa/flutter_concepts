import 'package:first_flutter_app/bloc/employee.dart';
import 'package:first_flutter_app/bloc/employee_bloc.dart';
import 'package:flutter/material.dart';

class EmployeeUi extends StatefulWidget {
  const EmployeeUi({super.key});

  @override
  State<EmployeeUi> createState() => _EmployeeUiState();
}

class _EmployeeUiState extends State<EmployeeUi> {
  late EmployeeBloc employeeBloc;

  @override
  void initState() {
    super.initState();
    employeeBloc = EmployeeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Empoyee UI"),
      ),
      body: StreamBuilder<List<Employee>>(
        stream: employeeBloc.employeeStream,
        builder: (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
          return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Name: ${snapshot.data?[index].name}"),
                  subtitle: Text("Salary: ${snapshot.data?[index].salary}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            employeeBloc.employSalaryIncrementSink.add(snapshot.data![index]);
                          },
                          color: Colors.lightGreen,
                          icon: const Icon(Icons.thumb_up_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          employeeBloc.employSalaryDecrementSink.add(snapshot.data![index]);
                        },
                        color: Colors.redAccent,
                        icon: const Icon(Icons.thumb_down_outlined),
                      )
                    ],
                  ),

                );
              }
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    employeeBloc.dispose();
    super.dispose();
  }
}
