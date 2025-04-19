import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';

class RootTab extends StatefulWidget {
  final Widget child;
  const RootTab(this.child, {super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: widget.child,
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
            onTap: onTap,
            selectedLabelStyle: AppTextStyle.body1,
            unselectedLabelStyle: AppTextStyle.body1,
            backgroundColor: AppColor.white,
            selectedItemColor: AppColor.main,
            unselectedItemColor: AppColor.greyC5,
            currentIndex: currentIndex,
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

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    switch (currentIndex) {
      case 0:
        context.go(AppRoute.home.path);
        break;
      case 1:
        context.go(AppRoute.ranking.path);
        break;
      case 2:
        context.go(AppRoute.myPage.path);
        break;
    }
  }
}
