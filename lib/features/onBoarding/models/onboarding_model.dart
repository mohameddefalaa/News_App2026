class OnboardingModel {
  OnboardingModel({
    required this.title,
    required this.desc,
    required this.imagePath,
  });
  final String title;
  final String desc;
  final String imagePath;

  static List<OnboardingModel> onboardingData = [
    OnboardingModel(
      title: "Trending News ",
      desc:
          "Stay in the loop with the biggest breaking stories in a stunning visual slider. Just swipe to explore what’s trending right now!",
      imagePath: 'assets/images/onboarding1.png',
    ),
    OnboardingModel(
      title: "Pick What You Love",
      desc:
          "No more endless scrolling! Tap into your favorite topics like Tech, Politics, or Sports and get personalized news in seconds",

      imagePath: 'assets/images/onboarding2.png',
    ),
    OnboardingModel(
      title: 'Save It. Read It Later. Stay Smart.',
      desc:
          "Found something interesting? Tap the bookmark and come back to it anytime. Never lose a great read again!",

      imagePath: 'assets/images/onboarding3.png',
    ),
  ];
}
