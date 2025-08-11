import 'package:flutter/material.dart';
import 'package:outline_aerial_client/pages/tuner_page.dart';
import 'package:outline_aerial_client/widgets/main_navigation_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "室外天线", home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MainNavigation();
  }
}
