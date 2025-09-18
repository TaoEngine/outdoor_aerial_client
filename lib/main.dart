import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:outdoor_aerial_client/pages/main_page.dart';
import 'package:outdoor_aerial_client/pages/splash_page.dart';

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
    GoRoute(
      path: "/",
      name: "Splash",
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: "/main",
      name: "MainPage",
      builder: (context, state) => const MainPage()
    ),
  ],
);

