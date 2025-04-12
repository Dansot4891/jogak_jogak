import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';

class AppDialog extends Dialog {
  final String title;
  final String btnText;
  final Widget? innerWidget;
  final String? btnLeftText;
  final String? subText;
  final VoidCallback onBtnClicked;
  final VoidCallback? onBtnRightClicked;
  final double? width;
  const AppDialog({
    required this.title,
    required this.btnText,
    this.subText,
    this.innerWidget,
    this.btnLeftText,
    required this.onBtnClicked,
    this.onBtnRightClicked,
    this.width,
    super.key,
  });

  // 버튼 한 개
  factory AppDialog.singleBtn({
    required String title,
    required String btnText,
    String? subText,
    required VoidCallback onBtnClicked,
    double? width,
  }) {
    return AppDialog(
      title: title,
      subText: subText,
      btnText: btnText,
      onBtnClicked: onBtnClicked,
      width: width,
    );
  }

  // 버튼 한 개
  factory AppDialog.doubleBtns({
    required String title,
    required String btnLeftText,
    required String btnRightText,
    required VoidCallback onBtnLeftClicked,
    required VoidCallback onBtnRightClicked,
    String? subText,
    double? width,
  }) {
    return AppDialog(
      title: title,
      subText: subText,
      btnText: btnLeftText,
      btnLeftText: btnRightText,
      onBtnClicked: onBtnLeftClicked,
      onBtnRightClicked: onBtnRightClicked,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: AppTextStyle.title2),

            if (subText != null)
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 20),
                child: Text(
                  subText!,
                  style: AppTextStyle.body2.copyWith(color: AppColor.greyA7),
                  textAlign: TextAlign.center,
                ),
              ),
            if (subText == null) const SizedBox(height: 16),

            // inner widget
            if (innerWidget != null) innerWidget!,

            // two button
            if (btnLeftText != null && onBtnRightClicked != null)
              Row(
                children: [
                  AppButton(
                    text: btnText,
                    onTap: onBtnClicked,
                    textColor: AppColor.grey80,
                    bgColor: AppColor.greyE6,
                    isExpanded: true,
                  ),
                  const SizedBox(width: 8),
                  AppButton(
                    text: btnLeftText!,
                    onTap: onBtnRightClicked,
                    isExpanded: true,
                  ),
                ],
              ),

            // one button
            if (btnLeftText == null || onBtnRightClicked == null)
              AppButton(
                text: btnText,
                onTap: onBtnClicked,
                bgColor: AppColor.sub,
              ),
          ],
        ),
      ),
    );
  }
}
