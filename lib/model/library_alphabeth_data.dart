class LibraryAlphabethDetail {
  final String title;
  final String imagePath;

  LibraryAlphabethDetail({required this.title, required this.imagePath});
}

final Map<String, List<LibraryAlphabethDetail>> libraryDetails = {
  'Learn Basic': [
    LibraryAlphabethDetail(
      title: 'A',
      imagePath: 'A.png',
    ),
    LibraryAlphabethDetail(
      title: 'B',
      imagePath: 'B.png',
    ),
    LibraryAlphabethDetail(
      title: 'C',
      imagePath: 'C.png',
    ),
    LibraryAlphabethDetail(
      title: 'D',
      imagePath: 'D.png',
    ),
    LibraryAlphabethDetail(
      title: 'E',
      imagePath: 'E.png',
    ),
    LibraryAlphabethDetail(
      title: 'F',
      imagePath: 'F.png',
    ),
  ],
};
