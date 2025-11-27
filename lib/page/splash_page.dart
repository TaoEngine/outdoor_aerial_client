import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      useImmersiveMode: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      splashScreenBody: Center(
        child: Text("Outdoor Aerial", style: Theme.of(context).textTheme.displayLarge),
      ),
      asyncNavigationCallback: () async {
        await Future.delayed(const Duration(seconds: 1));
        if (context.mounted) {
          GoRouter.of(context).goNamed("MainPage");
        }
      },
    );
  }
}
