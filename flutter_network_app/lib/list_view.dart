import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network_app/addEmp.dart';
import 'package:flutter_network_app/emp_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'EmployeeData.dart';

Future<List<Employee>> fetch() async{
  List<Employee> employees = new List<Employee>();
  Dio dio = new Dio();
  Response response = await dio.get("http://dummy.restapiexample.com/api/v1/employees");
  var res = response.data;
  var emps = res["data"];
  for(var obj in emps){
    Employee emp = new Employee.fromJson(obj);
    employees.add(emp);
  }
  return employees;
}

class EmployeeList extends StatefulWidget {
  @override
  _MyList createState() => _MyList();
}

class _MyList extends State<EmployeeList> {

  //Future<List<Employee>> employees = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch().then((value) {
      EmployeeModel.shared.employees = value;
      EmployeeModel.shared.notifyListeners();

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Employees',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Center(

        child: ScopedModel<EmployeeModel>(
            model: EmployeeModel.shared,
            child: new Container(
                child: new ScopedModelDescendant<EmployeeModel>(
                    builder: (context, child, model) {
                      return model.employees.isEmpty? CircularProgressIndicator():ListView.builder(
                          itemCount: model.employees.length,
                          itemBuilder: (context,index){
                            Employee employee = EmployeeModel.shared.employees[index];
                            return new Padding(
                              padding:EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Align(
                                    child: Text(
                                      'name : ${employee.employee_name}',
                                      style: TextStyle(
                                          fontSize: 20
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  Align(
                                    child: Text(
                                      'age : ${employee.employee_age}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color:Colors.grey
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  )
                                ],
                              ),
                            );
                          }
                      );
                    }
                )
            )
        )
        // child: FutureBuilder<List<Employee>>(
        //   builder: (context,snapShot){
        //     if(snapShot.hasError){
        //       return ErrorWidget('exception');
        //     }
        //     List<Employee> emps = snapShot.data ?? [];
        //     return
        //
        //   },
        //),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (_)=>AddEmployee()));
        },
          child: Icon(Icons.add)
      ),
    );
  }
}
