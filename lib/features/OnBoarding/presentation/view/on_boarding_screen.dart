import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';
import 'package:rick_and_morty_app/features/OnBoarding/presentation/widgets/bottom_section.dart';
import 'package:rick_and_morty_app/features/OnBoarding/presentation/widgets/on_boarding_pages.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int index = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Column(
          children: [
            SizedBox(height: context.screenHeight / 8),
            OnBoardingPages(
              pgcontroller: pageController,
              pageFun: (pageNum) => setState(() {
                index = pageNum;
              }),
            ),
            Expanded(
              child: BottomSection(
                index: index,
                controller: pageController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
