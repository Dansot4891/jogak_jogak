import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/helper/temporary_dir/temporary_dir.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/puzzle/domain/model/puzzle_image.dart';
import 'package:jogak_jogak/feature/puzzle/domain/use_case/get_random_image_url_use_case.dart';
import 'package:jogak_jogak/presentation/puzzle/controller/puzzle_controller.dart';
import 'package:jogak_jogak/presentation/home/pages/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetRandomImageUrlUseCase _getRandomImageUrlUseCase;
  HomeViewModel(this._getRandomImageUrlUseCase);

  final _puzzleController = PuzzleController();
  HomeState _state = const HomeState();
  HomeState get state => _state;

  // 랜덤 이미지 조회
  void getRandomImageUrl() async {
    _state = state.copyWith(state: BaseState.loading);
    notifyListeners();
    final result = await _getRandomImageUrlUseCase.execute();
    switch (result) {
      case Success<PuzzleImage>():
        final url = result.data.imageUrl;
        print(url);
        final imageName = 'tmp_image.${url.split('.').last}';
        final obtainedFile = await TemporaryDir.getImageToTemporaryPath(
          url: url,
          imageName: imageName,
        );
        _state = state.copyWith(file: obtainedFile, state: BaseState.success);
        _puzzleController.selectImage(obtainedFile: obtainedFile);
      case Error():
        _state = state.copyWith(
          state: BaseState.error,
          errorMessage: result.error.message,
        );
    }
    notifyListeners();
  }

  // 난이도 변경
  void selectLevel(int level) {
    _state = state.copyWith(level: level, file: state.file);
    _puzzleController.selectLevel(level);
    notifyListeners();
  }

  // 이미지 선택
  void selectImage() async {
    await _puzzleController.selectImage();
    _state = state.copyWith(file: _puzzleController.file);
    notifyListeners();
  }

  // 이미지 제거
  void removeImage() {
    _puzzleController.removePuzzle();
    _state = state.copyWith(fileClear: true);
    notifyListeners();
  }

  // 데이터 리셋
  void resetState() {
    _state = state.copyWith(state: BaseState.success);
    notifyListeners();
  }
}
