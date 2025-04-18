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
        print('state.fullPath : ${state.fullPath}');
        // 유저 정보가 있는데 화면이 null이면
        // 강제로 홈 화면으로 이동
        if (userProvider.state.user != null &&
            state.fullPath == AppRoute.signIn.path) {
          print('is redirect');
          return AppRoute.home.path;
        }
        return null;
      },
      initialLocation: AppRoute.signIn.path,
    );
  }
}
