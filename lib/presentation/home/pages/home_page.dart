import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/core/constants/app_data.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/module/state/state_handling.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncing_boxes_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/home/pages/home_view_model.dart';
import 'package:jogak_jogak/presentation/home/widgets/alert_message.dart';
import 'package:jogak_jogak/presentation/home/widgets/home_error.dart';
import 'package:jogak_jogak/presentation/home/widgets/level_button.dart';
import 'package:jogak_jogak/presentation/home/widgets/puzzle_image_box.dart';

class HomePage extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomePage(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return BouncingBoxesBackground(
      isScaffold: true,
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return StateHandling(
            state: viewModel.state.state,
            init: const BaseLoadingView(),
            loading: const BaseLoadingView(),
            error: HomeError(
              message: viewModel.state.errorMessage,
              onTap: () => viewModel.resetState(),
            ),
            success: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '사진을 넣거나 랜덤 퍼즐로\n가볍게 시작해보세요!',
                      style: AppTextStyle.title2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 16,
                      ),
                      child: PuzzleImageBox(viewModel),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                          AppData.levels
                              .map(
                                (e) => LevelButton(
                                  selectedLevel: viewModel.state.level,
                                  level: e,
                                  horizontalMargin: 4,
                                  onTap: () => viewModel.selectLevel(e),
                                ),
                              )
                              .toList(),
                    ),
                    const SizedBox(height: 8),
                    AppButton(
                      text: '오늘의 퍼즐 가져오기',
                      onTap: () {
                        viewModel.getRandomImageUrl();
                      },
                    ),
                    const AlertMessage(),
                    AppButton(
                      text: '게임 시작',
                      onTap:
                          viewModel.state.file == null
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
        },
      ),
    );
  }
}
