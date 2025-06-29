import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jogak_jogak/core/constants/app_dotenv.dart';

// 구글 광고 객체
class AdMobService {
  // dotenv를 이용하여 admob에 필요한 코드 불러오기
  static String get _androidKey => dotenv.get(AppDotenv.androidAdKey);
  static String get _iosKey => dotenv.get(AppDotenv.iosAdKey);

  // 배너 광고를 불러오기 위해 키 값 불러오기
  static String? get bannerAd {
    // 각 플랫폼에 알맞게 키 값을 할당
    if (Platform.isAndroid) {
      return _androidKey;
    }
    return _iosKey;
  }
}
