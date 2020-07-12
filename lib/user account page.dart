import 'dart:convert';

import 'package:ecatalog_app/login%20form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';

class UserAccount extends StatefulWidget {
  String username;
  UserAccount({Key key, this.username});
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  var username;
  String firstletter;
  final storage = new FlutterSecureStorage();
   var res;
  
  @override
  void initState() {
    super.initState();
    funreaduserdata();
    setState(() {
      username = widget.username;
      print('username in account page: $username');
      displayletter(username);
    });
  }
funreaduserdata() async {
    res = await storage.read(key: 'userdata');
    var alldata = json.decode(res);
    print('res from home page $alldata');
    setState(() {
       username=alldata['name'];
       
    });
   
  }
  displayletter(String name) {
    //name=username;
    firstletter = name.substring(0, 1).toUpperCase();
    print(firstletter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E Catalog')),
      body:
      Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue[900],
              height: 300,
              width: MediaQuery.of(context).size.width,
 child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Padding(
                padding:EdgeInsets.only(top:40),
                 child:Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  
                   child: Center(
                          child: Text('$firstletter',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50.0,
                                  color: Colors.black)),
                        ),
                ),
              ),
                  Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                      ),
                      child: Text('$username',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:10),
                      child:Text('sub title',   style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white)),),
        ]),

            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                child:Column(children: <Widget>[
                   FlatButton(onPressed: (){
Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: LoginForm()));
                },
              child:Align(
                alignment: Alignment.topCenter,
              child: Text('sign out',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black)),
              
              ),
                ),
          ]),
              ),
            ),
          
          ],
        ),
      ),
    
    );
  }
}
