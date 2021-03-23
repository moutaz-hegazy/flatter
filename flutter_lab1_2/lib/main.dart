import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatefulWidget{
//   double price = 25;
//   double discount = 0;
//   double getFinalPrice(){
//     return price - (discount/100 * price);
//   }
//   double offeredPrice = 25;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: 'second task',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Offer App',style: TextStyle(fontWeight: FontWeight.bold)),
//           centerTitle: true,
//         ),
//         body: Center(
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('Current Product Price : ',style: TextStyle(fontSize: 25,color: Colors.green),),
//                     Text('$price EG',style: TextStyle(fontSize: 25,color: Colors.red),)
//                   ],
//                 ),
//               )
//               ,Row(
//                 children: [
//                   Text('Set Offer To The product',style: TextStyle(fontSize: 25),)
//                 ],
//               )
//               ,Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                    FloatingActionButton(
//                     onPressed: (){
//                       if(discount < 100){
//                         discount ++;
//                         print(discount);
//                         offeredPrice = getFinalPrice();
//                         print(offeredPrice);
//                       }
//                     },
//                     tooltip: 'Increment',
//                     child: Icon(Icons.add),
//
//                   ),
//                   Text('    $discount %    ',style: TextStyle(fontSize: 30),),
//                   FloatingActionButton.extended(
//                     onPressed: (){
//                       if(discount >0){
//                         discount--;
//                       }
//
//                     },
//                     tooltip: 'Increment',
//                     label: Text('-',style: TextStyle(fontSize: 25),),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Price After Apply Offer : ',style: TextStyle(fontSize: 20),),
//                   Text('$offeredPrice EG',style: TextStyle(fontSize: 20,color: Colors.red),)
//
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//
//   }
//
// }


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double price = 25;
  double discount = 0;
  double getFinalPrice(){
    return price - (discount/100 * price);
  }
  double offeredPrice = 25;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'second task',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Offer App',style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Current Product Price : ',style: TextStyle(fontSize: 25,color: Colors.green),),
                    Text('$price EG',style: TextStyle(fontSize: 25,color: Colors.red),)
                  ],
                ),
              )
              ,SizedBox(height: 80,)
              ,Row(
                children: [
                  Text('Set Offer To The product',style: TextStyle(fontSize: 25),)
                ],
              )
              ,SizedBox(height:30)
              ,Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        if(discount < 100){
                          discount ++;
                          print(discount);
                          offeredPrice = getFinalPrice();
                          print(offeredPrice);

                        }
                      });
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)

                  ),
                  Text('    $discount %    ',style: TextStyle(fontSize: 30),),
                  FloatingActionButton.extended(
                    onPressed: (){
                      setState(() {
                        if(discount >0){
                          discount--;
                          offeredPrice = getFinalPrice();
                        }
                      });

                    },
                    tooltip: 'Increment',
                    label: Text('-',style: TextStyle(fontSize: 25),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  ),
                ],
              )
              ,SizedBox(height:30)
              ,Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Price After Apply Offer : ',style: TextStyle(fontSize: 20),),
                  Text('$offeredPrice EG',style: TextStyle(fontSize: 20,color: Colors.red),)

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
