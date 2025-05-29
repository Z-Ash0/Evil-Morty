import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';

class ErrorViewerWidget extends StatelessWidget {
  const ErrorViewerWidget(
      {super.key, required this.icon, required this.errorMsg});
  final String errorMsg;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.setMinSize(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: MediaQuery.sizeOf(context).width / 4,
            color: Colors.red,
          ),
          Text(errorMsg, style: const TextStyle(fontSize: 24)),
          SizedBox(height: context.setMinSize(20)),
          Text(
            'Pull down to refresh',
            style: TextStyle(
              color: Colors.grey,
              fontSize: context.setMinSize(14),
            ),
          ),
        ],
      ),
    );
  }
}
