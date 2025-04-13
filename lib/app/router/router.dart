import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jogak_jogak/presentation/auth/pages/sign_in_page.dart';
import 'package:jogak_jogak/presentation/auth/pages/sign_up_page.dart';
import 'package:jogak_jogak/presentation/base/pages/root_tab.dart';
import 'package:jogak_jogak/presentation/home/pages/home_page.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_page.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/pages/puzzle_history_page.dart';
import 'package:jogak_jogak/presentation/my_info/update_name/pages/update_nickname_page.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_page.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_page.dart';

class AppRouter {
  static GoRouter appRouter() {
    return GoRouter(routes: routes, initialLocation: AppRoute.signIn.path);
  }
}

final routes = [
  // auth
  ...AuthPath.routes,

  // roottab
  ...RootTabPath.routes,

  // user
  ...UserPath.routes,

  // inGame
  ...PuzzlePath.routes,
];

// AppRoute들을 enum으로 정리
enum AppRoute {
  root('/root'),
  // auth
  signUp('/sign-up'),
  signIn('/sign-in'),

  // root tab
  home('/home'),
  ranking('/ranking'),
  myPage('/my-page'),

  // my info
  changePw('/change-pw'),
  updateName('/update-name'),
  puzzleHistory('/puzzle_history'),

  // in Game
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

abstract class AuthPath {
  static final List<GoRoute> routes = [
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
  ];
}

abstract class RootTabPath {
  static final List<GoRoute> routes = [
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
  ];
}

abstract class UserPath {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoute.changePw.path,
      builder: (context, state) {
        return const ChangePasswordPage();
      },
    ),
    GoRoute(
      path: AppRoute.updateName.path,
      builder: (context, state) {
        return const UpdateNicknamePage();
      },
    ),
    GoRoute(
      path: AppRoute.puzzleHistory.path,
      builder: (context, state) {
        return const PuzzleHistoryPage();
      },
    ),
  ];
}

abstract class PuzzlePath {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoute.puzzle.path,
      builder: (context, state) {
        return const PuzzlePage();
      },
    ),
  ];
}
