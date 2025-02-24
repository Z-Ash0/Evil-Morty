import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';
import 'package:rick_and_morty_app/core/responsive/size_provider.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';
import 'package:rick_and_morty_app/core/utils/app_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomSection extends StatelessWidget {
  const BottomSection(
      {super.key, required this.index, required this.controller});
  final int index;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizeProvider(
          baseSize: const Size(360, 490),
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Builder(builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const SlideEffect(
                      activeDotColor: AppColors.secondaryColor),
                  onDotClicked: (index) => controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  ),
                ),
                SizedBox(height: context.setHeight(20)),
                CircularPercentIndicator(
                  percent: index == 0
                      ? 0.3
                      : index == 1
                          ? 0.6
                          : 1,
                  radius: context.setMinSize(60),
                  animateFromLastPercent: true,
                  animationDuration: 500,
                  progressColor: AppColors.secondaryColor,
                  center: CircleAvatar(
                    radius: context.setMinSize(40),
                    backgroundColor: Colors.grey.shade300,
                    child: IconButton(
                      icon: Icon(index == 2
                          ? Icons.check
                          : Icons.arrow_forward_ios_rounded),
                      color: AppColors.secondaryColor,
                      onPressed: () {
                        index != 2
                            ? controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              )
                            : Navigator.pushReplacementNamed(
                                context, charactersScreen);
                      },
                    ),
                  ),
                ),
                SizedBox(height: context.setHeight(30)),
                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, charactersScreen),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: context.setMinSize(24),
                    ),
                  ),
                ),
                SizedBox(height: context.setMinSize(60))
              ],
            );
          }),
        );
      },
    );
  }
}
