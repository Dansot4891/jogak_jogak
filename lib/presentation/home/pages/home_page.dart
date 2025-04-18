import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/core/constants/app_data.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/module/state/state_handling.dart';
import 'package:jogak_jogak/feature/puzzle/data/repository_impl/puzzle_repository_impl.dart';
import 'package:jogak_jogak/feature/puzzle/data/data_source/remote/puzzle_remote_data_source_impl.dart';
import 'package:jogak_jogak/feature/puzzle/domain/use_case/get_random_image_url_use_case.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncing_boxes_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/home/pages/home_view_model.dart';
import 'package:jogak_jogak/presentation/home/widgets/alert_message.dart';
import 'package:jogak_jogak/presentation/home/widgets/home_error.dart';
import 'package:jogak_jogak/presentation/home/widgets/level_button.dart';
import 'package:jogak_jogak/presentation/home/widgets/puzzle_image_box.dart';

final HomeViewModel viewModel = HomeViewModel(
  GetRandomImageUrlUseCase(
    PuzzleRepositoryImpl(
      PuzzleRemoteDataSourceImpl(FirebaseFirestore.instance),
    ),
  ),
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BouncingBoxesBackground(
      isScaffold: false,
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
            success: Container(
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
          );
        },
      ),
    );
  }
}
