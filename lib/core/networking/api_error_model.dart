import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/networking/local_statuscode.dart';

class ApiErrorModel {
  final String message;
  final IconData icon;
  final int statusCode;
  final bool isLastPage;

  ApiErrorModel(
      {required this.message,
      required this.icon,
      required this.statusCode,
      this.isLastPage = false});
  factory ApiErrorModel.defaultError() {
    return ApiErrorModel(
      message: 'Something went wrong. Try again later',
      icon: Icons.error,
      statusCode: LocalStatuscode.defaultError,
    );
  }
}
