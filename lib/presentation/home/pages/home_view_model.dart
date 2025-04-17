import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/helper/temporary_dir/temporary_dir.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/puzzle/domain/model/puzzle_image.dart';
import 'package:jogak_jogak/feature/puzzle/domain/repository/puzzle_repository.dart';
import 'package:jogak_jogak/presentation/puzzle/controller/puzzle_controller.dart';
import 'package:jogak_jogak/presentation/home/pages/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final PuzzleRepository _puzzleRepository;
  HomeViewModel(this._puzzleRepository);

  final _puzzleController = PuzzleController();
  HomeState _state = const HomeState();
  HomeState get state => _state;

  // 랜덤 이미지 조회
  void getRandomImageUrl() async {
    _state = state.copyWith(state: BaseState.loading);
    notifyListeners();
    final result = await _puzzleRepository.getRandomImageUrl();
    switch (result) {
      case Success<PuzzleImage>():
        final url = result.data.imageUrl;
        final obtainedFile = await TemporaryDir.getImageToTemporaryPath(
          url: url,
          imageName: 'tmp_image.${url.split('.').last}',
        );
        _state = state.copyWith(file: obtainedFile, state: BaseState.success);
        _puzzleController.selectImage(obtainedFile: obtainedFile);
      case Error():
        _state = state.copyWith(
          state: BaseState.error,
          error: result.error.message,
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
