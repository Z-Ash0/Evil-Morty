import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToastMsg(String msg) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}
