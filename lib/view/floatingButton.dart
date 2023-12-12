import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:senyas/view/chatpad.dart';
import 'package:senyas/view/home.dart';
import 'package:senyas/view/library_screen.dart';
import 'package:senyas/view/searchscreen.dart';

class FloatingButton extends StatelessWidget {
  final VoidCallback onCameraButtonPressed;

  const FloatingButton({Key? key, required this.onCameraButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 200,
        height: 60,
        margin: EdgeInsets.only(bottom: 20, left: 50, right: 20),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchScreen()),
                  );
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: SvgPicture.asset(
                  'assets/library.svg',
                  width: 45,
                  height: 45,
                ),
              ),
              FloatingActionButton(
                onPressed: onCameraButtonPressed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: SvgPicture.asset(
                  'assets/camera.svg',
                  width: 45,
                  height: 45,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Chatpad()),
                  );
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: SvgPicture.asset(
                  'assets/chatpad.svg',
                  width: 45,
                  height: 45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
