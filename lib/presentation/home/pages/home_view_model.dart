import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/presentation/puzzle/controller/puzzle_controller.dart';
import 'package:jogak_jogak/presentation/home/pages/home_state.dart';

class HomeViewModel with ChangeNotifier {
  HomeViewModel();

  final _puzzleController = PuzzleController();
  HomeState _state = const HomeState();
  HomeState get state => _state;

  // 난이도 변경
  void levelChange(int level) {
    _state = state.copyWith(level: 3);
    notifyListeners();
  }

  // 이미지 선택
  void selectImage() async {
    await _puzzleController.selectPuzzle();
    _state = state.copyWith(file: _puzzleController.file);
    notifyListeners();
  }
}
