import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget{
  @override
  _AddEmpView createState() =>_AddEmpView();

}

class _AddEmpView extends State<AddEmployee>{

  final name = TextEditingController();
  final age = TextEditingController();
  final salary = TextEditingController();

  void postRequest() async{
    Dio dio = new Dio();
    Response response = await dio.post("http://dummy.restapiexample.com/api/v1/create",
        data: {"name":"${name.text}","salary":"${salary.text}","age":"${age.text}" });
    print(response.data);
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
          FloatingActionButton.extended(
              onPressed: (){
                postRequest();
                Navigator.pop(context);
              },
              label: Text(
                'ADD',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
          )
        ],
      ),
    );
  }

}