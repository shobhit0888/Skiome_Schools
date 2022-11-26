import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              margin: EdgeInsets.zero,
              accountName: Text("Shobhit Gupta"), 
              accountEmail: Text("shogupt2002@gmail.com"), 
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile_image.png"),
              )
              ),
              
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
              color: Colors.purple,
              ),
              title: Text("Home",textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.purple,
              ),),
              
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
              color: Colors.purple,
              ),
              title: Text("Profile",textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.purple,
              ),),
              
            ),
             
             ListTile(
              leading: Icon(
                CupertinoIcons.mail,
              color: Colors.purple,
              ),
              title: Text("Email me",textScaleFactor: 1.2,
              style: TextStyle(
                color: Colors.purple,
              ),),
              
            ),
             
        ],
      ),
    );
  }
}