import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../service/dbHelper.dart';

class ScreenSample extends StatelessWidget {
  ScreenSample({super.key});

  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> data = await dbHelper._fetchAllData('FSL_table');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite Data')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: dbHelper._fetchAllData('FSL_table'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Map<String, dynamic>>? data = snapshot.data;
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data![index]['imageName']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
