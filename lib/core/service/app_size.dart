import 'package:flutter/material.dart';

class AppSize {
  AppSize._();

  static late double devicePixelRatio; // 디바이스 픽셀 비율
  static late double screenWidth; // 디바이스 넓이
  static late double screenHeight; // 디바이스 높이
  static late EdgeInsets screenPadding; // 화면 패딩값 추출  
  static bool _isInitialized = false; // 초기화 상태 확인 변수
  
  // 비율로 처리했을 때 높이 넓이. (402 * 874) 기준
  static double ratioHeight(double givenHeight) =>
      (givenHeight / 874) * screenHeight;

  // 비율로 처리했을 때 높이 넓이. (402 * 874) 기준
  static double ratioWidth(double givenWidth) =>
      (givenWidth / 402) * screenWidth;
  
  // 비율로 구하기
  static double fractionWidth(double fraction) => screenWidth * fraction;
  static double fractionHeight(double fraction) => screenHeight * fraction;
  

  // 초기화 구문
  static void init(BuildContext context) async {
    if (_isInitialized) return;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
    screenPadding = MediaQuery.of(context).padding;
    _isInitialized = true;
  }
}