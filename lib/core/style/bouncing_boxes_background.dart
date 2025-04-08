import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';

void main() => runApp(const MaterialApp(home: BouncingBoxesBackground()));

class BouncingBoxesBackground extends StatefulWidget {
  const BouncingBoxesBackground({super.key});

  @override
  State<BouncingBoxesBackground> createState() => _BouncingBoxesBackgroundState();
}

class _BouncingBoxesBackgroundState extends State<BouncingBoxesBackground> {
  final int boxCount = 20;
  final double boxSize = 40;
  final List<_Box> boxes = [];
  Timer? timer;
  final random = Random();
  bool initialized = false;

  void _initBoxes(Size screenSize) {
    if (initialized) return;
    for (int i = 0; i < boxCount; i++) {
      boxes.add(
        _Box(
          x: random.nextDouble() * screenSize.width,
          y: random.nextDouble() * screenSize.height,
          dx: (random.nextDouble() - 0.5) * 4,
          dy: (random.nextDouble() - 0.5) * 4,
          angle: random.nextDouble() * pi * 2,
          rotationSpeed: (random.nextDouble() - 0.5) * 0.2,
        ),
      );
    }
    initialized = true;

    timer = Timer.periodic(const Duration(milliseconds: 16), (_) => _updateBoxes(screenSize));
  }

  void _updateBoxes(Size screenSize) {
    setState(() {
      for (var box in boxes) {
        box.x += box.dx;
        box.y += box.dy;
        box.angle += box.rotationSpeed;

        // 벽에 부딪힐 경우 튕김
        if (box.x <= 0 || box.x + boxSize >= screenSize.width) {
          box.dx = -box.dx;
          box.rotationSpeed = (random.nextDouble() - 0.5) * 0.2;
        }
        if (box.y <= 0 || box.y + boxSize >= screenSize.height) {
          box.dy = -box.dy;
          box.rotationSpeed = (random.nextDouble() - 0.5) * 0.2;
        }
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenSize = Size(constraints.maxWidth, constraints.maxHeight);
        _initBoxes(screenSize);

        return BasePage(
          backgroundColor: Colors.black,
          body: Stack(
            children: boxes
                .map(
                  (box) => Positioned(
                    left: box.x,
                    top: box.y,
                    child: Transform.rotate(
                      angle: box.angle,
                      child: Container(
                        width: boxSize,
                        height: boxSize,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class _Box {
  double x;
  double y;
  double dx;
  double dy;
  double angle;
  double rotationSpeed;

  _Box({
    required this.x,
    required this.y,
    required this.dx,
    required this.dy,
    required this.angle,
    required this.rotationSpeed,
  });
}
