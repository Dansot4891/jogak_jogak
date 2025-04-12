import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';

class TabbarPage extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> children;
  final String? title;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool useSafeArea;
  const TabbarPage({
    this.title,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.useSafeArea = true,
    required this.tabs,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: BasePage(
        title: title,
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        drawer: drawer,
        endDrawer: endDrawer,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        useSafeArea: useSafeArea,
        body: Column(
          children: [
            TabBar(
              dividerColor: AppColor.sub,
              labelColor: AppColor.main,
              labelStyle: AppTextStyle.tabbar,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: tabs.map((e) => Tab(text: e)).toList(),
            ),
            Expanded(child: TabBarView(children: children)),
          ],
        ),
      ),
    );
  }
}
