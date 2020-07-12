import 'package:ecatalog_app/login%20form.dart';
import 'package:ecatalog_app/registration%20form.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
     
      body:Stack(
        fit: StackFit.expand,
        children:<Widget>[
        
        Container(
          height: 100,
          width: 100,
         // color: Colors.red,
         decoration: BoxDecoration(
          // color: Colors.red,
          
           image: DecorationImage(
             image: AssetImage('assets/images/bluebanner.jpg'),
             fit: BoxFit.fill,
             ),
         ),
         child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),

                   child: Container(
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [BoxShadow(
 color: Colors.black,
   blurRadius: 20.0, // has the effect of softening the shadow
        spreadRadius: 5.0, //
 offset: Offset(
          5.0, // horizontal, move right 10
          5.0,
         
        ),
                        ),],
                       image: DecorationImage(image: AssetImage("assets/images/screen2.jpg"),fit: BoxFit.fill),
                        borderRadius: new BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 65),
                                  child: Container(
                                    height: 60,
                                   // width: 100,
                                    color: Colors.transparent,
                                    child: OutlineButton(
                                      
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeft,
                                                child: RegisterForm()));
                                      },
                                      child: Text('Signup',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              color: Colors.black)),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0),
                                            
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.blue[900],
                                        style: BorderStyle.solid,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                       child:Container(
                  width: 300,
                  color: Colors.transparent,
                child: FlatButton(
                  onPressed: () {},
                  child: Text('-----OR SKIP-----',style:TextStyle(color:Colors.redAccent),),
                ),
                ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 10,bottom: 50),
                                  child: Container(
                                    height: 60,
                                    width: 100,
                                    color: Colors.transparent,
                                    child: OutlineButton(
                                      onPressed: () {
                                        
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .leftToRight,
                                                child:LoginForm()));
                                      },
                                      child: Text('Login',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              color: Colors.black)),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.blue[900],
                                        style: BorderStyle.solid,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
             
                  
                  ),
                ),
              ],
            )
          ],
        ),
      ),
        ),
      ]),
    );
  }
}
