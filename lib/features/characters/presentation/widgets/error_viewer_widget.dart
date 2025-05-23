import 'package:flutter/material.dart';

class ErrorViewerWidget extends StatelessWidget {
  const ErrorViewerWidget(
      {super.key, required this.icon, required this.errorMsg});
  final String errorMsg;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: MediaQuery.sizeOf(context).width / 4,
            color: Colors.red,
          ),
          Text(errorMsg, style: const TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}
