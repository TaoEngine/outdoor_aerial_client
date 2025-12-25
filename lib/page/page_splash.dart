import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlutterSplashScreen(
      useImmersiveMode: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      splashScreenBody: SplashLoading(),
      asyncNavigationCallback: () async {
        await Future.delayed(Duration(seconds: 5));
        if (context.mounted) {
          GoRouter.of(context).goNamed("MainPage");
        }
      },
    );
  }
}

class SplashLoading extends StatelessWidget {
  const SplashLoading({super.key});

  @Preview(group: "SplashPage相关组件", name: '加载中')
  const SplashLoading.preview({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        spacing: 72,
        children: [
          Hero(
            tag: "logo",
            child: Transform.scale(
              scale: 3,
              child: CircleAvatar(child: Icon(TablerIcons.antenna)),
            ),
          ),
          SizedBox.square(
            dimension: Theme.of(context).textTheme.displaySmall?.fontSize,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
