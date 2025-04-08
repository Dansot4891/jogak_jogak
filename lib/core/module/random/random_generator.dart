import 'dart:math';

// 싱글톤 패턴으로 관리
class RandomGenerator {
  final Random _random = Random();

  static final RandomGenerator instance = RandomGenerator._internal();

  RandomGenerator._internal();

  factory RandomGenerator() => instance;

  int nextInt(int bound, {
    int seed = 0,
  }) {
    return _random.nextInt(bound) + seed;
  }

  double nextDouble(double bound, {
    double seed = 0,
  }) {
    return _random.nextDouble() * bound + seed;
  }
}