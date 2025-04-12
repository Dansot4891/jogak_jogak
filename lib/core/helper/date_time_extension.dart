extension DateTimeExtension on DateTime {
  String toRelativeDate() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final data = DateTime(year, month, day);

    final diff = today.difference(data).inDays;

    if (diff == 0) return '오늘';
    if (diff == 1) return '어제';
    if (diff < 7) return '$diff일 전';
    if (diff < 30) return '${(diff / 7).floor()}주 전';
    if (diff < 365) return '${(diff / 30).floor()}달 전';
    return '${(diff / 365).floor()}년 전';
  }
}
