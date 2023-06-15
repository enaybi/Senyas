import 'package:flutter/material.dart';
import '../model/library_alphabeth_data.dart';

class LibraryAlphabethDetailsScreen extends StatelessWidget {
  final String category;

  LibraryAlphabethDetailsScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final details = libraryDetails[category];

    if (details == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(category),
        ),
        body: Center(
          child: Text('No details found for $category'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(details.length, (index) {
          final detail = details[index];
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  detail.imagePath,
                  width: 60.0,
                  height: 60.0,
                ),
                SizedBox(height: 8.0),
                Text(
                  detail.title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
