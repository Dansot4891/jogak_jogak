import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/helper/temporary_dir/temporary_dir.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/puzzle/domain/model/puzzle_image.dart';
import 'package:jogak_jogak/feature/puzzle/domain/use_case/get_random_image_url_use_case.dart';
import 'package:jogak_jogak/presentation/home/pages/home_action.dart';
import 'package:jogak_jogak/presentation/puzzle/controller/puzzle_controller.dart';
import 'package:jogak_jogak/presentation/home/pages/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetRandomImageUrlUseCase _getRandomImageUrlUseCase;
  HomeViewModel(this._getRandomImageUrlUseCase) {
    // 난이도 초기값 설정
    _selectLevel(_puzzleController.gridViewSize);
  }

  final _puzzleController = PuzzleController();
  HomeState _state = const HomeState();
  HomeState get state => _state;

  void onAction(HomeAction action) {
    switch (action) {
      case GetRandomImageUrl():
        _getRandomImageUrl();
      case SelectLevel():
        _selectLevel(action.level);
      case SelectImage():
        _selectImage();
      case ResetState():
        _resetState();
      case RemoveImage():
        _removeImage();
    }
  }

  // 랜덤 이미지 조회
  void _getRandomImageUrl() async {
    _state = state.copyWith(state: BaseState.loading);
    notifyListeners();
    final result = await _getRandomImageUrlUseCase.execute();
    switch (result) {
      case Success<PuzzleImage>():
        final now = DateTime.now();
        final url = result.data.imageUrl;
        final imageName = '$now.${url.split('.').last}';
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
  void _selectLevel(int level) {
    _state = state.copyWith(level: level, file: state.file);
    _puzzleController.selectLevel(level);
    notifyListeners();
  }

  // 이미지 선택
  void _selectImage() async {
    await _puzzleController.selectImage();
    _state = state.copyWith(file: _puzzleController.file);
    notifyListeners();
  }

  // 이미지 제거
  void _removeImage() {
    _puzzleController.removePuzzle();
    _state = state.copyWith(fileClear: true);
    notifyListeners();
  }

  // 데이터 리셋
  void _resetState() {
    _state = state.copyWith(state: BaseState.success);
    notifyListeners();
  }
}
