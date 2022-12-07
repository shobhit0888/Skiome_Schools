import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart ';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skiome/pages/Home_page.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore_for_file: prefer_const_constructors
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String value = "";
  final _auth = FirebaseAuth.instance;
  TextEditingController school_name = TextEditingController();
  TextEditingController manager_name = TextEditingController();
  TextEditingController principal_name = TextEditingController();
  TextEditingController foundation_year = TextEditingController();
  TextEditingController school_level = TextEditingController();
  TextEditingController school_email = TextEditingController();
  TextEditingController school_contact = TextEditingController();
  TextEditingController m1_name = TextEditingController();
  TextEditingController m1_contact = TextEditingController();
  TextEditingController m1_email = TextEditingController();
  TextEditingController m2_name = TextEditingController();
  TextEditingController m2_contact = TextEditingController();
  TextEditingController m2_email = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var dropdownValue1;
  var dropdownValue2;
  var items = ['C.B.S.E.', 'I.C.S.E.'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 35,
                  ),
                  "Create Account"
                      .text
                      .xl4
                      .bold
                      .color(Colors.purple)
                      .makeCentered(),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Organisation Information".text.xl.bold.make(),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: school_name,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.local_library_rounded),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter school name",
                      labelText: "School name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "School name cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: manager_name,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_rounded),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter manager name",
                      labelText: "Manager Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Manager name cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: principal_name,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_rounded),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Principal name",
                      labelText: "Principal Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Principal name cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.fromLTRB(30, 4, 30, 4),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            focusColor: Colors.white,
                            value: dropdownValue1,
                            //elevation: 5,
                            style: TextStyle(color: Colors.grey),
                            iconEnabledColor: Colors.grey[500],
                            items: <String>[
                              'CBSE',
                              'ICSE',
                              'State board',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              "Board",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                dropdownValue1 = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.fromLTRB(40, 4, 40, 4),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            focusColor: Colors.white,
                            value: dropdownValue2,
                            //elevation: 5,
                            style: TextStyle(color: Colors.grey[500]),
                            iconEnabledColor: Colors.grey[500],
                            items: <String>[
                              'Hindi',
                              'English',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              "Medium",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),

                            onChanged: (String? value) {
                              setState(() {
                                dropdownValue2 = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: foundation_year,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.calendar_month),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Foundation Year",
                      labelText: "Foundation Year",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    maxLength: 4,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Foundation Year cannot be empty";
                      } else if (int.parse(value) > DateTime.now().year ||
                          int.parse(value) < 1950) {
                        return "Please enter a valid year";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: school_level,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Highest class available",
                      labelText: "School level",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "School level cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Contact Details".text.xl.bold.make(),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: school_email,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.contact_mail_rounded),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter School email id",
                      labelText: "School email id",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "School email id cannot be empty";
                      } else if (value.isNotEmpty) {
                        RegExp regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                        if (!regex.hasMatch(value)) {
                          return "Enter valid email";
                        }
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: school_contact,
                    // controller: contact,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.contact_phone_rounded),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter School contact",
                      labelText: "School contact",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "School contact cannot be empty";
                      } else if (value.toString().length < 10)
                        return "Enter valid Contact Number";
                      else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Point of Contact (POC)".text.xl.bold.make(),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Member 1".text.make(),
                    ],
                  ),
                  TextFormField(
                    controller: m1_name,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_rounded),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Name of Member 1",
                      labelText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Member 1 name cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: m1_contact,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.contact_phone_rounded),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Member 1 contact no.",
                      labelText: "Contact no.",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Member 1 contact no. cannot be empty";
                      } else if (value.toString().length < 10)
                        return "Enter valid Contact Number";
                      else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: m1_email,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.contact_mail_rounded),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Member 1 email id ",
                      labelText: "Email id ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Member 1 email id cannot be empty";
                      } else if (value.isNotEmpty) {
                        RegExp regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                        if (!regex.hasMatch(value)) {
                          return "Enter valid email";
                        }
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      "Member 2".text.make(),
                    ],
                  ),
                  TextFormField(
                    controller: m2_name,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_rounded),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Name of Member 2",
                      labelText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Member 2 name cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: m2_contact,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.contact_phone_rounded),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Member 2 contact no.",
                      labelText: "Contact no.",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Member 2 contact no. cannot be empty";
                      } else if (value.toString().length < 10)
                        return "Enter valid Contact Number";
                      else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: m2_email,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.contact_mail_rounded),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Member 2 email id ",
                      labelText: "Email id ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Member 2 email id cannot be empty";
                      } else if (value.isNotEmpty) {
                        RegExp regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                        if (!regex.hasMatch(value)) {
                          return "Enter valid email";
                        }
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key_outlined),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter password ",
                      labelText: "Password ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      if (value.length < 6) {
                        return "Password length should be at least 6 ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key_outlined),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Renter Password ",
                      labelText: "Confirm password ",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      if (value.length < 6) {
                        return "Password length should be at least 6 ";
                      } else if (value.isNotEmpty) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_]).{6,}$');

                        if (!regex.hasMatch(value)) {
                          return "Enter valid password";
                        }
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 75,
                    width: 150,
                    // decoration: BoxDecoration(
                    //     shape: BoxShape.rectangle,
                    //     borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          // CollectionReference users =
                          //     firestore.collection('Schools');
                          // await users.doc("pp").set({'name': "google"});
                          if (_formKey.currentState!.validate()) {
                            // setState(() {});
                            try {
                              User? newUser =
                                  (await _auth.createUserWithEmailAndPassword(
                                          email: school_email.text,
                                          password: password.text))
                                      .user;

                              if (newUser != null) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                              await firestore
                                  .collection("Schools")
                                  .doc(_auth.currentUser!.uid)
                                  .set({
                                'school_name': school_name.text,
                                'manager_name': manager_name.text,
                                'principal_name': principal_name.text,
                                'board': dropdownValue1,
                                'medium': dropdownValue2,
                                'foundation_year': foundation_year.text,
                                'school_level': school_level.text,
                                'school_email': school_email.text,
                                'school_contact': school_contact.text,
                                'm1_name': m1_name.text,
                                'm1_contact': m1_contact.text,
                                'm1_email': m1_email.text,
                                'm2_name': m2_name.text,
                                'm2_contact': m2_contact.text,
                                'm2_email': m2_email.text,
                              });
                            } catch (e) {
                              print(e);
                            }
                          }
                          ;
                        },
                        child: "Submit".text.bold.xl.makeCentered(),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(156, 39, 176, 1),
                        ),
                      ),
                    ),
                  )
                  // Material(
                  //   color: Colors.purple,
                  //   borderRadius: BorderRadius.circular(20),
                  //   child: InkWell(
                  //     onTap: () {
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) => HomePage()));
                  //       setState(() {});
                  //     },
                  //     child: Container(
                  //         height: 50,
                  //         width: 120,
                  //         child: "Submit".text.xl2.bold.makeCentered()),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
