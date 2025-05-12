import 'dart:ui';

import 'package:bouncy_background/bouncy_background.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jogak_jogak/app/di/app_di.dart';
import 'package:jogak_jogak/app/router/router.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/core/firebase/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:jogak_jogak/presentation/auth/sign_in/sign_in_view_model.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_view_model.dart';
import 'package:jogak_jogak/presentation/home/pages/home_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_view_model.dart';
import 'package:jogak_jogak/presentation/my_info/puzzle_history/pages/puzzle_history_view_model.dart';
import 'package:jogak_jogak/presentation/puzzle/pages/puzzle_view_model.dart';
import 'package:jogak_jogak/presentation/rank/pages/ranking_view_model.dart';

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

  // Firebase Crashlytics
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // DI Setup
  diSetup();

  runApp(
    // Localization
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<SignInViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<SignUpViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<HomeViewModel>()),
        ChangeNotifierProvider(
          create: (_) => locator<ChangePasswordViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => locator<ChangeUsernameViewModel>(),
        ),
        ChangeNotifierProvider(create: (_) => locator<MyPageViewModel>()),
        ChangeNotifierProvider(
          create: (_) => locator<PuzzleHistoryViewModel>(),
        ),
        ChangeNotifierProvider(create: (_) => locator<PuzzleViewModel>()),
        ChangeNotifierProvider(create: (_) => locator<RankingViewModel>()),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ko', 'KR')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        // startLocale: const Locale('ko', 'KR'),
        child: const MyApp(),
      ),
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
