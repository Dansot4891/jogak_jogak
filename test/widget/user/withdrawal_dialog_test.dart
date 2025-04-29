import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_state.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_action.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Easy Localization Test를 위한 세팅
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();

  final state = MyPageState(username: '테스터');
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

  testWidgets('MyPage shows withdrawal dialogs', (tester) async {
    await tester.pumpWidget(mypage);

    // 회원탈퇴버튼
    final withdrawalButton = find.text(LocaleKeys.withdrawal.tr());

    // 버튼이 보이도록 설정
    await tester.tap(withdrawalButton);

    // 모든 애니메이션, 모든 비동기 작업들이 끝날 때까지 기다렸다가 테스트를 다음 단계로 넘긴다.
    await tester.pumpAndSettle();

    // expect(, matcher)

    expect(
      find.textContaining(LocaleKeys.myPageConfirmWithdrawal.tr()),
      findsOneWidget,
    );
  });
}
