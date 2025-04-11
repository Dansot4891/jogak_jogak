import 'package:go_router/go_router.dart';
import 'package:jogak_jogak/presentation/auth/pages/sign_in_page.dart';
import 'package:jogak_jogak/presentation/auth/pages/sign_up_page.dart';
import 'package:jogak_jogak/presentation/home/pages/home_page.dart';
import 'package:jogak_jogak/presentation/my_info/pages/my_page.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_page.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_page.dart';

class AppRouter {
  static GoRouter appRouter() {
    return GoRouter(routes: routes, initialLocation: AppRoutes.signIn.path);
  }
}

final routes = [
  // sign
  GoRoute(
    path: AppRoutes.signUp.path,
    builder: (context, state) {
      return const SignUpPage();
    },
  ),
  GoRoute(
    path: AppRoutes.signIn.path,
    builder: (context, state) {
      return const SignInPage();
    },
  ),

  // roottab
  GoRoute(
    path: AppRoutes.home.path,
    builder: (context, state) {
      return const HomePage();
    },
  ),
  GoRoute(
    path: AppRoutes.ranking.path,
    builder: (context, state) {
      return const RankingPage();
    },
  ),
  GoRoute(
    path: AppRoutes.myPage.path,
    builder: (context, state) {
      return const MyPage();
    },
  ),

  // Todo -----------------------------
  // 비밀번호/닉네임 변경 ui 구현 후 라우트 작성
  // change user info
  // GoRoute(
  //   path: AppRoutes.signUp.path,
  //   builder: (context, state) {
  //     return const SignUpPage();
  //   },
  // ),
  // GoRoute(
  //   path: AppRoutes.signUp.path,
  //   builder: (context, state) {
  //     return const SignUpPage();
  //   },
  // ),

  // inGame
  GoRoute(
    path: AppRoutes.puzzle.path,
    builder: (context, state) {
      return const PuzzlePage();
    },
  ),
];

// AppRoute들을 enum으로 정리
enum AppRoutes {
  signUp('/sign-up'),
  signIn('/sign-in'),
  home('/home'),
  ranking('/ranking'),
  myPage('/my-page'),
  changePw('/change-pw'),
  changeName('/change-name'),
  puzzle('/puzzle');

  final String path;

  const AppRoutes(this.path);
}
