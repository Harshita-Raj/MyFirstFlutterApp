import 'dart:convert';
import 'package:ecatalog_app/product%20page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';


class LoginForm extends StatefulWidget {
   final String email;
  final String pass1;
  final String user;

  const LoginForm({Key key, this.email, this.pass1, this.user}) : super(key: key);
  
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final storage = new FlutterSecureStorage();
   var res;
  static final validCharacters = RegExp('[0-9]');
  static final validpass = RegExp('[!@#\$&*~]');
  static final validpass1 = RegExp('[A-Z]');
  static final validpass2 = RegExp('[a-z]');
  static final validpass3 = RegExp('[0-9]');
   final _formKey = GlobalKey<FormState>();
 String userdata;
 String username,email;
 var alldata;

String useremail;
 @override
  void initState() {
    super.initState();
    getterDataStorage();
    setState(() {
      username=widget.user;
    useremail=widget.email;
    print('in login form $username');
     print('in login form $useremail');
    
    });
    
  }

  getterDataStorage()
  async {
     res = await storage.read(key: 'userdata');
     alldata= json.decode(res);
  
setState(() {
  useremail=alldata['email'];
  username=alldata['name'];
  print(username);
  print(useremail);
});
    if(alldata['email']==widget.email)
    {
      print('login successfully');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Form(
             key: _formKey,
           
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              child: Center(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 200,
                        width: 100,
                        color: Colors.transparent,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(image: AssetImage('assets/images/login1.png')),
                                  borderRadius: new BorderRadius.all(
                                    Radius.circular(50.0),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text("Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.white)),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(100.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50,left: 20,right: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.transparent,
                    
                    child: TextFormField(
                    //  controller: _textFieldController,
                    // decoration: const InputDecoration(labelText: 'Name'),
                    keyboardType: TextInputType.text,
                    validator: (mail) {
                      if (mail.isEmpty) {
                        return 'Please enter username';
                      }
                     
                      
                      if (!(mail.contains(widget.email))) {
                       
                        return 'email id is not correct';
                      }

                      return null;
                    },

                    decoration: InputDecoration(
                        labelText: 'Enter a Email Id',
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                      //  hintText: 'Enter a Email Id'
                        ),
                  ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10,left: 20,right: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      //height: 100,
                      width: 100,
                      color: Colors.transparent,
                     child: TextFormField(
                    obscureText: true,
                    validator: (passwd) {
                      if (passwd.isEmpty) {
                        return 'Please enter password';
                      }
                      
                      if (!(passwd.contains(widget.pass1))) {
                       
                        return 'password is not correct';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter your password',
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:EdgeInsets.only(right:20),
           child: Align(
              alignment: Alignment.bottomRight,
            child:Text("Forgot Password?", style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0,
                                            color: Colors.blue[900])),
            ),
            ),
             Padding(
              padding: EdgeInsets.only(top: 40,right: 30,left: 30),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 60,
                      width: 100,
                      color: Colors.transparent,
                      child: RaisedButton(onPressed: (){
 if (_formKey.currentState.validate()) {
                      getterDataStorage();
    Navigator.push(context, PageTransition(type: PageTransitionType.upToDown, child: ProductPage(username: '$username',email: '$useremail')));
                      }
                      },
                      child: Text('Login', style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.white)),
                      color: Colors.blue[900],
                      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
        side: BorderSide(color: Colors.blue),
        
),
                      ),
                      
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
