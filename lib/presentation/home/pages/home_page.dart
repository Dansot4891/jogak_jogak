import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/router.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncing_boxes_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/home/pages/home_view_model.dart';
import 'package:jogak_jogak/presentation/home/widgets/alert_message.dart';
import 'package:jogak_jogak/presentation/home/widgets/puzzle_image_box.dart';

final HomeViewModel viewModel = HomeViewModel();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BouncingBoxesBackground(
      isScaffold: false,
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return Container(
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
                  child: PuzzleImageBox(viewModel),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppButton(
                        text: '3 X 3',
                        onTap: () {
                          viewModel.selectLevel(3);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppButton(
                        text: '4 X 4',
                        onTap: () {
                          viewModel.selectLevel(4);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppButton(
                        text: '5 X 5',
                        onTap: () {
                          viewModel.selectLevel(5);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                AppButton(text: '오늘의 퍼즐 가져오기', onTap: () {}),
                const AlertMessage(),
                AppButton(
                  text: '게임 시작',
                  onTap: () {
                    navigate(context, route: AppRoute.puzzle);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
