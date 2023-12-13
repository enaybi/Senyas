class LibraryCategory {
  final String name;
  final String imagePath;

  LibraryCategory({required this.name, required this.imagePath});
}

final List<LibraryCategory> libraryCategories = [
  LibraryCategory(
    name: 'Alphabets',
    imagePath: 'assets/classes/alphabets.svg',
  ),
  LibraryCategory(
    name: 'Number',
    imagePath: 'assets/classes/numbers.svg',
  ),
  LibraryCategory(
    name: 'Basic Adjective',
    imagePath: 'assets/classes/adjectivesadverbs.svg',
  ),
  LibraryCategory(
    name: 'Basic Question',
    imagePath: 'assets/classes/basicquestions.svg',
  ),
  LibraryCategory(
    name: 'Family Tree',
    imagePath: 'assets/classes/familytree.svg',
  ),
  LibraryCategory(
    name: 'Greeting',
    imagePath: 'assets/classes/greetings.svg',
  ),
  LibraryCategory(
    name: 'Pointing',
    imagePath: 'assets/classes/pointingmovements.svg',
  ),
  LibraryCategory(
    name: 'Survival Words',
    imagePath: 'assets/classes/survivalwords.svg',
  ),
];
