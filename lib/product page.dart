import 'dart:convert';
import 'dart:io';
import 'package:ecatalog_app/user%20account%20page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';

class ProductPage extends StatefulWidget {
  String email, username;
  ProductPage({Key key, this.email, this.username}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final storage = new FlutterSecureStorage();
  String username, useremail;
  String alldata;
  var res;
  @override
  void initState() {
    super.initState();
    funreaduserdata();
    setState(() {
      useremail = widget.email;
      username = widget.username;
      print('username from login $username');
      print('from login page $useremail');
    });
  }

  funreaduserdata() async {
    res = await storage.read(key: 'userdata');
    var alldata = json.decode(res);
    print('res from home page $res');
    setState(() {
      username = alldata['name'];
      useremail = alldata['email'];
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: roundedButton(
                    "No", Color(0xFF167F67), const Color(0xFFFFFFFF)),
              ),
              GestureDetector(
                onTap: () => exit(0),
                child: roundedButton(
                    " Yes ", Color(0xFF167F67), const Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ) ??
        false;
  }

  Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      padding: EdgeInsets.all(5.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          appBar: AppBar(
            title: Text('welcome'),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/login1.png"),
                    ),
                  ),
                  accountName: Text('$username'),
                  accountEmail: Text('$useremail'),
                ),
                ListTile(
                  title: Text('Account'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.upToDown,
                            child: UserAccount(
                              username: '$username',
                            )));
                  },
                ),
                Divider(
                  color: Colors.blue[900],
                ),
                ListTile(
                  title: Text('MyList2'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                Divider(
                  color: Colors.blue[900],
                ),
                ListTile(
                  title: Text('MyList3'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                Divider(
                  color: Colors.blue[900],
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:20),
                height: 300,
                width: MediaQuery.of(context).size.width,
               
                decoration: BoxDecoration(
                   color: Colors.blue,
                    image: DecorationImage(
                  image: AssetImage('assets/images/newproductimage.jpg'),
                  fit: BoxFit.fill,
                )),
                child: Stack(children: <Widget>[
                  Center(
             child:Container(
               height: 180,
               width:150,
                 child: Center(
                  child:Text("All that's new", textAlign: TextAlign.center,  style: TextStyle(
        fontSize: 50,
         wordSpacing: 2.0,
       
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6
          ..color = Colors.white,
      ),)),
             ),
                  ),
                ],),
              )
            ],
          ))),
    );
  }
}
