import 'package:cloud_firestore/cloud_firestore.dart';

// 테스트 코드 작성을 위한 FirebaseInstance 가져오는 클래스 생성
// => 굳이 싱글톤 X, 어차피 Firebase에서 제공해주는 FirebaseFirestore.instance 자체가 싱글톤
class AppFirebaseInstance {
  static final FirebaseFirestore instance = FirebaseFirestore.instance;
}
