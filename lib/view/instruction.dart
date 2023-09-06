import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InstructionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> instructionPages = [
    {
      'imagePath': 'assets/onboarding_screen.svg',
      'text':
          'ONBOARDING SCREEN \n When you open the Senyas app for the first time, you will be directed to the onboarding screen.',
    },
    {
      'imagePath': 'assets/onboarding_screen.svg',
      'text':
          'ONBOARDING SCREEN \n It consists of three screens that provide information about Senyas.',
    },
    {
      'imagePath': 'assets/onboarding_screen.svg',
      'text':
          'ONBOARDING SCREEN \n At the bottom of each screen, you will find "Skip" and "Next" options. To skip the onboarding and go to the homepage, tap "Skip".',
    },
    {
      'imagePath': 'assets/access.svg',
      'text':
          '2. Camera Access Permission:\nBefore reaching the homepage, Senyas will request camera access. Once you allow access, you will be directed to the Senyas homepage.',
    },
    {
      'imagePath': 'assets/navbar.svg',
      'text':
          '3. Homepage Navigation:\nOn the homepage, you will find a floating navigation bar at the bottom. It has three icons: sign language, camera, and message. Use them to navigate.',
    },
    {
      'imagePath': 'assets/navbar.svg',
      'text':
          'SEARCH BAR \n To search for a Filipino sign language, tap on the sign language icon (represented by a hand sign',
    },
    {
      'imagePath': 'assets/navbar.svg',
      'text':
          'HOMEPAGE RETURN \n If you wish to return to the homepage from any section of the app, tap on the camera icon. This will take you back to the homepage, allowing you to access other features and functionalities.',
    },
    {
      'imagePath': 'assets/navbar.svg',
      'text':
          'CHATPAD ACCESS \n This will navigate you to the chatpad for text-based messages, where you can communicate with other Senyas app users.',
    },
    {
      'imagePath': 'assets/drawer.svg',
      'text':
          '7. Drawer Menu:\nIn the upper-left corner, you will find a drawer icon. Tapping it opens a menu with three shortcuts: library, user instructions, and about page.',
    },
    {
      'imagePath': 'assets/library.svg',
      'text':
          '8. Library:\nThe library section offers additional sign language resources.',
    },
    {
      'imagePath': 'assets/user_instruction.svg',
      'text':
          '9. User Instruction:\nThis section provides guidance on using the Senyas app.',
    },
    {
      'imagePath': 'assets/aboutus.svg',
      'text':
          '10. About:\nThe about page provides information about the app and its developers.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 127, 216, 189),
        title: const Text(
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
                  instructionPages[index]['text'],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
