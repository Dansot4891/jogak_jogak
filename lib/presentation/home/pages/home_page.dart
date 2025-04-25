import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/core/constants/app_data.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/module/state/state_handling.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/home/pages/home_action.dart';
import 'package:jogak_jogak/presentation/home/pages/home_state.dart';
import 'package:jogak_jogak/presentation/home/widgets/alert_message.dart';
import 'package:jogak_jogak/presentation/home/widgets/home_error.dart';
import 'package:jogak_jogak/presentation/home/widgets/level_button.dart';
import 'package:jogak_jogak/presentation/home/widgets/puzzle_image_box.dart';

class HomePage extends StatelessWidget {
  final HomeState state;
  final void Function(HomeAction action) onAction;
  const HomePage({required this.state, required this.onAction, super.key});

  @override
  Widget build(BuildContext context) {
    return StateHandling(
      state: state.state,
      init: const BaseLoadingView(),
      loading: const BaseLoadingView(),
      error: HomeError(
        message: state.errorMessage,
        onTap: () => onAction(const HomeAction.resetState()),
      ),
      success: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('사진을 넣거나 랜덤 퍼즐로\n가볍게 시작해보세요!', style: AppTextStyle.title2),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: PuzzleImageBox(state: state, onAction: onAction),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    AppData.levels
                        .map(
                          (e) => LevelButton(
                            selectedLevel: state.level,
                            level: e,
                            horizontalMargin: 4,
                            onTap: () => onAction(HomeAction.selectLevel(e)),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 8),
              AppButton(
                text: '오늘의 퍼즐 가져오기',
                onTap: () => onAction(const HomeAction.getRandomImageUrl()),
              ),
              const AlertMessage(),
              AppButton(
                text: '게임 시작',
                onTap:
                    state.file == null
                        ? null
                        : () {
                          navigate(context, route: AppRoute.puzzle);
                        },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
