class LibraryContent {
  final String title;
  final String desc;
  final String image;
  final String category;

  LibraryContent(
      {required this.title,
      required this.desc,
      required this.image,
      required this.category});
}

final List<LibraryContent> libraryContents = [
  LibraryContent(
    title: 'Alphabets',
    desc: 'Learn the sign language alphabets',
    image: 'assets/classes/alphabets.svg',
    category: 'Alphabet',
  ),
  LibraryContent(
    title: 'Numbers',
    desc: 'Learn sign language numbers',
    image: 'assets/classes/numbers.svg',
    category: 'Number',
  ),
  LibraryContent(
    title: 'Family Tree',
    desc: 'Learn the signs for family members',
    image: 'assets/classes/familytree.svg',
    category: 'Family Tree',
  ),
  LibraryContent(
    title: 'Pointing Movements',
    desc: 'Learn how to use pointing gestures in sign language',
    image: 'assets/classes/pointingmovements.svg',
    category: 'Pointing',
  ),
  LibraryContent(
    title: 'Basic Adjectives/Adverbs',
    desc: 'Learn basic adjectives and adverbs in sign language',
    image: 'assets/classes/adjectivesadverbs.svg',
    category: 'Basic Adjective',
  ),
  LibraryContent(
    title: 'Basic Questions',
    desc: 'Learn the sign language for basic questions',
    image: 'assets/classes/basicquestions.svg',
    category: 'Basic Question',
  ),
  LibraryContent(
    title: 'Greetings',
    desc: 'Learn how to greet in sign language',
    image: 'assets/classes/greetings.svg',
    category: 'Greeting',
  ),
  LibraryContent(
    title: 'Survival Words',
    desc: 'Learn sign language survival words',
    image: 'assets/classes/survivalwords.svg',
    category: 'Survival Word',
  ),
];
