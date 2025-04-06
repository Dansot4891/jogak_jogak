import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:jogak_jogak/core/service/app_size.dart';

class ImgPicker {
  // 이미지를 사용자 핸드폰으로부터 가져오기
  static Future<File?> pickImage() async {
    final picker = ImagePicker();
    final resp = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: AppSize.screenWidth,
      maxHeight: AppSize.screenHeight,
    );
    if (resp == null) {
      return null;
    }
    return File(resp.path);
  }
}