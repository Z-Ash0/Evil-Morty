import 'package:flutter/material.dart';

double sizeSetter(BuildContext context, double size) {
  //* Using .sizeOf(context) is better than using .of(context).size
  return MediaQuery.sizeOf(context).width * size;
}
