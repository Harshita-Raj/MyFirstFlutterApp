import 'dart:convert';

import 'package:ecatalog_app/On-boading%20screen.dart';
import 'package:ecatalog_app/login%20form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class RegisterData {
  String name = '';
  String lname = '';
  String email = '';
  String pass1 = '';
  String phone = '';
}

class _RegisterFormState extends State<RegisterForm>
    with TickerProviderStateMixin {
  final storage = new FlutterSecureStorage();
  String pass;
  String pass1;
  String email;
  String val1;
  String val2;
  String val3;
  String user;
  String lname;
  String phno;
  String phone;
  var res, data;
  bool _obscureText = true;
  AnimationController _loginButtonController;

  Animation<double> buttonSqueezeanimation;
  Animation<EdgeInsets> containerCircleAnimation;
  bool _autovalidate = true;
  Animation buttomZoomOut;

  RegisterData objdata = RegisterData();

  static final validCharacters = RegExp('[0-9]');
  static final validpass = RegExp('[!@#\$&*~]');
  static final validpass1 = RegExp('[A-Z]');
  static final validpass2 = RegExp('[a-z]');
  static final validpass3 = RegExp('[0-9]');
  static final phstart = RegExp(r"^[1-9]{1}[0-9]+");

  var passKey = GlobalKey<FormFieldState>();
  final _formKey = GlobalKey<FormState>();
  Animation<double> buttoncontroller;

  String _validateEmail(email) {
    if (email.isEmpty) {
      // The form is empty
      return "Enter email address";
    }

    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,3}))$';

    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(email)) {
      // So, the email is valid
      return null;
    }

    return 'Email is not valid';
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  setterDataStorage(value) async {
    await storage.write(key: 'userdata', value: json.encode(value));
  }

  funreadval() async {
    res = await storage.read(key: 'userdata');
    var alldata = json.decode(res);
    print(alldata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidate: _autovalidate,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.transparent,
                          child: Center(
                            child: Text('Register',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40.0,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, right: 10, left: 10),
                    child: Container(
                      height: 600,
                      width: 500,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 50, left: 10.0, right: 10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    color: Colors.transparent,
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      onChanged: (val) {
                                        setState(() {
                                          user = val;
                                          objdata.name = val;
                                        });
                                        // user = val;
                                      },
                                      validator: (user) {
                                        if (user.isEmpty) {
                                          return 'Please enter Username';
                                        }
                                        if (user.length < 4) {
                                          return 'Enter valid name.';
                                        }
                                        if (user.contains(validCharacters)) {
                                          return 'Username does not contain integer value';
                                        }

                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'Username',
                                          border: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(20.0),
                                            borderSide: new BorderSide(),
                                          ),
                                          hintText: 'Enter Username'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20, left: 10.0, right: 10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    color: Colors.transparent,
                                    child: TextFormField(
                                      // decoration: const InputDecoration(labelText: 'Name'),
                                      keyboardType: TextInputType.text,
                                      onChanged: (val1) {
                                        email = val1;
                                        objdata.email = val1;
                                      },
                                      validator: _validateEmail,

                                      decoration: InputDecoration(
                                          labelText: 'Enter Your Email Id',
                                          border: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(20.0),
                                            borderSide: new BorderSide(),
                                          ),
                                          hintText: 'Enter a Email Id'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20, left: 10.0, right: 10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    color: Colors.transparent,
                                    child: TextFormField(
                                      key: passKey,
                                      //  obscureText: true,
                                      obscureText: _obscureText,
                                      onChanged: (val2) {
                                        pass1 = val2;
                                        objdata.pass1 = val1;
                                      },
                                      validator: (pass1) {
                                        if (pass1.isEmpty) {
                                          return 'Please enter password';
                                        }
                                        if (!(pass1.length > 8) &&
                                            pass1.isNotEmpty) {
                                          return "Password should contain more then 8 character";
                                        }
                                        if (!(pass1.contains(validpass))) {
                                          return 'password should contain atleast one special characters';
                                        }
                                        if (!(pass1.contains(validpass1))) {
                                          return 'password should contain atleast one capital and small letter ';
                                        }
                                        if (!(pass1.contains(validpass2))) {
                                          return 'password should contain atleast one small letter ';
                                        }
                                        if (!(pass1.contains(validpass3))) {
                                          return 'password should contain atleast 1 integer value ';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Enter your password',
                                        suffixIcon: new GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                          child: new Icon(_obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                        ),
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(25.0),
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
                            padding: EdgeInsets.only(
                                top: 20, left: 10.0, right: 10.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    color: Colors.transparent,
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      onChanged: (val3) {
                                        phno = val3;
                                        objdata.phone = val3;
                                      },
                                      validator: (phno) {
                                        if (phno.isEmpty) {
                                          return 'Please enter your phone number.';
                                        }
                                        if ((phno.length > 10) ||
                                            (phno.length < 10)) {
                                          return 'Enter valid phone number';
                                        }
                                        if (!(phno.contains(validpass3))) {
                                          return 'phone number should not contain contain alphabets or special characters';
                                        }
                                        if (!(phno.contains(phstart))) {
                                          return 'mobile number cannot start with 0.';
                                        }

                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Phone no.',
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(20.0),
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
                            padding: EdgeInsets.only(
                                top: 50, left: 20.0, right: 20.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
child:Container(
  height: 60,
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.black)
),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        await setterDataStorage({
                                          'name': objdata.name,
                                          'email': objdata.email,
                                          'phone no': objdata.phone
                                        });

                                        funreadval();

                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => LoginForm(
                                            email: '$email',
                                            pass1: '$pass1',
                                            user: '$user',
                                          ),
                                        ));
                                      }
                                    },
                                    textColor: Colors.white,
                                    color: Colors.blue[900],
                                    padding: const EdgeInsets.all(10.0),
                                    child: new Text(
                                      "Submit",
                                    ),
                                  ),
                                ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
