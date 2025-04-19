import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:dio/dio.dart';

abstract class TemporaryDir {
  // 파일 다운 후 임시 저장
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

  // 파일 삭제
  static Future<void> deleteImageFromTemporaryPath({
    required String imageName,
  }) async {
    // 임시 저장소 경로
    final Directory tempDir = await getTemporaryDirectory();

    // 삭제할 파일 경로
    final String filePath = "${tempDir.path}/$imageName";
    print('delete file paht: $filePath');

    final file = File(filePath);

    // 파일이 존재하면 삭제
    if (await file.exists()) {
      print('deleted');
      await file.delete();
    }
  }
}
