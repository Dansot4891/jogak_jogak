import 'package:fluttertoast/fluttertoast.dart';
import 'package:jogak_jogak/core/style/app_color.dart';

abstract class AppToast {
  static void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColor.main,
      textColor: AppColor.white,
      fontSize: 24.0,
    );
  }
}
