import 'package:fluttertoast/fluttertoast.dart';

abstract class AppToast {
  static void show(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
