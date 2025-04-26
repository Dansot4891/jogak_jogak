import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/presentation/home/pages/home_action.dart';
import 'package:jogak_jogak/presentation/home/pages/home_page.dart';
import 'package:jogak_jogak/presentation/home/pages/home_state.dart';

void main() {
  HomeState state = const HomeState(level: 3, state: BaseState.success);
  void onAction(HomeAction action) {}

  final home = MaterialApp(
    home: Builder(
      builder: (context) {
        AppSize.init(context);
        return Scaffold(body: HomePage(state: state, onAction: onAction));
      },
    ),
  );
  testWidgets('homePage find text', (tester) async {
    await tester.pumpWidget(home);

    expect(find.textContaining('게임 시작'), findsOneWidget);
    expect(find.textContaining('오늘의 퍼즐 가져오기'), findsOneWidget);
    expect(find.textContaining('3 X 3'), findsOneWidget);
    expect(find.textContaining('4 X 4'), findsOneWidget);
    expect(find.textContaining('5 X 5'), findsOneWidget);
  });
}
