import 'package:flutter/material.dart';
import 'package:my_app/Intro_page/intro_page1.dart';
import 'package:my_app/Intro_page/intro_page2.dart';
import 'package:my_app/Intro_page/intro_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Login_out_page/auth/main_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [IntroPage1(), IntroPage2(), IntroPage3()],
        ),
        Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      _controller.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text('Previous')),

                SmoothPageIndicator(controller: _controller, count: 3),

                // on last page or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return MainPage();
                          }));
                        },
                        child: Text('Done'))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: (Duration(milliseconds: 500)),
                              curve: Curves.easeIn);
                        },
                        child: Text('Next')),
              ],
            ))
      ],
    ));
  }
}
