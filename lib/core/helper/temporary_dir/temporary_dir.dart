import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:dio/dio.dart';

abstract class TemporaryDir {
  static Future<File?> getImageToTemporaryPath({
    required String url,
    required String imageName,
  }) async {
    try {
      // 임시 저장소 경로
      final Directory tempDir = await getTemporaryDirectory();

      // 파일 경로
      final String filePath = "${tempDir.path}/$imageName";

      // 이미지 다운로드
      await Dio().download(
        url,
        filePath,
        options: Options(responseType: ResponseType.bytes),
      );

      return File(filePath);
    } catch (e) {
      return null;
    }
  }
}
