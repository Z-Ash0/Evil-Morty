import 'package:flutter/material.dart';

class SizeProvider extends InheritedWidget {
  final double width;
  final double height;
  final Size baseSize;

  const SizeProvider({
    super.key,
    required this.width,
    required this.height,
    required this.baseSize,
    required super.child,
  });

//* Returns the nearest widget of the given type T and creates a dependency on it, or null if no appropriate widget is found.
//* من الآخر: This method allows descendant widgets to access the nearest SizeProvider widget in the widget tree.
//* The following function is for using the [.of(context)."class properties"] to simplify accessing the SizeProvider's properties from any descendant widget in the widget tree.
  static SizeProvider of(BuildContext context) {
    // الفانكشن دي هي اللي بتسرش عن أقرب انسستور في الويدجت تري
    return context.dependOnInheritedWidgetOfExactType<SizeProvider>()!;
  }

//* فايدة دي بتخليك تأبديت الويدجت التشايلد ع حسب حصل تغيير ولا لا فبتشيك بالمقارنة مع قيم الويدجت القديمة
  @override
  bool updateShouldNotify(covariant SizeProvider oldWidget) {
    return width != oldWidget.width ||
        height != oldWidget.height ||
        baseSize != oldWidget.baseSize ||
        child != oldWidget.child;
  }
}
