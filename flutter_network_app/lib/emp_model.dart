import 'package:scoped_model/scoped_model.dart';

import 'EmployeeData.dart';

class EmployeeModel extends Model{

  static EmployeeModel shared = new EmployeeModel();

    List<Employee> employees;

    EmployeeModel(){
      employees = new List();
    }
    void addEmployee(Employee e){
      employees.add(e);
      notifyListeners();
    }
}