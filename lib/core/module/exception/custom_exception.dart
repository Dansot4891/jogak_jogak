abstract class CustomException implements Exception {
  final int code;
  final String message;

  const CustomException(this.code, this.message);
}

// 알 수 없는 에러일 때 사용
class UnexpectedException extends CustomException {
  const UnexpectedException() : super(501, '문제가 발생했어요. 잠시 후 다시 시도해주세요.');
}
