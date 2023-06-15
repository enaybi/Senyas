import 'package:flutter/material.dart';
import 'library_details_data.dart';

class LibraryDetailsScreen extends StatelessWidget {
  final String category;

  LibraryDetailsScreen({required this.category});

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
                  width: 100.0,
                  height: 100.0,
                ),
                SizedBox(height: 50.0),
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
