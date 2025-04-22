abstract class AppValidator {
  static String? emailValid(String? input) {
    if (input == null || input.isEmpty) {
      return '이메일을 입력해주세요.';
    }
    final regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    if (!regex.hasMatch(input)) {
      return '올바른 이메일 양식을 입력해주세요.';
    }

    return null; // 유효할 경우 null 반환
  }

  static String? passwordValid(String? input) {
    if (input == null || input.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }
    if (input.length < 6) {
      return '비밀번호는 6자 이상이어야합니다.';
    }

    return null; // 유효할 경우 null 반환
  }
}
