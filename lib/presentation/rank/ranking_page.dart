import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/text_style.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: BasePage(
        body: Column(
          children: [
            TabBar(
              dividerColor: AppColor.sub,
              labelColor: AppColor.main,
              labelStyle: AppTextStyle.tabbar,
              tabs: [
                Tab(text: '3 X 3'),
                Tab(text: '4 X 4'),
                Tab(text: '5 X 5'),
              ],
            ),
            TabBarView(children: [
              Container(),
              Container(),
              Container(),
            ],),
          ],
        ),
      ),
    );
  }
}
