class LibraryCategory {
  final String name;
  final String imagePath;
  final String category;

  LibraryCategory(
      {required this.name, required this.imagePath, required this.category});
}

final List<LibraryCategory> libraryCategories = [
  LibraryCategory(
    name: 'Alphabets',
    imagePath: 'assets/classes/alphabets.svg',
    category: 'Alphabet',
  ),
  LibraryCategory(
    name: 'Number',
    imagePath: 'assets/classes/numbers.svg',
    category: 'Number',
  ),
  LibraryCategory(
    name: 'Basic Adjective',
    imagePath: 'assets/classes/adjectivesadverbs.svg',
    category: 'Basic Adjective',
  ),
  LibraryCategory(
    name: 'Basic Question',
    imagePath: 'assets/classes/basicquestions.svg',
    category: 'Basic Question',
  ),
  LibraryCategory(
    name: 'Family Tree',
    imagePath: 'assets/classes/familytree.svg',
    category: 'Family Tree',
  ),
  LibraryCategory(
    name: 'Greeting',
    imagePath: 'assets/classes/greetings.svg',
    category: 'Greeting',
  ),
  LibraryCategory(
    name: 'Pointing',
    imagePath: 'assets/classes/pointingmovements.svg',
    category: 'Pointing',
  ),
  LibraryCategory(
    name: 'Survival Words',
    imagePath: 'assets/classes/survivalwords.svg',
    category: 'Survival Word',
  ),
];
