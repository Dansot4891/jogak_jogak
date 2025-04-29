import 'package:jogak_jogak/app/di/app_di.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_view_model.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_view_model.dart';
import 'package:jogak_jogak/presentation/home/pages/home_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/pages/puzzle_history_view_model.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_view_model.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_view_model.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider(create: (pContext) => locator<SignInViewModel>()),
  ChangeNotifierProvider(create: (pContext) => locator<SignUpViewModel>()),
  ChangeNotifierProvider(create: (pContext) => locator<HomeViewModel>()),
  ChangeNotifierProvider(
    create: (pContext) => locator<ChangePasswordViewModel>(),
  ),
  ChangeNotifierProvider(
    create: (pContext) => locator<ChangeUsernameViewModel>(),
  ),
  ChangeNotifierProvider(create: (pContext) => locator<MyPageViewModel>()),
  ChangeNotifierProvider(
    create: (pContext) => locator<PuzzleHistoryViewModel>(),
  ),
  ChangeNotifierProvider(create: (pContext) => locator<PuzzleViewModel>()),
  ChangeNotifierProvider(create: (pContext) => locator<RankingViewModel>()),
];
