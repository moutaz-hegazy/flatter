class Employee{
  String id;
  String employee_name;
  String employee_salary;
  String employee_age;
  String profile_image;

  Employee(this.id, this.employee_name, this.employee_salary, this.employee_age,
      this.profile_image);

  factory Employee.fromJson(var json){
    return Employee(json["id"],json["employee_name"],
      json["employee_salary"],json["employee_age"],json["profile_image"]);
  }
}