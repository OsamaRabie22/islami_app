import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/core/app_colors.dart';
import 'package:islami/core/styles.dart';

import '../home/home_screen.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = "IntroScreen";

  IntroScreen({super.key});

  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      titleWidget: Text("Welcome To Islmi App", style: AppStyle.titelStyle),
      body: "",
      image: Image.asset("assets/images/intro1.png"),
    ),
    PageViewModel(
      titleWidget: Text("Welcome To Islami", style: AppStyle.titelStyle),
      bodyWidget: Text(
        "We Are Very Excited To Have You In Our Community",
        style: AppStyle.bodyStyle,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro2.png"),
    ),
    PageViewModel(
      titleWidget: Text("Reading the Quran", style: AppStyle.titelStyle),
      bodyWidget: Text(
        "Read, and your Lord is the Most Generous",
        style: AppStyle.bodyStyle,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro3.png"),
    ),
    PageViewModel(
      titleWidget: Text("Bearish", style: AppStyle.titelStyle),
      bodyWidget: Text(
        "Praise the name of your Lord, the Most High",
        style: AppStyle.bodyStyle,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro4.png"),
    ),
    PageViewModel(
      titleWidget: Text("Holy Quran Radio", style: AppStyle.titelStyle),
      bodyWidget: Text(
        "You can listen to the Holy Quran Radio through the application for free and easily",
        style: AppStyle.bodyStyle,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro5.png"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      globalBackgroundColor: AppColors.black,
      showNextButton: true,
      bodyPadding: EdgeInsets.only(top: 266),
      dotsDecorator: DotsDecorator(
        color: AppColors.gray,
        activeColor: AppColors.primary,
        activeSize: Size(18, 7),
        activeShape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent)
        ),
      ),
      globalHeader: Image.asset("assets/images/islami_top.png"),
      showBackButton: true,
      showSkipButton: true,
      back: Text("Bake", style: AppStyle.bodyStyle),
      skip: Text("Skip", style: AppStyle.bodyStyle),
      next: Text("Next", style: AppStyle.bodyStyle),
      done: Text("Done", style: AppStyle.bodyStyle),
      onDone: () {
        Navigator.pushNamed(context, HomeScreen.routeName);
      },
      onSkip: () {
        Navigator.pushNamed(context, HomeScreen.routeName);
      },
    );
  }
}
