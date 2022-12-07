import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skiome/pages/Home_page.dart';
import 'package:skiome/pages/sign_up_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/authentication.dart';
import '../utils/routes.dart';
import '../widgets/google_sign_in_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

final _auth = FirebaseAuth.instance;
final User? user = FirebaseAuth.instance.currentUser;
final uid = user?.uid;

class _ForgotPasswordState extends State<ForgotPassword> {
  String _email = "";
  String password = "";
  // TextEditingController _passwordTextController = TextEditingController();
  // TextEditingController _emailTextController = TextEditingController();
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/forgot_password.png"),
              SizedBox(
                height: 20,
              ),
              "Enter your registered email to reset your password"
                  .text
                  .center
                  .bold
                  .xl2
                  .makeCentered()
                  .px32(),
              // Text(
              //   "an email has been sent" + " to your email id",
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_outlined),
                        contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                        hintText: "Enter registered email id",
                        labelText: "Registered Email Id",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email Id cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Material(
                      color: Colors.purple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 10),
                      child: InkWell(
                        onTap: () async {
                          
                          // setState(() {});
                          // try {
                          User? user = await FirebaseAuth.instance
                                  .sendPasswordResetEmail(email: _email)
                                  .then((value) => Navigator.of(context).pop())
                              as User?;
                          // }
                          // } catch (e) {
                          // print(e);
                          // }5
                          // setState(() {});
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Request Link",
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
