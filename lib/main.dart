import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:m3e_collection/m3e_collection.dart';

import 'package:outdoor_aerial_client/page/main_page.dart';
import 'package:outdoor_aerial_client/page/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  /// 应用全局路由
  static final GoRouter mainAppRouter = GoRouter(
    initialLocation: "/init",
    routes: <RouteBase>[
      //加载界面
      GoRoute(path: "/init", name: "SplashPage", builder: (context, state) => const SplashPage()),
      // 应用主界面
      GoRoute(path: "/main", name: "MainPage", builder: (context, state) => const MainPage()),
      // TODO 应用搜索界面 暂未制作
      GoRoute(path: "/main/search", name: "SearchPage", builder: (context, state) => const Placeholder()),
      // TODO 调谐器频率播放界面 暂未制作
      GoRoute(path: "/tuner/channel/play", name: "PlayPage", builder: (context, state) => const Placeholder()),
      // TODO 调谐器频率搜索界面 暂未制作
      GoRoute(path: "/tuner/channel/scan", name: "ScanPage", builder: (context, state) => const Placeholder()),
      // TODO 节目界面 暂未制作
      GoRoute(path: "/program", name: "ProgramPage", builder: (context, state) => const Placeholder()),
    ],
  );

  /// 应用语言配置
  static const localizationsDelegates = [
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  /// 应用支持的语言
  static const supportedLocales = [Locale('en', 'US'), Locale('zh', 'CN')];

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) => MaterialApp.router(
        title: "室外天线",
        theme: withM3ETheme(ThemeData(fontFamily: "AlibabaPuHuiTi", colorScheme: lightDynamic)),
        darkTheme: withM3ETheme(ThemeData(fontFamily: "AlibabaPuHuiTi", colorScheme: darkDynamic)),
        routerConfig: mainAppRouter,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
      ),
    );
  }
}
