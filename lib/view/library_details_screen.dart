import 'package:flutter/material.dart';
import 'library_details_data.dart';

class LibraryDetailsScreen extends StatelessWidget {
  final String category;

  LibraryDetailsScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<LibraryDetail>? details = libraryDetails[category];

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
        padding: EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: details.map((detail) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  detail.imagePath,
                  width: 100.0,
                  height: 100.0,
                ),
                SizedBox(height: 8.0),
                Text(
                  detail.title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
