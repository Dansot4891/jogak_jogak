abstract class CustomException implements Exception {
  final int code;
  final String message;

  const CustomException(this.code, this.message);
}

// 알 수 없는 에러일 때 사용
class UnexpectedException extends CustomException {
  const UnexpectedException() : super(501, '문제가 발생했어요. 잠시 후 다시 시도해주세요.');
}

// 유저 uid를 찾을 수 없을 때
class UIDNotFoundException extends CustomException {
  const UIDNotFoundException() : super(404, 'UID가 존재하지 않습니다. 올바른 UID를 확인해주세요.');
}

// 회원가입시 이메일이 존재할 때
class EmailAlreadyExistsException extends CustomException {
  const EmailAlreadyExistsException()
    : super(409, '이미 존재하는 이메일입니다. 다른 이메일을 사용해주세요.');
}
