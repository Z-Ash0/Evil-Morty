import 'package:flutter/material.dart';

double sizeSetter(BuildContext context, double size) {
  return MediaQuery.of(context).size.width * size;
}
