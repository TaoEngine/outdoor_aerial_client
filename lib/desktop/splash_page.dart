import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m3e_collection/m3e_collection.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      useImmersiveMode: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      splashScreenBody: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          spacing: 16,
          children: [
            Text(
              "Outdoor Aerial",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox.square(
              dimension: Theme.of(context).textTheme.displayLarge?.fontSize,
              child: LoadingIndicatorM3E(),
            ),
          ],
        ),
      ),
      asyncNavigationCallback: () async {
        await Future.delayed(const Duration(seconds: 5));
        if (context.mounted) {
          GoRouter.of(context).goNamed("MainPage");
        }
      },
    );
  }
}
