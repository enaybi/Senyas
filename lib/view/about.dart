import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 127, 216, 189),
        title: const Text('About Us',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                'This is a thesis project created by BS Information Technology students from CICT-WVSU. S.Y 2023-2024 in partnership with the BSNED.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              const Text(
                'DEVELOPERS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Clysel Precious Abantao\nLaurenze Mae Erribal\nTracy Marie Andrea Madresta\nGianne Peralta\nNiv Joy Solis',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
