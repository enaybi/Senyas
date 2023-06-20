import 'package:flutter/material.dart';
import 'package:senyas/view/onboarding_contents.dart';
import 'package:senyas/view/size_config.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List<Color> colors = const [
    Color.fromARGB(255, 127, 216, 189),
    Color.fromARGB(255, 127, 216, 189),
    Color.fromARGB(255, 127, 216, 189),
  ];

  AnimatedContainer _buildDots({
    required int index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: _currentPage == index
            ? const Color(0xFF000000)
            : Colors.transparent,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig

    double titleFontSize = SizeConfig.textMultiplier * 3;
    double descFontSize = SizeConfig.textMultiplier * 2;
    double buttonTextFontSize = SizeConfig.textMultiplier * 1.5;

    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _controller,
                      onPageChanged: (value) =>
                          setState(() => _currentPage = value),
                      itemCount: contents.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: EdgeInsets.all(
                              SizeConfig.blockSizeHorizontal * 5),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical * 5),
                                child: Text(
                                  contents[i].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Mulish",
                                    fontWeight: FontWeight.bold,
                                    fontSize: titleFontSize,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                contents[i].desc,
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontWeight: FontWeight.normal,
                                  fontSize: descFontSize,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: SizeConfig.blockSizeVertical * 8.2,
                              ),
                              Center(
                                child: Image.asset(
                                  contents[i].image,
                                  height: SizeConfig.imageSizeMultiplier * 64.2,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: SizeConfig.blockSizeVertical * 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (int index) => _buildDots(
                          index: index,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: SizeConfig.blockSizeVertical * 2),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockSizeHorizontal * 10,
                      vertical: SizeConfig.blockSizeVertical * 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context,
                              '/home'); // Go directly to the home screen
                        },
                        child: const Text(
                          "SKIP",
                          style: TextStyle(color: Colors.black87),
                        ),
                        style: TextButton.styleFrom(
                          elevation: 0,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: buttonTextFontSize,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_currentPage + 1 == contents.length) {
                            // Handle the "START" button action
                            Navigator.pushReplacementNamed(context, '/home');
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        child: Text(
                          _currentPage + 1 == contents.length
                              ? "START"
                              : "NEXT",
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 10,
                            vertical: SizeConfig.blockSizeVertical * 3,
                          ),
                          textStyle: TextStyle(fontSize: buttonTextFontSize),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
