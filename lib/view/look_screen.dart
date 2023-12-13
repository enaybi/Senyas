// import 'package:flutter/material.dart';
// import 'library_details_data.dart';

// class LookScreen extends StatefulWidget {
//   @override
//   _LookScreenState createState() => _LookScreenState();
// }

// class _LookScreenState extends State<LookScreen> {
//   String searchTerm = '';
//   LibraryDetail? searchResult;

//   void searchLibraryDetails(String query) {
//     if (query.isEmpty) {
//       setState(() {
//         searchResult = null;
//       });
//     } else {
//       final List<LibraryDetail> allDetails =
//           libraryDetails.values.expand((details) => details).toList();
//       final List<LibraryDetail> results = allDetails
//           .where((detail) =>
//               detail.title.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//       setState(() {
//         if (results.isNotEmpty) {
//           searchResult = results.first;
//         } else {
//           searchResult = null;
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (value) {
//                 setState(() {
//                   searchTerm = value;
//                 });
//                 searchLibraryDetails(value);
//               },
//               decoration: const InputDecoration(
//                 labelText: 'Search',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               color: Colors.grey[200],
//               child: Center(
//                 child: searchResult != null
//                     ? SizedBox(
//                         width: 300.0,
//                         height: 400.0,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(40.0),
//                           child: Card(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   searchResult!.imagePath,
//                                   width: 150.0,
//                                   height: 150.0,
//                                 ),
//                                 const SizedBox(height: 8.0),
//                                 Text(
//                                   searchResult!.title,
//                                   style: const TextStyle(
//                                     fontSize: 16.0,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       )
//                     : const Text(
//                         'Search Results',
//                         style: TextStyle(fontSize: 24),
//                       ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
