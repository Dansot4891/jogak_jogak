import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/helper/temporary_dir/temporary_dir.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/puzzle/data/model/puzzle_image.dart';
import 'package:jogak_jogak/feature/puzzle/data/repository/puzzle_repository.dart';
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
        final obtainedFile = await TemporaryDir.getImageToTemporaryPath(
          url: result.data.imageUrl,
          imageName: 'tmp_image',
        );
        _state = state.copyWith(file: obtainedFile);
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
    _state = state.copyWith(file: _puzzleController.file);
    notifyListeners();
  }
}
