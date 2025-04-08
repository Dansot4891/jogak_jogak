import 'package:jogak_jogak/core/module/random/random_generator.dart';
import 'package:jogak_jogak/core/service/app_size.dart';

class BoxController {
  // singleton pattern
  static final BoxController instance = BoxController._internal();
  BoxController._internal();
  factory BoxController() => instance;

  // 박스 관련 변수
  final int _boxCount = 6;
  final double _boxSize = AppSize.ratioWidth(70);
  final List<_Box> _boxes = [];

  // 박스를 가져올 때 초기화한다.
  List<_Box> get boxes{
    if(!_initialized){
      _initBoxes();
    }
    return _boxes;
  }
  
  // 랜덤 생성 class
  final _random = RandomGenerator();
  
  // 초기화 변수
  bool _initialized = false;

  final _screenWidth = AppSize.screenWidth;
  final _screenHeight =
      AppSize.screenHeight -
      AppSize.screenPadding.bottom -
      AppSize.screenPadding.top;

  // 박스 초기화
  void _initBoxes() {
    // 이미 초기화 되어있다면 return;
    if (_initialized) return;

    for (int i = 0; i < _boxCount; i++) {
      _boxes.add(
        _Box(
          x: _random.nextDouble(0.8) * _screenWidth,
          y: _random.nextDouble(0.8) * _screenHeight,
          dx: _random.nextDouble(1) * 2,
          dy: _random.nextDouble(1) * 2,
          angle: _random.nextDouble(1) * 2,
          rotationSpeed: (_random.nextDouble(1) - 0.5) * 0.2,
          boxSize: _boxSize,
        ),
      );
    }
    _initialized = true;
  }

  // 박스 업데이트
  void updateBoxes() {
    // 만약 초기화되지 않았다면 return
    if(!_initialized){
      return;
    }
    for (var box in _boxes) {
      box.x += box.dx;
      box.y += box.dy;
      box.angle += box.rotationSpeed;

      if (box.x <= 0 || box.x + _boxSize >= _screenWidth) {
        box.dx = -box.dx;
      }
      if (box.y <= 0 || box.y + _boxSize >= _screenHeight) {
        box.dy = -box.dy;
      }
    }
  }
}

// 여기서만 사용되는 클래스
class _Box {
  double x; // 좌우 위치
  double y; // 상하 위치
  double dx; // 좌우 이동 거리
  double dy; // 상하 이동 거리
  double angle; // 박스가 돌려진 정도
  final double rotationSpeed; // 돌려지는 속도
  final double boxSize;

  _Box({
    required this.x,
    required this.y,
    required this.dx,
    required this.dy,
    required this.angle,
    required this.rotationSpeed,
    required this.boxSize,
  });
}
