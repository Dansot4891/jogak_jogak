import 'package:easy_localization/easy_localization.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';

extension DateTimeExtension on DateTime {
  String toRelativeDate() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final data = DateTime(year, month, day);

    final diff = today.difference(data).inDays;

    if (diff == 0) return LocaleKeys.dateToday.tr();
    if (diff == 1) return LocaleKeys.dateYesterday.tr();
    if (diff < 7) return LocaleKeys.dateDaysAgo.tr(namedArgs: {'n': '$diff'});
    if (diff < 30) {
      return LocaleKeys.dateWeeksAgo.tr(
        namedArgs: {'n': '${(diff / 7).floor()}'},
      );
    }

    if (diff < 365) {
      return LocaleKeys.dateMonthsAgo.tr(
        namedArgs: {'n': '${(diff / 30).floor()}달 전'},
      );
    }

    return LocaleKeys.dateYearsAgo.tr(
      namedArgs: {'n': '${(diff / 365).floor()}년 전'},
    );
  }
}
