import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 127, 216, 189),
        title: Text('About Us',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 50),
              Text(
                'This is a thesis project created by BS Information Technology students from CICT-WVSU. S.Y 2023-2024 in partnership with the BSNED.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Text(
                'DEVELOPERS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
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
