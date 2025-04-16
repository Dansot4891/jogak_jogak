import 'package:go_router/go_router.dart';
import 'package:jogak_jogak/app/router/routes.dart';

class AppRouter {
  static GoRouter appRouter() {
    return GoRouter(routes: routes, initialLocation: AppRoute.signIn.path);
  }
}
