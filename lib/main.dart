import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:outdoor_aerial_client/pages/main_page.dart';
import 'package:outdoor_aerial_client/pages/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final GoRouter mainAppRouter = GoRouter(
    initialLocation: "/loading",
    routes: <RouteBase>[
      //加载界面
      GoRoute(path: "/loading", name: "SplashPage", builder: (context, state) => const SplashPage()),
      // 应用主界面
      GoRoute(path: "/main", name: "MainPage", builder: (context, state) => const MainPage()),
      // TODO 应用搜索界面 暂未制作
      GoRoute(path: "/main/search", name: "SearchPage", builder: (context, state) => const Placeholder()),
      // TODO 调谐器频率播放界面 暂未制作
      GoRoute(path: "/tuner/channel/play", name: "PlayPage", builder: (context, state) => const Placeholder()),
      // TODO 调谐器频率搜索界面 暂未制作
      GoRoute(path: "/tuner/channel/scan", name: "ScanPage", builder: (context, state) => const Placeholder()),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "室外天线",
      routerConfig: mainAppRouter,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('zh', 'CN'), Locale('en', 'US')],
    );
  }
}
