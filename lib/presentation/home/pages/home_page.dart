import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/service/admob/admob_mixin.dart';
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

class HomePage extends StatefulWidget {
  final HomeState state;
  final void Function(HomeAction action) onAction;
  const HomePage({required this.state, required this.onAction, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AdmobMixin {
  @override
  void initState() {
    getBanner();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StateHandling(
      state: widget.state.state,
      init: const BaseLoadingView(),
      loading: const BaseLoadingView(),
      error: HomeError(
        message: widget.state.errorMessage,
        onTap: () => widget.onAction(const HomeAction.resetState()),
      ),
      success: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              banner(),
              // Text(LocaleKeys.homeGuideText.tr(), style: AppTextStyle.title2),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: PuzzleImageBox(
                  state: widget.state,
                  onAction: widget.onAction,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    AppData.levels
                        .map(
                          (e) => LevelButton(
                            selectedLevel: widget.state.level,
                            level: e,
                            horizontalMargin: 4,
                            onTap:
                                () =>
                                    widget.onAction(HomeAction.selectLevel(e)),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 8),
              AppButton(
                text: LocaleKeys.homeTodayPuzzleButton.tr(),
                onTap:
                    () => widget.onAction(const HomeAction.getRandomImageUrl()),
              ),
              const AlertMessage(),
              AppButton(
                text: LocaleKeys.homeStartGameButton.tr(),
                onTap:
                    widget.state.file == null
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
