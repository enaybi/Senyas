class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Welcome to Senyas!",
    image: "assets/screen_01.png",
    desc: "Experience real-time sign language recognition and communication.",
  ),
  OnboardingContents(
    title: " Learn and Communicate in \n Sign Language",
    image: "assets/screen_02.png",
    desc:
        "Access a comprehensive library of sign language gestures and phrases.",
  ),
  OnboardingContents(
    title: " Explore Sign Language",
    image: "assets/screen_03.png",
    desc:
        "Easily search for words and discover their corresponding sign language gestures.",
  ),
];
