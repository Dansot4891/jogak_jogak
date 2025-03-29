import 'package:flutter/material.dart';
import 'package:jogak_jogak/puzzle_view.dart';

void main() {
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PuzzleView()
    );
  }
}