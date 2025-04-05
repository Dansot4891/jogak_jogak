import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/firebase_options.dart';
import 'package:jogak_jogak/presentation/page/sign_in/sign_in_page.dart';
import 'package:jogak_jogak/presentation/page/puzzle_game/puzzle_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

late Size ratio;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ratio = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SignInPage()
    );
  }
}