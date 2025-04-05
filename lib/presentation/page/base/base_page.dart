import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final String? title;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  // final bool extendBody;
  // final bool extendBodyBehindAppBar;
  final bool useSafeArea;

  const BasePage({
    this.title,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    // this.extendBody = false,
    // this.extendBodyBehindAppBar = false,
    this.useSafeArea = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: appBar ?? (title != null ? AppBar(title: Text(title!)) : null),
        body: useSafeArea ? SafeArea(child: body) : body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        drawer: drawer,
        endDrawer: endDrawer,
        backgroundColor: backgroundColor ?? Colors.white,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        // extendBody: extendBody,
        // extendBodyBehindAppBar: extendBodyBehindAppBar,
      ),
    );
  }
}
