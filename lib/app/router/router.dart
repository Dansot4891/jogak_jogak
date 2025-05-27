import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogak_jogak/app/di/app_di.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter appRouter() {
    final analytics = FirebaseAnalytics.instance;
    final UserProvider userProvider = locator();
    final router = GoRouter(
      routes: routes,
      navigatorKey: _rootNavigatorKey,
      refreshListenable: userProvider,
      redirect: (context, state) {
        // 유저 정보가 있는데 현재 화면이 로그인 화면이라면
        // 홈 화면으로 강제 이동
        if (userProvider.state.user != null &&
            state.fullPath == AppRoute.signIn.path) {
          return AppRoute.home.path;
        }
        // 유저 정보가 없는데 회원가입/로그인/비밀번호 재설정 화면이 아니라면
        // 로그인 화면으로 강제 이동
        else if (userProvider.state.user == null &&
            (state.fullPath != AppRoute.signIn.path &&
                state.fullPath != AppRoute.signUp.path &&
                state.fullPath != AppRoute.changePw.path)) {
          return AppRoute.signIn.path;
        }
        return null;
      },
      initialLocation: AppRoute.signIn.path,
    );

    router.routerDelegate.addListener(() {
      // 실제 화면이 그려진 후 analytics에 현재 화면 이름을 전달
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final matches = router.routerDelegate.currentConfiguration;
        if (matches.isNotEmpty) {
          final screen = matches.last.matchedLocation;
          analytics.logScreenView(screenName: screen);
        }
      });
    });

    return router;
  }
}
