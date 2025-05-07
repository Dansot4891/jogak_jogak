import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_state.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_action.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Easy Localization Test를 위한 세팅
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();

  final state = MyPageState(
    user: const CertifiedUser(username: '테스터', email: 'test@test.com'),
  );
  void onAction(MyPageAction action) {}

  late Widget mypage;

  setUpAll(() {
    mypage = EasyLocalization(
      supportedLocales: const [Locale('ko', 'KR'), Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ko', 'KR'),
      child: MaterialApp(
        home: Builder(
          builder: (context) {
            AppSize.init(context);
            return Scaffold(body: MyPage(state: state, onAction: onAction));
          },
        ),
      ),
    );
  });

  testWidgets('MyPage shows logout dialogs', (tester) async {
    await tester.pumpWidget(mypage);

    final logoutButton = find.text(LocaleKeys.logout.tr());

    // 로그아웃 시 다이얼로그 확인
    await tester.tap(logoutButton);
    await tester.pumpAndSettle();
    expect(
      find.textContaining(LocaleKeys.myPageConfirmLogout.tr()),
      findsOneWidget,
    );
  });
}
