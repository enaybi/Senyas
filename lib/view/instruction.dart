import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InstructionScreen extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          child: ListView(
            children: [
              const Text(
                'Welcome to Senyas!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'This user instruction guide will help you navigate through the various features and functionalities of the app. Let\'s get started!',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '1. Onboarding Screen:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SvgPicture.asset(
                    'assets/onboardingscreen.svg',
                    width: constraints.maxWidth,
                  );
                },
              ),
              const SizedBox(height: 8),
              const Text(
                'When you open the Senyas app for the first time, you will be directed to the onboarding screen.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'The onboarding screen consists of three screens that provide information about Senyas.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'At the bottom of each screen, you will find two options: "Skip" and "Next."',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'If you want to skip the onboarding screens and proceed to the homepage, tap on the "Skip" button.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '2. Camera Access Permission:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Before being directed to the homepage, Senyas will request permission to access your device\'s camera.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'Granting camera access is necessary for utilizing the app\'s features effectively.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'Once you allow access, you will be directed to the Senyas homepage.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SvgPicture.asset(
                    'assets/access.svg',
                    width: constraints.maxWidth,
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text(
                '3. Homepage Navigation:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Upon reaching the homepage, you will find a floating navigation bar at the bottom of the screen.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'This navigation bar consists of three icons: sign language icon, camera icon, and message icon.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SvgPicture.asset(
                    'assets/navbar.svg',
                    width: constraints.maxWidth,
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text(
                '4. Sign Language Search:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'To search for a Filipino sign language, tap on the sign language icon (represented by a hand sign).',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'This will take you to the search feature, where you can input keywords or phrases to find the corresponding sign.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'Use this feature to learn and explore different sign language translations.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '5. Homepage Return:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'If you wish to return to the homepage from any section of the app, tap on the camera icon.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'This will take you back to the homepage, allowing you to access other features and functionalities.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '6. Chatpad Access:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'To access the chatpad feature, tap on the message icon (represented by a speech bubble).',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'This will navigate you to the chatpad, where you can communicate with other Senyas app users.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                '7. Drawer Menu:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'In the upper-left corner of the screen, you will find a drawer icon (usually represented by three horizontal lines).',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tapping on the drawer icon will open a menu with three shortcut options: library, user instructions, and about page.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SvgPicture.asset(
                    'assets/drawer.svg',
                    width: constraints.maxWidth,
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text(
                '8. Library:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'The library section provides additional resources related to sign language.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SvgPicture.asset(
                    'assets/sign.svg',
                    width: constraints.maxWidth,
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text(
                '9. User Instruction:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                'The user instructions section offers guidance and support on using the Senyas app.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SvgPicture.asset(
                    'assets/userinstruction.svg',
                    width: constraints.maxWidth,
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text(
                '16. About:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text(
                'The about page provides information about the app, its developers, and any other relevant details.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SvgPicture.asset(
                    'assets/aboutus.svg',
                    width: constraints.maxWidth,
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'That\'s it!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'You are now equipped with the necessary knowledge to navigate and utilize the Senyas application effectively.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enjoy learning and communicating through Filipino sign language!',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
