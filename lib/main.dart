import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/core/style/bouncing_boxes_background.dart';
import 'package:jogak_jogak/firebase_options.dart';
import 'package:jogak_jogak/presentation/auth/pages/sign_in_page.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_page.dart';
import 'package:jogak_jogak/presentation/auth/pages/sign_up_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // app size 할당
    AppSize.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BouncingBoxesBackground()
    );
  }
}