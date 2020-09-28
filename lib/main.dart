import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/ScreenReliquat.dart';
import 'Screens/medecamentScreen.dart';
import 'Screens/screenpatient.dart';
import 'Screens/solutionpreparer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doza',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlueAccent,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor
          ),
          button: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'openSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              )
          ),
        ),

      ),
      home: doza (),
    );
  }
}
class doza extends StatefulWidget {
  @override
  _dozaState createState() => _dozaState();
}

class _dozaState extends State<doza> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
            // width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'Assets/Images/logo.png',
                          width: 140,
                        ),
                        Text("Gagner Du Temps , Sauver Des Vies",
                          style:TextStyle(
                            color: Colors.white,
                            fontSize:20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.tight,
                        child: Material(

                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,  MaterialPageRoute(builder: (context) => medec()), );
                            },
                            child: Card(
                              color: Theme.of(context).primaryColor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    'Assets/Images/doctor2.png',
                                    width: 80,
                                    height: 140,
                                  ),
                                  Text('Medecament',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Material(

                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,  MaterialPageRoute(builder: (context) => ScreenPatient()), );
                            },
                            child: Card(
                              color: Theme.of(context).primaryColor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    'Assets/Images/doctor2.png',
                                    width: 80,
                                    height: 140,
                                  ),
                                  Text('Patient',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.tight,
                        child: Material(

                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => SolutionPreparer()
                                  )
                              );
                            },
                            child: Card(
                              color: Theme.of(context).primaryColor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    'Assets/Images/doctor2.png',
                                    width: 80,
                                      height: 140,
                                  ),
                                  Text('Preparer Solution',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Material(

                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,  MaterialPageRoute(builder: (context) => ScreenReliquat()), );
                            },
                            child: Card(
                              color: Theme.of(context).primaryColor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    'Assets/Images/doctor2.png',
                                    width: 80,
                                    height: 140,
                                  ),
                                  Text('Reliquat',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],


      ),
          )),
    );
  }
}

class MyClipper extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, size.height-40);
    path.quadraticBezierTo(size.width/2, size.height+40, size.width, size.height-40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}