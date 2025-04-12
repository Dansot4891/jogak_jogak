import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/router.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const DefaultAppbar({this.title = '', super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: AppColor.white,
        title: Text(title, style: AppTextStyle.appbar),
        leading: InkWell(
          onTap: () {
            pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
