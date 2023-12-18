import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  final Color logoBlue = Color.fromARGB(255, 127, 216, 189);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: logoBlue,
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/abus.png',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'MEET THE TEAM BEHIND SENYAS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              _buildDeveloperItem(
                'Clysel Precious Abantao',
                'Sign Language Illustrator',
                'assets/developers/developer1.jpg',
              ),
              const SizedBox(height: 20),
              _buildDeveloperItem(
                'Tracy Marie Andrea Madresta',
                'Database Administrator',
                'assets/developers/developer3.jpg',
              ),
              const SizedBox(height: 20),
              _buildDeveloperItem(
                'Gianne Peralta',
                'Documentation Specialist',
                'assets/developers/developer4.jpg',
              ),
              const SizedBox(height: 20),
              _buildDeveloperItem(
                'Niv Joy Solis',
                'UI/UX Designer',
                'assets/developers/developer5.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeveloperItem(String name, String role, String imageAsset) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imageAsset),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              role,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
