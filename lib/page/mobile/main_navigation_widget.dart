import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class _GenerateMainNavigation<T> extends StatelessWidget {
  /// 由于APP包含这些主页面
  /// 所以导航栏的生成内容是固定的
  static const Map<String, IconData> _mainNavigationUnit = {
    "调谐器": TablerIcons.antenna,
    "节目单": TablerIcons.timeline_event_text,
    "我喜欢": TablerIcons.heart,
    "改设置": TablerIcons.settings,
  };

  /// 导航栏生成器
  /// 可以生成两种导航栏
  /// - [NavigationBar] 横着的导航栏，用于移动设备
  /// - [NavigationRail] 竖着的导航栏，用于桌面设备
  const _GenerateMainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    if (T == NavigationBar) {
      return NavigationBar(
        destinations: _mainNavigationUnit.entries
            .map((entry) => NavigationDestination(icon: Icon(entry.value), label: entry.key))
            .toList(),
      );
    } else if (T == NavigationRail) {
      return NavigationRail(
        destinations: _mainNavigationUnit.entries
            .map((entry) => NavigationRailDestination(icon: Icon(entry.value), label: Text(entry.key)))
            .toList(),
        selectedIndex: 0,
        labelType: NavigationRailLabelType.all,
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      );
    } else {
      throw UnimplementedError('抱歉不能制作 <$T> 类型的导航栏哈');
    }
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> with TickerProviderStateMixin {
  /// 屏幕大小在多少的时候实施切换
  static const double _screenCustomWidth = 640;

  /// 当前选择的界面
  int selectedIndex = 0;

  late AnimationController _navigationBarAnimationController;
  late AnimationController _navigationRailAnimationController;
  late Animation<Offset> _navigationBarAnimation;
  late Animation<Offset> _navigationRailAnimation;

  @override
  void initState() {
    super.initState();
    _navigationBarAnimationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _navigationRailAnimationController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);

    _navigationBarAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 1),
    ).animate(CurvedAnimation(parent: _navigationBarAnimationController, curve: Curves.easeInOut));

    _navigationRailAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(-1, 0),
    ).animate(CurvedAnimation(parent: _navigationRailAnimationController, curve: Curves.easeInOut));

    // 监听隐藏动画完成
    _navigationBarAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigationRailAnimationController.reverse();
      }
    });

    // 监听显示动画完成
    _navigationRailAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigationBarAnimationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _navigationBarAnimationController.dispose();
    _navigationRailAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool showRail = constraints.maxWidth >= _screenCustomWidth;

        // 要保证竖向导航栏动画要在横向导航栏之前
        if (showRail) {
          _navigationBarAnimationController.forward();
        } else {
          _navigationRailAnimationController.forward();
        }

        return Scaffold(
          bottomNavigationBar:
              // FIXME: 逻辑缺少导致动画不连贯
              (!_navigationRailAnimation.isAnimating && !showRail) || _navigationBarAnimation.isAnimating
              ? SlideTransition(position: _navigationBarAnimation, child: _GenerateMainNavigation<NavigationBar>())
              : null,
          body: Row(
            children: <Widget>[
              SlideTransition(position: _navigationRailAnimation, child: _GenerateMainNavigation<NavigationRail>()),
              Expanded(child: Container()),
            ],
          ),
        );
      },
    );
  }
}

class MainNavigationNotifier extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeNavigation(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
