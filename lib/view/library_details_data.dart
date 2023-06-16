class LibraryDetail {
  final String title;
  final String imagePath;

  LibraryDetail({required this.title, required this.imagePath});
}

final Map<String, List<LibraryDetail>> libraryDetails = {
  'Alphabets': [
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
  ],
  'Numbers': [
    LibraryDetail(
      title: '1',
      imagePath: '1.png',
    ),
    LibraryDetail(
      title: '2',
      imagePath: '2.png',
    ),
    LibraryDetail(
      title: '3',
      imagePath: '3.png',
    ),
  ],
  'Family Tree': [
    LibraryDetail(
      title: 'Father',
      imagePath: 'father.png',
    ),
    LibraryDetail(
      title: 'Mother',
      imagePath: 'mother.png',
    ),
    LibraryDetail(
      title: 'Child',
      imagePath: 'child.png',
    ),
  ],
  'Pointing Movements': [
    LibraryDetail(
      title: 'Pointing Left',
      imagePath: 'point_left.png',
    ),
    LibraryDetail(
      title: 'Pointing Right',
      imagePath: 'point_right.png',
    ),
    LibraryDetail(
      title: 'Pointing Up',
      imagePath: 'point_up.png',
    ),
  ],
  'Basic Adjectives/Adverbs': [
    LibraryDetail(
      title: 'Good',
      imagePath: 'good.png',
    ),
    LibraryDetail(
      title: 'Bad',
      imagePath: 'bad.png',
    ),
    LibraryDetail(
      title: 'Fast',
      imagePath: 'fast.png',
    ),
  ],
  'Time': [
    LibraryDetail(
      title: 'Morning',
      imagePath: 'morning.png',
    ),
    LibraryDetail(
      title: 'Afternoon',
      imagePath: 'afternoon.png',
    ),
    LibraryDetail(
      title: 'Evening',
      imagePath: 'evening.png',
    ),
  ],
  'Sweeping Movements': [
    LibraryDetail(
      title: 'Sweep Left',
      imagePath: 'sweep_left.png',
    ),
    LibraryDetail(
      title: 'Sweep Right',
      imagePath: 'sweep_right.png',
    ),
    LibraryDetail(
      title: 'Sweep Up',
      imagePath: 'sweep_up.png',
    ),
  ],
  'Emotions': [
    LibraryDetail(
      title: 'Happy',
      imagePath: 'happy.png',
    ),
    LibraryDetail(
      title: 'Sad',
      imagePath: 'sad.png',
    ),
    LibraryDetail(
      title: 'Angry',
      imagePath: 'angry.png',
    ),
  ],
  'Basic Questions': [
    LibraryDetail(
      title: 'Who',
      imagePath: 'who.png',
    ),
    LibraryDetail(
      title: 'What',
      imagePath: 'what.png',
    ),
    LibraryDetail(
      title: 'Where',
      imagePath: 'where.png',
    ),
  ],
  'Greetings': [
    LibraryDetail(
      title: 'Hello',
      imagePath: 'hello.png',
    ),
    LibraryDetail(
      title: 'Good Morning',
      imagePath: 'good_morning.png',
    ),
    LibraryDetail(
      title: 'Goodbye',
      imagePath: 'goodbye.png',
    ),
  ],
  'Survival Words': [
    LibraryDetail(
      title: 'Help',
      imagePath: 'help.png',
    ),
    LibraryDetail(
      title: 'Emergency',
      imagePath: 'emergency.png',
    ),
    LibraryDetail(
      title: 'Danger',
      imagePath: 'danger.png',
    ),
  ],
  'Body Parts': [
    LibraryDetail(
      title: 'Head',
      imagePath: 'head.png',
    ),
    LibraryDetail(
      title: 'Eyes',
      imagePath: 'eyes.png',
    ),
    LibraryDetail(
      title: 'Hands',
      imagePath: 'hands.png',
    ),
  ],
  'Colors': [
    LibraryDetail(
      title: 'Red',
      imagePath: 'red.png',
    ),
    LibraryDetail(
      title: 'Blue',
      imagePath: 'blue.png',
    ),
    LibraryDetail(
      title: 'Green',
      imagePath: 'green.png',
    ),
  ],
};
