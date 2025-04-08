import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/base/logics/box_controller.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/box/bouncing_box.dart';

class BouncingBoxesBackground extends StatefulWidget {
  final String? title;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool useSafeArea;

  const BouncingBoxesBackground({
    this.title,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.useSafeArea = true,
    super.key,
  });

  @override
  State<BouncingBoxesBackground> createState() =>
      _BouncingBoxesBackgroundState();
}

class _BouncingBoxesBackgroundState extends State<BouncingBoxesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(days: 1),
    )..addListener(() {
        BoxController.instance.updateBoxes();
        setState(() {});
      });
    _controller.repeat(); // 계속 반복
  }

  @override
  void dispose() {
    _controller.dispose(); // 리소스 정리
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boxes = BoxController().boxes;

    return BasePage(
      title: widget.title,
      appBar: widget.appBar,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      drawer: widget.drawer,
      endDrawer: widget.endDrawer,
      backgroundColor: widget.backgroundColor,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      useSafeArea: widget.useSafeArea,
      body: Stack(
        children: [
          ...boxes.map(
            (box) => BouncingBox(
              left: box.x,
              top: box.y,
              angle: box.angle,
              boxSize: box.boxSize,
            ),
          ),
          widget.body,
        ],
      ),
    );
  }
}
