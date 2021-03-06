import 'package:flutter/material.dart';
import 'package:flutter_lab2_1/details_screen.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: buildBody(),
        ),
      ),
    );
  }

  Widget buildBody() {
    var _textStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
    );

    var _textStyle2 = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 24,
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: (){
                      Navigator.pop(context);
                  },
                  child: Text(
                    'Log in',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Image.asset(
            "assets/images/pic.jpg",
            height: 100,
            width: 100,
          ),
          SizedBox(height: 50),
          TextField(
            decoration: InputDecoration(hintText: 'Email Adress'),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(hintText: 'UserName'),
          ),
          SizedBox(height: 20),
          TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          SizedBox(height: 20),
          TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: 'Repeat Password'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (_)=>DetailsScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.assignment_turned_in_outlined,
                      color: Colors.blue,
                    ),
                    Text(
                      "??Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an Account', style: TextStyle(color: Colors.grey, fontSize: 18)
                ),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                },
                    child: Text(
                      'LogIn',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
