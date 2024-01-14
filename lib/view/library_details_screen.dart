import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'library_details_data.dart';
import 'package:senyas/service/database_helper.dart';
import 'package:senyas/service/data_model.dart';

class LibraryDetailsScreen extends StatefulWidget {
  final String category;
  const LibraryDetailsScreen({super.key, required this.category});

  @override
  State<LibraryDetailsScreen> createState() => _LibraryDetailsScreenState();
}

class _LibraryDetailsScreenState extends State<LibraryDetailsScreen> {
  List<FslClass> searchResults = [];
  @override
  void initState() {
    _performSearch();
    // TODO: implement initState
    super.initState();
  }

  void _performSearch() async {
    final dbHelper = DatabaseHelper();
    final results = await dbHelper.searchCategory(widget.category);
    // print("help");
    // print(results);
    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 127, 216, 189),
        title: Text(
          "Library Category",
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final detail = searchResults[index];
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final cardWidth = constraints.maxWidth;
              final imageWidth = cardWidth * 0.6;
              final imageHeight = imageWidth * (4 / 3);
              final textSize = 20.0;

              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      detail.imagePath,
                      width: imageWidth,
                      height: imageHeight,
                    ),
                    Text(
                      detail.imageName,
                      style: TextStyle(
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        itemCount: searchResults.length,
      ),
    );
  }
}

// class LibraryDetailsScreen extends StatelessWidget {
//   final String category;

//   LibraryDetailsScreen({required this.category});

//   @override
//   Widget build(BuildContext context) {
//     final List<LibraryDetail>? details = libraryDetails[category];

//     if (details == null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(category),
//         ),
//         body: Center(
//           child: Text('No details found for $category'),
//         ),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           category,
//           style: TextStyle(
//             fontSize: 24.0,
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           GridView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 16.0,
//               mainAxisSpacing: 16.0,
//             ),
//             itemBuilder: (BuildContext context, int index) {
//               final detail = details[index];
//               return LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints constraints) {
//                   final cardWidth = constraints.maxWidth;
//                   final imageWidth = cardWidth * 0.6;
//                   final imageHeight = imageWidth * (4 / 3);
//                   final textSize = 20.0;

//                   return Card(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Image.asset(
//                           detail.imagePath,
//                           width: imageWidth,
//                           height: imageHeight,
//                         ),
//                         Text(
//                           detail.title,
//                           style: TextStyle(
//                             fontSize: textSize,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//             itemCount: details.length,
//           ),
//         ],
//       ),
//     );
//   }
// }
