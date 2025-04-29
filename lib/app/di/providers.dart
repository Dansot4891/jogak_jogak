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

final appProviders = [
  ChangeNotifierProvider(create: (_) => locator<SignInViewModel>()),
  ChangeNotifierProvider(create: (_) => locator<SignUpViewModel>()),
  ChangeNotifierProvider(create: (_) => locator<HomeViewModel>()),
  ChangeNotifierProvider(create: (_) => locator<ChangePasswordViewModel>()),
  ChangeNotifierProvider(create: (_) => locator<ChangeUsernameViewModel>()),
  ChangeNotifierProvider(create: (_) => locator<MyPageViewModel>()),
  ChangeNotifierProvider(create: (_) => locator<PuzzleHistoryViewModel>()),
  ChangeNotifierProvider(create: (_) => locator<PuzzleViewModel>()),
  ChangeNotifierProvider(create: (_) => locator<RankingViewModel>()),
];
