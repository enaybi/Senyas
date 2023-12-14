class LibraryContent {
  final String title;
  final String desc;
  final String image;

  LibraryContent(
      {required this.title, required this.desc, required this.image});
}

final List<LibraryContent> libraryContents = [
  LibraryContent(
    title: 'Alphabets',
    desc: 'Learn the sign language alphabets',
    image: 'assets/classes/alphabets.svg',
  ),
  LibraryContent(
    title: 'Numbers',
    desc: 'Learn sign language numbers',
    image: 'assets/classes/numbers.svg',
  ),
  LibraryContent(
    title: 'Family Tree',
    desc: 'Learn the signs for family members',
    image: 'assets/classes/familytree.svg',
  ),
  LibraryContent(
    title: 'Pointing Movements',
    desc: 'Learn how to use pointing gestures in sign language',
    image: 'assets/classes/pointingmovements.svg',
  ),
  LibraryContent(
    title: 'Basic Adjectives/Adverbs',
    desc: 'Learn basic adjectives and adverbs in sign language',
    image: 'assets/classes/adjectivesadverbs.svg',
  ),
  LibraryContent(
    title: 'Emotions',
    desc: 'Learn how to express emotions in sign language',
    image: 'assets/classes/emotions.svg',
  ),
  LibraryContent(
    title: 'Basic Questions',
    desc: 'Learn the sign language for basic questions',
    image: 'assets/classes/basicquestions.svg',
  ),
  LibraryContent(
    title: 'Greetings',
    desc: 'Learn how to greet in sign language',
    image: 'assets/classes/greetings.svg',
  ),
  LibraryContent(
    title: 'Survival Words',
    desc: 'Learn sign language survival words',
    image: 'assets/classes/survivalwords.svg',
  ),
  LibraryContent(
    title: 'Colors',
    desc: 'Learn sign language colors',
    image: 'assets/classes/colors.svg',
  ),
];
