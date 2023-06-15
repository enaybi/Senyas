class LibraryDetail {
  final String title;
  final String imagePath;

  LibraryDetail({required this.title, required this.imagePath});
}

final Map<String, List<LibraryDetail>> libraryDetails = {
  'Learn Basic': [
    LibraryDetail(
      title: 'A',
      imagePath: 'A.png',
    ),
    LibraryDetail(
      title: 'B',
      imagePath: 'B.png',
    ),
    LibraryDetail(
      title: 'C',
      imagePath: 'C.png',
    ),
    LibraryDetail(
      title: 'D',
      imagePath: 'D.png',
    ),
    LibraryDetail(
      title: 'E',
      imagePath: 'E.png',
    ),
    LibraryDetail(
      title: 'F',
      imagePath: 'F.png',
    ),
  ],
};
