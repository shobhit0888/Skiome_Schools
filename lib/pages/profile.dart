// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:skiome/models/registration_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skiome/pages/Home_page.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                              image: AssetImage(
                                  "assets/images/profile_image.png")),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 30,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              buildTextField("SchoolName", "CCA"),
              buildTextField("ManagerName", "CCA"),
              buildTextField("PricipalName", "CCA"),
              buildTextField("FoundationYear", "CCA"),
              buildTextField("SchoolLevel", "CCA"),
              buildTextField("SchoolEmail", "CCA"),
              buildTextField("SchoolContact", "CCA"),
              buildTextField("m1Name", "CCA"),
              buildTextField("m1contact", "CCA"),
              buildTextField("m1email", "CCA"),
              buildTextField("m2name", "CCA"),
              buildTextField("m2contact", "CCA"),
              buildTextField("m2email", "CCA"),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 0, 50),
                    child: ElevatedButton(
                        onPressed: (() {}), child: "Cancel".text.bold.make()),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(130, 0, 0, 50),
                    child: ElevatedButton(
                       
                        onPressed: (() {}), child: "  Save  ".text.bold.make()),
                  )
                ],
              )
              // AppBar(
              //   title: "Edit Profile".text.bold.color(Colors.white).xl2.make(),
              //   backgroundColor: Colors.purple[400],
              //   leading: IconButton(
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: ((context) => HomePage())));
              //     },
              //     icon: Icon(Icons.arrow_back_ios),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: labelText,
              hintText: placeholder,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// class SettingsUI extends StatelessWidget {
//   const SettingsUI({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Setting UI",
//       home: EditProfilePage(),
//     );
//   }
// }

// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({Key? key}) : super(key: key);

//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {

//   String currentUser = (Auth().auth.currentUser as User).email.toString();
//   TextEditingController displayNameController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   bool isLoading = false;
//   User? user;
//   School? userModel;
//   String? imageUrl;
//   final refDatabase = FirebaseDatabase.instance;
//   bool showPassword = false;
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.green,
//           ),
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (BuildContext context) => const SettingsPage()));
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(
//               Icons.settings,
//               color: Colors.green,
//             ),
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (BuildContext context) => const SettingsPage()));
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               const Text(
//                 "Edit Profile",
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 width: 130,
//                 height: 130,
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                         width: 4,
//                         color: Theme.of(context).scaffoldBackgroundColor),
//                     boxShadow: [
//                       BoxShadow(
//                           spreadRadius: 2,
//                           blurRadius: 10,
//                           color: Colors.black.withOpacity(0.1),
//                           offset: const Offset(0, 10))
//                     ],
//                     shape: BoxShape.circle,
//                     image: const DecorationImage(
//                         fit: BoxFit.cover,
//                         image: NetworkImage(
//                           "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
//                         ))),
//               ),
//               const SizedBox(
//                 height: 35,
//               ),
//               TextField(
//                 decoration: const InputDecoration(
//                   labelText: "Name",
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.teal)),
//                   hintText: 'Input Name',
//                 ),
//                 controller: displayNameController,
//                 keyboardType: TextInputType.name,
//               ),
//               TextField(
//                 decoration: const InputDecoration(
//                   labelText: "Age",
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.teal)),
//                   hintText: 'Input Age',
//                 ),
//                 controller: ageController,
//                 //
//                 keyboardType: TextInputType.number,
//               ),
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text("Email: ", style: TextStyle(fontSize: 20),),
//               ),
//               const SizedBox(
//                 height: 35,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text("CANCEL",
//                         style: TextStyle(
//                             fontSize: 14,
//                             letterSpacing: 2.2,
//                             color: Colors.black)),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       FirebaseDatabase.instance.ref()
//                           .child('useProfileBrowse')
//                           .child(user!.uid)
//                           .update({
//                         'name': displayNameController.text //yes I know.
//                       });
//                       FirebaseDatabase.instance.ref()
//                           .child('useProfileBrowse')
//                           .child(user!.uid)
//                           .update({
//                         'age': ageController.text //yes I know.
//                       });
//                     },
//                     child: const Text(
//                       "SAVE",
//                       style: TextStyle(
//                           fontSize: 14,
//                           letterSpacing: 2.2,
//                           color: Colors.white),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }