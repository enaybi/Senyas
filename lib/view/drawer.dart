import 'package:flutter/material.dart'
    show
        BoxDecoration,
        BuildContext,
        Color,
        Colors,
        Drawer,
        DrawerHeader,
        EdgeInsets,
        Image,
        ListTile,
        ListView,
        MaterialPageRoute,
        Navigator,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:senyas/view/about.dart';
import 'package:senyas/view/instruction.dart';
import 'package:senyas/view/library_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isDrawerOpen = false;

  void onPressedInstruction(BuildContext context) {
    if (isDrawerOpen) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InstructionScreen()),
      );
    } else {
      // Handle the case when the drawer is closed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/logo.png',
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListTile(
              title: Text(
                'Library',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Color(0xff5981AC),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LibraryScreen()),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListTile(
              title: Text(
                'User Instruction',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Color(0xff5981AC),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InstructionScreen()),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListTile(
              title: Text(
                'About',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Color(0xff5981AC),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
