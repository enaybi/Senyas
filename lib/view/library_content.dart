class LibraryContent {
  final String title;
  final String image;
  final String desc;

  LibraryContent({
    required this.title,
    required this.image,
    required this.desc,
  });

  String? get imagePath => null;
}

List<LibraryContent> libraryContents = [
  LibraryContent(
    title: "Learn Basic",
    image: "assets/alphabets.svg",
    desc: "Alphabets",
  ),
  LibraryContent(
    title: "Learn Basic",
    image: "assets/numbers.svg",
    desc: "Numbers",
  ),
  LibraryContent(
    title: "Learn Basic",
    image: "assets/familytree.svg",
    desc: "Family Tress",
  ),
];
