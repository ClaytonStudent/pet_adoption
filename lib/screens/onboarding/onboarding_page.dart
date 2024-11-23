import 'package:flutter/material.dart';
import 'package:cat_adoption/screens/onboarding/onboarding_page_1.dart';
import 'package:cat_adoption/screens/onboarding/onboarding_page_2.dart';
import 'package:cat_adoption/screens/onboarding/onboarding_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          // Dot indicators
          Container(
              alignment: Alignment(0, 0.75),
              child: SmoothPageIndicator(controller: _controller, count: 3)),
        ],
      ),
    );
  }
}
