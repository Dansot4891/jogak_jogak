import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogak_jogak/app/di/app_di.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter appRouter() {
    final UserProvider userProvider = locator();
    return GoRouter(
      routes: routes,
      navigatorKey: _rootNavigatorKey,
      refreshListenable: userProvider,
      redirect: (context, state) {
        // 유저 정보가 있는데 화면이 null이면
        // 홈 화면으로 강제 이동
        print('userProvider.state.user: ${userProvider.state.user}');
        print('state.fullPath: ${state.fullPath}');
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
  }
}
