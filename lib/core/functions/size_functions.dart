import 'package:flutter/material.dart';

double sizeSetterWidth(BuildContext context, double size) {
  //* Using .sizeOf(context) is better than using .of(context).size
  return MediaQuery.sizeOf(context).width * size;
}

double sizeSetterHeight(BuildContext context, double size) {
  //* Using .sizeOf(context) is better than using .of(context).size
  return MediaQuery.sizeOf(context).height * size;
}
