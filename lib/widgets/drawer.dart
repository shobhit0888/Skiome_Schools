import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skiome/pages/Home_page.dart';
import 'package:skiome/pages/profile.dart';
// import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          Center(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/images/profile_image.png"))),
                  ),
                ),
                Positioned(
                  bottom: 17,
                  right: 16,
                  child: InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage())),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Colors.white),
                        color: Colors.blue,
                      ),
                      child: Icon(Icons.edit, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),

          // DrawerHeader(
          // padding: EdgeInsets.zero,
          // margin: EdgeInsets.zero,
          // child: UserAccountsDrawerHeader(
          //     decoration: BoxDecoration(
          //       color: Colors.purple,
          //     ),
          //     margin: EdgeInsets.all(5),
          //     accountName: "Shobhit Gupta".text.make().px16(),
          //     accountEmail: Text("shogupt2002@gmail.com"),
          //     currentAccountPicture: InkWell(
          //       child: Center(
          //         child: Container(
          //           height: 130,
          //           width: 130,
          //           child: CircleAvatar(
          //             backgroundImage:
          //                 AssetImage("assets/images/profile_image.png"),
          //           ),
          //         ),
          //       ),
          //     )),
          // ),
          ListTile(
            minLeadingWidth: 40,
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.purple,
            ),
            // title: InkWell(
            //   onTap: () => Navigator.push(
            //       context, MaterialPageRoute(builder: (context) => HomePage())),
            title: Text(
              "Home",
              textScaleFactor: 1.3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
          // ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.purple,
            ),
            title: Text(
              "Profile",
              textScaleFactor: 1.3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
          ListTile(
            minLeadingWidth: 40,
            leading: Icon(
              CupertinoIcons.square_fill_line_vertical_square,
              color: Colors.purple,
            ),
            title: Text(
              "Features",
              textScaleFactor: 1.3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.purple,
            ),
            title: Text(
              "Email me",
              textScaleFactor: 1.3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
          ListTile(
            minLeadingWidth: 40,
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.purple,
            ),
            title: Text(
              "Settings",
              textScaleFactor: 1.3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget bottomSheet() {
  //   return Container(
  //     height: 100,
  //     width: MediaQuery.of(context).size.width,
  //     margin: EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 20,
  //     ),
  //     child: Column(
  //       children: <Widget>[
  //         Text(
  //           "Choose Profile Photo",
  //           style: TextStyle(
  //             fontSize: 20,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //         Row(
  //           children: <Widget>[
  //             ElevatedButton(onPressed: () {}, child: Icon(Icons.camera)
  //             ,
  //             ),

  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
}
