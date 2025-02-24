import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';

class ScreenBuilder extends StatefulWidget {
  const ScreenBuilder({super.key, required this.image, required this.title});
  final String image;
  final String title;

  @override
  State<ScreenBuilder> createState() => _ScreenBuilderState();
}

class _ScreenBuilderState extends State<ScreenBuilder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.setWidth(15)),
      child: Column(
        children: [
          Image(
            image: AssetImage(widget.image),
            height: context.screenHeight / 4,
            fit: BoxFit.contain,
          ),
          SizedBox(height: context.setMinSize(40)),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: context.setMinSize(28),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
