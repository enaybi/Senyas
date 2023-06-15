import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../model/library_content.dart';
import 'chatpad.dart';
import 'drawer.dart';
import 'library_alphabeth_details_screen.dart';
import 'look_screen.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 127, 216, 189),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(
                    color: Colors.transparent,
                    thickness: 1.0,
                    indent: 16.0,
                    endIndent: 16.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Learn Basic Sign Language',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(
                              color: Colors.transparent,
                              thickness: 1.0,
                              indent: 16.0,
                              endIndent: 16.0,
                            ),
                            Text(
                              'Learning Courses',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            ),
                            Divider(
                              color: Colors.transparent,
                            ),
                            SizedBox(height: 16.0),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: libraryContents.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      right: 16.0,
                                      bottom: 100.0,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                LibraryAlphabethDetailsScreen(
                                              category:
                                                  libraryContents[index].title,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 300.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  libraryContents[index].image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 8.0,
                                                bottom: 8.0,
                                              ),
                                              child: Text(
                                                libraryContents[index].title,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 8.0,
                                                bottom: 8.0,
                                              ),
                                              child: Text(
                                                libraryContents[index].desc,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
                    Navigator.pop(context);
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
