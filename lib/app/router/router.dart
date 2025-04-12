import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jogak_jogak/presentation/auth/pages/sign_in_page.dart';
import 'package:jogak_jogak/presentation/auth/pages/sign_up_page.dart';
import 'package:jogak_jogak/presentation/base/pages/root_tab.dart';
import 'package:jogak_jogak/presentation/home/pages/home_page.dart';
import 'package:jogak_jogak/presentation/my_info/pages/change_password_screen.dart';
import 'package:jogak_jogak/presentation/my_info/pages/my_page.dart';
import 'package:jogak_jogak/presentation/my_info/pages/update_nickname_screen.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_page.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_page.dart';

class AppRouter {
  static GoRouter appRouter() {
    return GoRouter(routes: routes, initialLocation: AppRoute.signIn.path);
  }
}

final routes = [
  // sign
  GoRoute(
    path: AppRoute.signUp.path,
    builder: (context, state) {
      return const SignUpPage();
    },
  ),
  GoRoute(
    path: AppRoute.signIn.path,
    builder: (context, state) {
      return const SignInPage();
    },
  ),

  // roottab
  GoRoute(
    path: AppRoute.root.path,
    builder: (context, state) {
      return const RootTab();
    },
  ),
  GoRoute(
    path: AppRoute.home.path,
    builder: (context, state) {
      return const HomePage();
    },
  ),
  GoRoute(
    path: AppRoute.ranking.path,
    builder: (context, state) {
      return const RankingPage();
    },
  ),
  GoRoute(
    path: AppRoute.myPage.path,
    builder: (context, state) {
      return const MyPage();
    },
  ),

  // Todo -----------------------------
  // 비밀번호/닉네임 변경 ui 구현 후 라우트 작성
  // change user info
  GoRoute(
    path: AppRoute.changePw.path,
    builder: (context, state) {
      return const ChangePasswordScreen();
    },
  ),
  GoRoute(
    path: AppRoute.updateName.path,
    builder: (context, state) {
      return const UpdateNicknameScreen();
    },
  ),

  // inGame
  GoRoute(
    path: AppRoute.puzzle.path,
    builder: (context, state) {
      return const PuzzlePage();
    },
  ),
];

// AppRoute들을 enum으로 정리
enum AppRoute {
  root('/root'),
  signUp('/sign-up'),
  signIn('/sign-in'),
  home('/home'),
  ranking('/ranking'),
  myPage('/my-page'),
  changePw('/change-pw'),
  updateName('/update-name'),
  puzzle('/puzzle');

  final String path;

  const AppRoute(this.path);
}

void pop(BuildContext context) {
  context.pop();
}

// 전체 앱에서 화면 이동할 때 사용하는 함수
Future<void> navigate(
  BuildContext context, {
  required AppRoute route,
  NavigationMethod method = NavigationMethod.push,
  dynamic extra,
}) async {
  final goRouter = GoRouter.of(context);

  switch (method) {
    case NavigationMethod.push:
      await goRouter.push(route.path, extra: extra);
      break;
    case NavigationMethod.replace:
      await goRouter.replace(route.path, extra: extra);
      break;
    case NavigationMethod.go:
      goRouter.go(route.path, extra: extra);
      break;
    case NavigationMethod.pushReplacement:
      await goRouter.pushReplacement(route.path, extra: extra);
      break;
  }
}

// Navigation methods enum
enum NavigationMethod { push, replace, go, pushReplacement }
