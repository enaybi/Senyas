import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InstructionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> instructionPages = [
    {
      'imagePath': 'assets/userinstructions/loading_screen.svg',
      'title': 'LOADING SCREEN',
      'subtitle':
          'As the app loads, our logo screen emerges, signaling the commencement of user engagement.',
    },
    {
      'imagePath': 'assets/userinstructions/onboarding_screen1.svg',
      'title': 'ONBOARDING SCREEN',
      'subtitle':
          'When you open the Senyas app for the first time, you will be directed to the onboarding screen.',
    },
    {
      'imagePath': 'assets/userinstructions/onboarding_screen2.svg',
      'title': 'ONBOARDING SCREEN',
      'subtitle':
          'It consists of three screens that provide information about Senyas.',
    },
    {
      'imagePath': 'assets/userinstructions/onboarding_screen3.svg',
      'title': 'ONBOARDING SCREEN',
      'subtitle':
          'At the bottom of each screen, you will find "Skip" and "Next" options. To skip the onboarding and go to the homepage, tap "Skip".',
    },
    {
      'imagePath': 'assets/userinstructions/access.svg',
      'title': 'CAMERA ACCESS PERMISSION',
      'subtitle':
          'Before reaching the homepage, Senyas will request camera access. Once you allow access, you will be directed to the Senyas homepage.',
    },
    {
      'imagePath': 'assets/userinstructions/navbar.svg',
      'title': 'HOMEPAGE NAVIGATION',
      'subtitle':
          'On the homepage, you will find a floating navigation bar at the bottom. It has three icons: Search bar, Camera, and Chatpad. Use them to navigate.',
    },
    {
      'imagePath': 'assets/userinstructions/searchbar.svg',
      'title': 'SEARCH BAR',
      'subtitle':
          'To search for a Filipino sign language, tap on the sign language icon (represented by a hand sign.',
    },
    {
      'imagePath': 'assets/userinstructions/homepagereturn.svg',
      'title': 'HOMEPAGE RETURN',
      'subtitle':
          'If you wish to return to the homepage from any section of the app, tap on the camera icon. This will take you back to the homepage, allowing you to access other features and functionalities.',
    },
    {
      'imagePath': 'assets/userinstructions/chatpadaccess.svg',
      'title': 'CHATPAD',
      'subtitle':
          'This will navigate you to the chatpad for text-based messages, where you can communicate with other Senyas app users.',
    },
    {
      'imagePath': 'assets/userinstructions/drawermenu.svg',
      'title': 'DRAWER MENU',
      'subtitle':
          'In the upper-left corner, you will find a drawer icon. Tapping it opens a menu with three shortcuts: library, user instructions, and about page.',
    },
    {
      'imagePath': 'assets/userinstructions/library.svg',
      'title': 'LIBRARY',
      'subtitle':
          'The library section offers additional sign language resources.',
    },
    {
      'imagePath': 'assets/userinstructions/userinstruction.svg',
      'title': 'USER INSTRUCTION',
      'subtitle': 'This section provides guidance on using the Senyas app.',
    },
    {
      'imagePath': 'assets/userinstructions/aboutus.svg',
      'title': 'ABOUT US',
      'subtitle':
          'The about page provides information about the app and its developers.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 127, 216, 189),
        title: Text(
          'User Instruction',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: PageView.builder(
        itemCount: instructionPages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  instructionPages[index]['imagePath'],
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                const SizedBox(height: 16),
                Text(
                  instructionPages[index]['title'],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  instructionPages[index]['subtitle'],
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
