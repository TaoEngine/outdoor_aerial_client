import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:outdoor_aerial_client/provider/provider_splash.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
      asyncNavigationCallback: () async {
        final isarLoad = ref.read(isarProvider.future);
        try {
          await Future.wait([isarLoad]);
        } catch (e) {
          /// TODO 设置跳转到错误页，让用户去重新配置登录
          rethrow;
        }
        if (context.mounted) {
          GoRouter.of(context).goNamed("MainPage");
        }
      },
    );
  }
}
