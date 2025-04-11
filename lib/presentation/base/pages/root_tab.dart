import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/home/pages/home_page.dart';
import 'package:jogak_jogak/presentation/my_info/pages/my_page.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_page.dart';

class RootTab extends StatefulWidget {
  static String get routeName => 'home';
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 3,
      vsync: this,
    ); //vsync 를 사용하려면 with SingleTickerProviderStateMixin를 같이 사용해야함
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [HomePage(), RankingPage(), MyPage()],
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 구분선
          Container(
            height: 1,
            color: Colors.grey[300], // 원하는 선 색상
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              controller.animateTo(index);
            },
            selectedLabelStyle: AppTextStyle.body1,
            unselectedLabelStyle: AppTextStyle.body1,
            backgroundColor: AppColor.white,
            selectedItemColor: AppColor.main,
            unselectedItemColor: AppColor.greyC5,
            currentIndex: index,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
              BottomNavigationBarItem(
                icon: Icon(Icons.emoji_events_outlined),
                label: '랭킹',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이'),
            ],
          ),
        ],
      ),
    );
  }
}
