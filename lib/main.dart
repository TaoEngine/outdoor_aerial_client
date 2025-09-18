import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:outline_aerial_client/pages/main_page.dart';
import 'package:outline_aerial_client/pages/splash_page.dart';

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
      name: "splash",
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: "/tuner",
      name: "ThisTuner",
      builder: (context, state) {
        return Scaffold(
          body: Placeholder(),
          bottomNavigationBar: MainNavigation(),
        );
      },
    ),
  ],
);
