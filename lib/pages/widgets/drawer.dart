import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://images.unsplash.com/photo-1653994455748-4b186b6b4e6e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80";
    ;
    return Drawer(
      child: Container(
        color: Colors.green[100],
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Awnish Kumar"),
              accountEmail: Text("awnishsinha462@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
              ),
              title: Text("Home",textScaleFactor: 1.2,),
              
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
              ),
              title: Text("Profile",textScaleFactor: 1.2,),
              
            ),
          
            ListTile(
              leading: Icon(
                CupertinoIcons.bell,
              ),
              title: Text("Notification",textScaleFactor: 1.2,),
              
            ),
              ListTile(
              leading: Icon(
                CupertinoIcons.settings_solid,
              ),
              title: Text("Setting",textScaleFactor: 1.2,),
              
            ),
          ],

        ),
      ),
    );
  }
}
