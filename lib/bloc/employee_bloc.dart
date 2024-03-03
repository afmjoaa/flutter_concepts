
import 'dart:async';

import 'employee.dart';

class EmployeeBloc {

  List<Employee> employeeList = [
    Employee(0, "Rafi", 1000.0),
    Employee(1, "Tanvir", 10000.0),
    Employee(2, "Prattoy", 20000.0),
    Employee(3, "Shagor", 39000.0),
    Employee(4, "Joaa",21000.0),
    Employee(5, "Mostafiz", 1000.0),
  ];

  final _employSC = StreamController<List<Employee>>();
  Stream<List<Employee>> get employeeStream => _employSC.stream; //Exit point
  StreamSink<List<Employee>> get employeeSink => _employSC.sink; //Entry point

  final _employeeSalaryIncrementStreamController  = StreamController<Employee>();
  Stream<Employee> get employSalaryIncrementStream  => _employeeSalaryIncrementStreamController.stream; //Exit point
  StreamSink<Employee> get employSalaryIncrementSink => _employeeSalaryIncrementStreamController.sink; //Entry point

  final _employeeSalaryDecrementStreamController  = StreamController<Employee>();
  Stream<Employee> get employSalaryDecrementStream  => _employeeSalaryDecrementStreamController.stream; //Exit point
  StreamSink<Employee> get employSalaryDecrementSink => _employeeSalaryDecrementStreamController.sink; //Entry point

  EmployeeBloc(){
    employeeSink.add(employeeList);
    employSalaryIncrementStream.listen(_incrementSalary);
    employSalaryDecrementStream.listen(_decrementSalary);
  }

  void _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * 20/100;
    employeeList[employee.id].salary = salary + incrementedSalary;

    employeeSink.add(employeeList);
  }

  void _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementedSalary = salary * 10/100;
    employeeList[employee.id].salary = salary - decrementedSalary;

    employeeSink.add(employeeList);
  }

  void dispose() {
    _employSC.close();
    _employeeSalaryDecrementStreamController.close();
    _employeeSalaryIncrementStreamController.close();
  }
}