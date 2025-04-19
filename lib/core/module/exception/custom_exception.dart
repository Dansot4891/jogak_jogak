abstract class CustomException implements Exception {
  final int code;
  final String message;

  const CustomException(this.code, this.message);
}

// 알 수 없는 에러일 때 사용
class UnexpectedException extends CustomException {
  const UnexpectedException() : super(501, '문제가 발생했습니다. 잠시 후 다시 시도해주세요.');
}

// 파이어베이스 Auth에서 유저 uid를 찾을 수 없을 때
class UIDNotFoundException extends CustomException {
  const UIDNotFoundException() : super(404, '유저 정보가 존재하지 않습니다. 다시 시도해주세요.');
}

// 파이어베이스 Auth에서 유저를 찾을 수 없을 때
class UserNotFoundException extends CustomException {
  const UserNotFoundException() : super(405, '유저가 존재하지 않습니다.');
}

// 회원가입시 이메일이 존재할 때
class EmailAlreadyExistsException extends CustomException {
  const EmailAlreadyExistsException()
    : super(409, '이미 존재하는 이메일입니다. 다른 이메일을 사용해주세요.');
}

// 파이어베이스의 랜덤 이미지들의 총개수를 불러올 수 없을 때
class FailedToFetchImageException extends CustomException {
  const FailedToFetchImageException() : super(509, '데이터를 불러오는 데 실패했습니다.');
}
