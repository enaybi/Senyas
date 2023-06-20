import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InstructionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 127, 216, 189),
        title: const Text('Instruction',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'How to use the app:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1. Click the green button after loading the screen.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '2. You are now directed to the homepage camera frame. In order to accurately detect the FSL, place the camera on a well-lit environment with the user\'s hand showing just like this:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  'assets/green.svg',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/mainscreen.svg',
                  width: 200,
                  height: 200,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '3. If a green box appeared and showed the words, it means it can detect the hand sign language.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '4. Press the 3-line icon to see the library, user instructions, and about us.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '- Library: where you can find different FSL categories.',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                      Text(
                        '- About us: information about the developers.',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    '5. Press the circular arrows to change the camera from front to back and vice-versa.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SvgPicture.asset(
                  'assets/rotate.svg',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/navbar.svg',
                        width: double.infinity,
                        height: 180,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '6. Press the sign language icon when you want to search for a Filipino sign language.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '7. Press the camera icon if you want to go back to the homepage.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '8. Press the message icon to navigate to the chatpad.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
