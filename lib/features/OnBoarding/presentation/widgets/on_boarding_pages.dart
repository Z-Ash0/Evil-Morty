import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/responsive/size_provider.dart';
import 'package:rick_and_morty_app/core/utils/app_constants.dart';
import 'package:rick_and_morty_app/features/OnBoarding/presentation/widgets/screen_builder.dart';

class OnBoardingPages extends StatefulWidget {
  const OnBoardingPages(
      {super.key, required this.pgcontroller, required this.pageFun});
  final PageController pgcontroller;
  final void Function(int) pageFun;

  @override
  State<OnBoardingPages> createState() => _OnBoardingPagesState();
}

class _OnBoardingPagesState extends State<OnBoardingPages> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizeProvider(
            baseSize: const Size(360, 490),
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: PageView.builder(
              onPageChanged: widget.pageFun,
              controller: widget.pgcontroller,
              itemBuilder: (context, index) => ScreenBuilder(
                image: screenList[index][image],
                title: screenList[index][title],
              ),
              itemCount: 3,
            ),
          );
        },
      ),
    );
  }
}
