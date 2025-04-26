import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_state.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_action.dart';

void main() {
  final state = MyPageState(username: '테스터');
  void onAction(MyPageAction action) {}

  final mypage = MaterialApp(
    home: Builder(
      builder: (context) {
        AppSize.init(context);
        return Scaffold(body: MyPage(state: state, onAction: onAction));
      },
    ),
  );
  testWidgets('MyPage find text', (tester) async {
    await tester.pumpWidget(mypage);

    // 기본 텍스트 검증
    expect(find.textContaining('테스터님'), findsOneWidget);
    expect(find.textContaining('닉네임 변경'), findsOneWidget);
    expect(find.textContaining('비밀번호 변경'), findsOneWidget);
    expect(find.textContaining('퍼즐 기록'), findsOneWidget);
  });

  testWidgets('MyPage shows logout dialogs', (tester) async {
    await tester.pumpWidget(mypage);

    // 로그아웃 시 다이얼로그 확인
    await tester.tap(find.text('로그아웃'));
    await tester.pumpAndSettle();
    expect(find.textContaining('로그아웃 하시겠습니까?'), findsOneWidget);
  });

  testWidgets('MyPage shows withdrawal dialogs', (tester) async {
    await tester.pumpWidget(mypage);

    // 회원탈퇴 시 다이얼로그 확인
    final withdrawalButton = find.text('회원탈퇴');
    // 버튼이 보이도록 설정
    await tester.ensureVisible(withdrawalButton);
    await tester.tap(withdrawalButton);
    await tester.pumpAndSettle();
    expect(find.textContaining('회원탈퇴 하시겠습니까?'), findsOneWidget);
  });
}
