import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/router.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/core/module/state/state_handling.dart';
import 'package:jogak_jogak/feature/puzzle/data/repository/puzzle_repository_impl.dart';
import 'package:jogak_jogak/feature/puzzle/domain/data_source/remote/puzzle_remote_data_source_impl.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncing_boxes_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/home/pages/home_view_model.dart';
import 'package:jogak_jogak/presentation/home/widgets/alert_message.dart';
import 'package:jogak_jogak/presentation/home/widgets/level_button.dart';
import 'package:jogak_jogak/presentation/home/widgets/puzzle_image_box.dart';

final HomeViewModel viewModel = HomeViewModel(
  PuzzleRepositoryImpl(PuzzleRemoteDataSourceImpl(FirebaseFirestore.instance)),
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
                    children: [
                      LevelButton(viewModel: viewModel, level: 3),
                      const SizedBox(width: 8),
                      LevelButton(viewModel: viewModel, level: 4),
                      const SizedBox(width: 8),
                      LevelButton(viewModel: viewModel, level: 5),
                    ],
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
            init: const Center(child: CircularProgressIndicator()),
            loading: const Center(child: CircularProgressIndicator()),
            error: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(viewModel.state.error, style: AppTextStyle.body1),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 40,
                    ),
                    child: AppButton(
                      text: '돌아가기',
                      onTap: () {
                        viewModel.resetState();
                      },
                    ),
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
