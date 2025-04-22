extension TimeFormatter on int {
  String formattedElapsed() {
    final minutes = this ~/ 60;
    final seconds = this % 60;
    if (minutes == 0) {
      return '$seconds초';
    }
    return '$minutes분 $seconds초';
  }
}
