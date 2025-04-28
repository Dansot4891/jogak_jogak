import 'package:easy_localization/easy_localization.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';

extension TimeFormatter on int {
  String formattedElapsed() {
    final minutes = this ~/ 60;
    final seconds = this % 60;
    if (minutes == 0) {
      return '$seconds ${LocaleKeys.seconds.tr()}';
    }
    return '$minutes${LocaleKeys.minutes.tr()} $seconds${LocaleKeys.seconds.tr()}';
  }
}
