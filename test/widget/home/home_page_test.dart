import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/presentation/home/pages/home_action.dart';
import 'package:jogak_jogak/presentation/home/pages/home_page.dart';
import 'package:jogak_jogak/presentation/home/pages/home_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Easy Localization Test를 위한 세팅
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();

  HomeState state = const HomeState(level: 3, state: BaseState.success);
  void onAction(HomeAction action) {}
  // dotenv 호출
  await dotenv.load(fileName: '.env');

  final home = EasyLocalization(
    supportedLocales: const [Locale('ko', 'KR'), Locale('en', 'US')],
    path: 'assets/translations',
    fallbackLocale: const Locale('ko', 'KR'),
    child: MaterialApp(
      home: Builder(
        builder: (context) {
          AppSize.init(context);
          return Scaffold(body: HomePage(state: state, onAction: onAction));
        },
      ),
    ),
  );

  testWidgets('homePage find text', (tester) async {
    await tester.pumpWidget(home);

    expect(
      find.textContaining(LocaleKeys.homeStartGameButton.tr()),
      findsOneWidget,
    );
    expect(
      find.textContaining(LocaleKeys.homeTodayPuzzleButton.tr()),
      findsOneWidget,
    );
    expect(find.textContaining('3 X 3'), findsOneWidget);
    expect(find.textContaining('4 X 4'), findsOneWidget);
    expect(find.textContaining('5 X 5'), findsOneWidget);
  });
}
