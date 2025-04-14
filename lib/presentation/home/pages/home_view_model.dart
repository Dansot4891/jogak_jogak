import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/presentation/puzzle/controller/puzzle_controller.dart';
import 'package:jogak_jogak/presentation/home/pages/home_state.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewModel();

  final _puzzleController = PuzzleController();
  HomeState _state = const HomeState();
  HomeState get state => _state;

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

  void removeImage() {
    _puzzleController.removePuzzle();
    _state = state.copyWith(file: _puzzleController.file);
    notifyListeners();
  }
}
