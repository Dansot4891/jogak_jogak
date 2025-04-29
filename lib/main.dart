import 'package:bouncy_background/bouncy_background.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jogak_jogak/app/di/app_di.dart';
import 'package:jogak_jogak/app/router/router.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/core/firebase/firebase_options.dart';

final router = AppRouter.appRouter();

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // 가로모드 금지
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Localization
  await EasyLocalization.ensureInitialized();

  // Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // DI Setup
  diSetup();

  runApp(
    // Localization
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ko', 'KR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      startLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BouncyDeviceSize.init(context);
    // app size 할당
    AppSize.init(context);
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}
