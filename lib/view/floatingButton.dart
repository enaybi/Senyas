import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:senyas/view/chatpad.dart';
import 'package:senyas/view/library_screen.dart';
import 'package:senyas/view/look_screen.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key, required floatingActionButton});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingButton(
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 250,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LookScreen()),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LibraryScreen()),
                    );
                  },
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
      ),
    );
  }
}
