

import 'package:flutter/material.dart';

class Splash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(flex: 30,)
              ,Container(
                child: Image.asset("assets/images/pic.jpg",width: 75,height: 75,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(75),
                ),
                padding: EdgeInsets.all(15),
              )
              ,SizedBox(height: 30,)
              ,Text(
                'GoKart',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: 'myfont'
                ),

              )
              ,Spacer(flex: 70,)
              ,Icon(Icons.square_foot_sharp,
              color: Colors.yellow,)
              ,SizedBox(height: 10,)
              ,Text(
                'Flutter Commerce\nUI Template',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),)
              ,Spacer(flex: 20,)
            ],
          )
        ),
    );
  }

}