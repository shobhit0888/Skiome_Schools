import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skiome/pages/Home_page.dart';
import 'package:skiome/pages/forget_password.dart';
import 'package:skiome/pages/sign_up_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/authentication.dart';
import '../utils/routes.dart';
import '../widgets/google_sign_in_button.dart';

// class SignInScreen extends StatefulWidget {
//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(
//             left: 16.0,
//             right: 16.0,
//             bottom: 20.0,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Row(),
//               Expanded(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Flexible(
//                         flex: 1,
//                         child: Image(
//                           image: AssetImage("assets/images/firebase_logo.png"),
//                           height: 150,
//                         )),
//                     SizedBox(height: 20),
//                     Text(
//                       'FlutterFire',
//                       style: TextStyle(
//                         color: Colors.purple,
//                         fontSize: 40,
//                       ),
//                     ),
//                     Text(
//                       'Authentication',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         fontSize: 40,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               FutureBuilder(
//                 future: Authentication.initializeFirebase(context: context),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Text('Error initializing Firebase');
//                   } else if (snapshot.connectionState == ConnectionState.done) {
//                     return GoogleSignInButton();
//                   }
//                   return CircularProgressIndicator(
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                       Colors.orange,
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _auth = FirebaseAuth.instance;
final User? user = FirebaseAuth.instance.currentUser;
final uid = user?.uid;

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  // TextEditingController _passwordTextController = TextEditingController();
  // TextEditingController _emailTextController = TextEditingController();
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/trademark.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_outlined),
                        contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                        hintText: "Enter username",
                        labelText: "Username",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key_outlined),
                        contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                        hintText: "Enter password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (value.length < 6) {
                          return "Password length should be at least 6 ";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword())),
                            child: "Forgot password?"
                                .text
                                .underline
                                .lg
                                .color(context.theme.accentColor)
                                .make())
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      color: Colors.purple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 10),
                      child: InkWell(
                        onTap: () async {
                          setState(() {});
                          // try {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password)
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }).onError((error, stackTrace) {
                            print("error${error.toString()}");
                          });
                          // if (user != null) {
                          //   (context) => moveToHome(context);
                          // }
                          // } catch (e) {
                          // print(e);
                          // }5
                          setState(() {});
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 120,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                    //   child: Text("Login"),
                    // )
                    // FutureBuilder(
                    //   future:
                    //       Authentication.initializeFirebase(context: context),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasError) {
                    //       return Text('Error initializing Firebase');
                    //     } else if (snapshot.connectionState ==
                    //         ConnectionState.done) {
                    //       return GoogleSignInButton();
                    //     }
                    //     return CircularProgressIndicator(
                    //       valueColor: AlwaysStoppedAnimation<Color>(
                    //         Colors.orange,
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Dont have an account?"),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: " Create one!"
                          .text
                          .lg
                          .underline
                          .bold
                          .color(context.theme.accentColor)
                          .make())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
