abstract class AppValidator {
  static String emailValid(String? input){
    if(input == null){
      return '';
    }
    // 이메일 RegExp
    final regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if(regex.hasMatch(input)){
      return '';
    }
    return '올바른 이메일 양식을 입력해주세요.';
  }
}