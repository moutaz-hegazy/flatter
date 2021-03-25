import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network_app/addEmp.dart';

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

  Future<List<Employee>> employees = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employees = fetch();
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
        child: FutureBuilder<List<Employee>>(
          future: employees,
          builder: (context,snapShot){
            if(snapShot.hasError){
              return ErrorWidget('exception');
            }
            List<Employee> emps = snapShot.data ?? [];
            return ListView.builder(
                itemCount: emps.length,
                itemBuilder: (context,index){
                  Employee employee = emps[index];
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

          },
        ),
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
