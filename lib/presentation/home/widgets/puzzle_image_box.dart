import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/presentation/home/pages/home_view_model.dart';

class PuzzleImageBox extends StatelessWidget {
  final HomeViewModel viewModel;
  const PuzzleImageBox(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        viewModel.selectImage();
      },
      borderRadius: _borderRadiusGeometry,
      child: Container(
        width: _boxSize,
        height: _boxSize,
        decoration: BoxDecoration(
          borderRadius: _borderRadiusGeometry,
          border: Border.all(color: AppColor.grey80),
        ),
        child:
            viewModel.state.file == null
                ? Center(
                  child: Text('이미지를 선택해주세요', style: AppTextStyle.subText1),
                )
                : ClipRRect(
                  borderRadius: _borderRadiusGeometry,
                  child: Stack(
                    children: [
                      Image.file(
                        width: _boxSize,
                        height: _boxSize,
                        File(viewModel.state.file!.path),
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            viewModel.removeImage();
                          },
                          borderRadius: _borderRadiusGeometry,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: _borderRadiusGeometry,
                            ),
                            child: const Icon(Icons.close, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }

  BorderRadius get _borderRadiusGeometry => BorderRadius.circular(20);

  double get _boxSize => AppSize.screenWidth - 32;
}
