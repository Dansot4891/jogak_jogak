import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';

class BaseLoadingView extends StatelessWidget {
  const BaseLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class BaseErrorView extends StatelessWidget {
  final String message;
  const BaseErrorView(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message, style: AppTextStyle.body1));
  }
}
