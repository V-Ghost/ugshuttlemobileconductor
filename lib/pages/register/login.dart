import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:shuttleuserapp/models/users.dart';
import 'package:shuttleuserapp/pages/landingPages/homepage.dart';
import 'package:shuttleuserapp/services/database.dart';
import 'package:shuttleuserapp/widgets/raisedGradientButton.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _regNoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  double progress;
  final usernameValidator = MultiValidator([
    RequiredValidator(errorText: 'Enter your username'),
  ]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Enter your password'),
  ]);

  final regNoValidator = MultiValidator([
    RequiredValidator(errorText: 'Enter your password'),
  ]);
  double opacity = 0;
  Users u;
  User user;
  @override
  void initState() {
    u = Users();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        progress = MediaQuery.of(context).size.height * 0.2;
        opacity = 1;
      });
    });
    user = FirebaseAuth.instance.currentUser;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SafeArea(
                child: AnimatedContainer(
                  //     margin: EdgeInsets.only(top:h/15),
                  height: progress == null ? h * 0.1 : progress,
                  width: w,
                  duration: Duration(milliseconds: 1500),
                  child: RotatedBox(
                    quarterTurns: 0,
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 2000),
                opacity: opacity,
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      SizedBox(
                        height: h * 0.07,
                      ),
                      //Container(height: 70, width: 50, child: Text("hii")),
                      Text(
                        "Login",
                        style: TextStyle(
                          letterSpacing: 0.7,
                          color: Colors.grey,
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 15, left: 15),
                              child: Material(
                                elevation: 20.0,
                                shadowColor: Colors.black,
                                child: TextFormField(
                                  controller: _usernameController,
                                  decoration: new InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    labelText: "Enter username",
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  validator: usernameValidator,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15, left: 15),
                              child: Material(
                                elevation: 20.0,
                                shadowColor: Colors.black,
                                child: TextFormField(
                                  controller: _passwordController,
                                  decoration: new InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    labelText: "Password",
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  validator: passwordValidator,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15, left: 15),
                              child: Material(
                                elevation: 20.0,
                                shadowColor: Colors.black,
                                child: TextFormField(
                                  controller: _regNoController,
                                  decoration: new InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    labelText: "Registration Number",
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  validator: regNoValidator,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      // Container(
                      //   margin: EdgeInsets.all(10),
                      //   child: Text(
                      //     "your bio would be made visible to other users",
                      //      textAlign: TextAlign.center ,
                      //     style: TextStyle(

                      //       letterSpacing: 0.7,
                      //       color: Colors.grey,
                      //       fontSize: 15,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 70,
                      ),
                      loading
                          ? CircularProgressIndicator(
                              color: Colors.pink,
                            )
                          : RaisedGradientButton(
                              width: 200,
                              child: Text(
                                'Next',
                                style: TextStyle(color: Colors.white),
                              ),
                              gradient: LinearGradient(
                                colors: <Color>[Colors.pink[800], Colors.pink],
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  u.userName = _usernameController.text;
                                  u.password = _passwordController.text;
                                  u.regNo = _regNoController.text;
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result =
                                      await DatabaseService().loginIn(u);

                                  if (result is String) {
                                    setState(() {
                                      loading = false;
                                    });
                                    Fluttertoast.showToast(
                                        msg: result,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black87,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } else {
                                    setState(() {
                                      loading = false;
                                    });
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) => Homepage(
                                                shuttleId:
                                                    _regNoController.text,
                                              )),
                                    );
                                  }
                                }
                              }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
