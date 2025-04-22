import 'dart:ui';

abstract class AppColor {
  static Color get main => const Color(0xFF4E2AC6);
  static Color get sub => const Color(0xFFD3D4FA);

  // grey
  static Color get grey43 => const Color(0xFF434343);
  static Color get grey80 => const Color(0xFF808080);
  static Color get greyA7 => const Color(0xFFA7A7A7);
  static Color get greyC5 => const Color(0xFFC5C5C5);
  static Color get greyE6 => const Color(0xFFE6E6E6);
  static Color get greyF3 => const Color(0xFFF3F3F3);

  // black
  static Color get black => const Color(0xFF000000);

  // white
  static Color get white => const Color(0xFFFFFFFF);

  // red
  static Color get red => const Color(0xFFE40000);

  // blue
  static Color get blue => const Color(0xFF4A53FA);
}
