import 'dart:async';
import 'dart:convert';
import 'package:ecatalog_app/On-boading%20screen.dart';
import 'package:ecatalog_app/login%20screen.dart';
import 'package:ecatalog_app/product%20page.dart';
import 'package:ecatalog_app/registration%20form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     routes: <String, WidgetBuilder> {
    '/onboard': (BuildContext context) => OnBoardScreen(),
    '/loginscreen' : (BuildContext context) => LoginScreen(),
    '/registerform': (BuildContext context) => RegisterForm(),
    '/productpage' : (BuildContext context) => ProductPage(),
  },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  var res,alldata;
final storage = new FlutterSecureStorage();

  initState() {
    super.initState();
  loadData();
  startTimer();
  }
    Future<Timer> loadData() async {
  return new Timer(Duration(seconds: 5), onboadingpagefunc);
}
  onboadingpagefunc()
  {
    Navigator.push(context, PageTransition(type: PageTransitionType.upToDown, child: OnBoardScreen()));
  }
 startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }
  navigateUser() async {
    res = await storage.read(key: 'userdata');
    if(res!=null)
    {
     alldata= json.decode(res);
     print(alldata['email']);
     print(alldata['name']);
     Navigator.pushReplacementNamed(context, '/productpage');
    }
    else
    {
      Navigator.pushReplacementNamed(context, '/onboard');
    }

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/000/639/820/large_2x/vector-illustration-of-online-shopping-cartoon-girl.jpg'),
                  fit: BoxFit.fill,
                ),
              ),

            ),
          
        ],
      ),
    );
  }
}
