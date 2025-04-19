import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogak_jogak/app/di/app_di.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_page.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/sign_up_page.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/sign_up_view_model.dart';
import 'package:jogak_jogak/presentation/base/pages/root_tab.dart';
import 'package:jogak_jogak/presentation/home/pages/home_page.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_page.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/pages/puzzle_history_page.dart';
import 'package:jogak_jogak/presentation/my_info/update_name/pages/update_nickname_page.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_page.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_view_model.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_page.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routes = [
  // auth
  ...AuthPath.routes,

  // roottab
  RootTabPath.shellRoute,

  // user
  ...UserPath.routes,

  // inGame
  ...PuzzlePath.routes,
];

// AppRoute들을 enum으로 정리
enum AppRoute {
  root(path: '/root', name: 'root,'),
  // auth
  signUp(path: '/sign-up', name: 'sign-up'),
  signIn(path: '/sign-in', name: 'sign-in'),

  // root tab
  home(path: '/home', name: 'home'),
  ranking(path: '/ranking', name: 'ranking'),
  myPage(path: '/my-page', name: 'my-page'),

  // my info
  changePw(path: '/change-pw', name: 'change-pw'),
  updateName(path: '/update-name', name: 'update-name'),
  puzzleHistory(path: '/puzzle_history', name: 'puzzle_history'),

  // in Game
  puzzle(path: '/puzzle', name: 'puzzle');

  final String path;
  final String name;

  const AppRoute({required this.path, required this.name});
}

abstract class AuthPath {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoute.signUp.path,
      name: AppRoute.signUp.name,
      builder: (context, state) {
        final SignUpViewModel viewModel = locator();
        return SignUpPage(viewModel);
      },
    ),
    GoRoute(
      path: AppRoute.signIn.path,
      name: AppRoute.signIn.name,
      builder: (context, state) {
        return const SignInPage();
      },
    ),
  ];
}

abstract class RootTabPath {
  static final ShellRoute shellRoute = ShellRoute(
    navigatorKey: _shellNavigatorKey,
    builder: (context, state, child) {
      return RootTab(child);
    },
    routes: _routes,
  );

  static final List<GoRoute> _routes = [
    GoRoute(
      path: AppRoute.home.path,
      name: AppRoute.home.name,
      builder: (context, state) {
        return HomePage(locator());
      },
    ),
    GoRoute(
      path: AppRoute.ranking.path,
      name: AppRoute.ranking.name,
      builder: (context, state) {
        return const RankingPage();
      },
    ),
    GoRoute(
      path: AppRoute.myPage.path,
      name: AppRoute.myPage.name,
      builder: (context, state) {
        return MyPage(locator());
      },
    ),
  ];
}

abstract class UserPath {
  static final List<GoRoute> routes = [
    GoRoute(
      path: AppRoute.changePw.path,
      name: AppRoute.changePw.name,
      builder: (context, state) {
        return const ChangePasswordPage();
      },
    ),
    GoRoute(
      path: AppRoute.updateName.path,
      name: AppRoute.updateName.name,
      builder: (context, state) {
        return const UpdateNicknamePage();
      },
    ),
    GoRoute(
      path: AppRoute.puzzleHistory.path,
      name: AppRoute.puzzleHistory.name,
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
      name: AppRoute.puzzle.name,
      builder: (context, state) {
        final PuzzleViewModel viewModel = locator();
        return PuzzlePage(viewModel);
      },
    ),
  ];
}

void pop(BuildContext context) {
  context.pop();
}

// 전체 앱에서 화면 이동할 때 사용하는 함수
Future<void> navigate(
  BuildContext context, {
  required AppRoute route,
  NavigationMethod method = NavigationMethod.push,
}) async {
  final goRouter = GoRouter.of(context);

  switch (method) {
    case NavigationMethod.push:
      await goRouter.push(route.path);
      break;
    case NavigationMethod.replace:
      await goRouter.replace(route.path);
      break;
    case NavigationMethod.go:
      goRouter.go(route.path);
      break;
    case NavigationMethod.pushReplacement:
      await goRouter.pushReplacement(route.path);
      break;
  }
}

// Navigation methods enum
enum NavigationMethod { push, replace, go, pushReplacement }
