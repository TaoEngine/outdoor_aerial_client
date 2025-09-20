import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:outdoor_aerial_client/pages/main_page.dart';
import 'package:outdoor_aerial_client/pages/splash_page.dart';
import 'package:outdoor_aerial_client/widgets/play_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: "室外天线", routerConfig: router);
  }
}

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(path: "/", name: "Splash", builder: (context, state) => const SplashPage()),
    GoRoute(path: "/main", name: "MainPage", builder: (context, state) => const MainPage()),
    GoRoute(
      path: "/tuner/play",
      name: "PlayPage",
      builder: (context, state) => PlayStreamMobile(
        programName: "测试",
        programTitle: "测试Slogan",
        programHost: "博主",
        programBroadcasting: "测试电台",
        programDate: [DateTime.now()],
        programTime: DateTimeRange(start: DateTime.now(), end: DateTime.now()),
        onTimeReached: () {},
      ),
    ),
  ],
);
