import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'EmployeeData.dart';
import 'emp_model.dart';

class AddEmployee extends StatefulWidget{
  @override
  _AddEmpView createState() =>_AddEmpView();

}

class _AddEmpView extends State<AddEmployee>{

  final name = TextEditingController();
  final age = TextEditingController();
  final salary = TextEditingController();

  Future<Employee> postRequest() async{
    Dio dio = new Dio();
    Response response = await dio.post("http://dummy.restapiexample.com/api/v1/create",
        data: {"name":"${name.text}","salary":"${salary.text}","age":"${age.text}" });
    Employee e = new Employee((response.data["data"])["id"].toString() ?? "",
        (response.data["data"])["name"] ?? "", (response.data["data"])["salary"] ?? "",
        (response.data["data"])["age"] ?? "", "");
    print("data -> ${response.data} / emp ->${e.employee_name}");
    return e;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Add Employee',
           style: TextStyle(
             fontSize: 25,
             color: Colors.white
           ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: name,
            decoration: InputDecoration(hintText: 'Employee Name')
          ),
          TextField(
              controller: age,
              decoration: InputDecoration(hintText: 'Employee age')
          ),
          TextField(
              controller: salary,
              decoration: InputDecoration(hintText: 'Employee Salary')
          ),
          SizedBox(height: 30,),
          ScopedModel<EmployeeModel>(
              model: EmployeeModel.shared,
              child: new Container(
                child: new ScopedModelDescendant<EmployeeModel>(
                builder: (context, child, model) {
                       return FloatingActionButton.extended(
                           onPressed:(){
                             postRequest().then((e){
                               model.addEmployee(e);
                             });
                             Navigator.pop(context);
                           },
                            label: Text(
                              'ADD',
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                       );
                }
              )
          )
          )
        ],
      ),
    );
  }

}