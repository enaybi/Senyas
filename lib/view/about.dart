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
                  'assets/logo.png',
                  width: 120,
                  height: 120,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      'This is a thesis project created by BS Information Technology students from CICT-WVSU. S.Y 2023-2024 in partnership with the BSNED.',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Senyas is an innovative mobile application designed to empower individuals with hearing disabilities by providing real-time sign language detection and translation.',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Our mission is to bridge communication gaps and promote inclusivity by making sign language accessible to everyone. With Senyas, you can communicate with the deaf and hard of hearing community effortlessly.',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Join us in our journey to create a more inclusive world where communication knows no boundaries!',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
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
                'Designer',
                'assets/developer1.jpg',
              ),
              const SizedBox(height: 20),
              _buildDeveloperItem(
                'Laurenze Mae Erribal',
                'Developer',
                'assets/developer2.jpg',
              ),
              const SizedBox(height: 20),
              _buildDeveloperItem(
                'Tracy Marie Andrea Madresta',
                'Developer',
                'assets/developer3.jpg',
              ),
              const SizedBox(height: 20),
              _buildDeveloperItem(
                'Gianne Peralta',
                'Designer',
                'assets/developer4.jpg',
              ),
              const SizedBox(height: 20),
              _buildDeveloperItem(
                'Niv Joy Solis',
                'UI/UX Designer',
                'assets/developer5.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeveloperItem(String name, String role, String imageAsset) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
