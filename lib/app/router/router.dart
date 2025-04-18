import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogak_jogak/app/router/routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter appRouter() {
    return GoRouter(
      routes: routes,
      navigatorKey: _rootNavigatorKey,
      initialLocation: AppRoute.signIn.path,
    );
  }
}
