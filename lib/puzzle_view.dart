import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PuzzleView extends StatelessWidget {
  const PuzzleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ImgPicker {
  static Future<String?> pickImage() async {
    final picker = ImagePicker();
    // final resp = await picker.pickImage(source: source)
    return null;
  }
}