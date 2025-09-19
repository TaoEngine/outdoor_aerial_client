import 'package:flutter/material.dart';

class TunerPage extends StatefulWidget {
  const TunerPage({super.key});

  @override
  State<TunerPage> createState() => _TunerPageState();
}

class _TunerPageState extends State<TunerPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(
              icon: Image.network(
                "https://ytmedia.radio.cn/CCYT%2F202407%2F23%2F20%2FySDxekAkYODX0CiElAjIfhrzA5Af0ugnlKkGHhTboa2024072320988.jpg",
              ),
            ),
            Tab(
              icon: Image.network(
                "https://ytmedia.radio.cn/CCYT%2F202407%2F23%2F20%2FPIaFilaog3C7OCpvyjBJ1soT40EMErj1y2024072320478.jpg",
              ),
            ),
            Tab(
              icon: Image.network(
                "https://ytmedia.radio.cn/CCYT%2F202307%2F19%2F14%2Fr40Lbd5da1p3BFPDF0JuyNmJILvsZ5DLnoRWk8Cdfzy2023071914352.jpg",
              ),
            ),
            Tab(
              icon: Image.network(
                "https://ytmedia.radio.cn/CCYT%2F202407%2F23%2F20%2Fe3Tt7oCvlk7Jqvc9quZuStEXorRqMLa8ysWS2024072320460.jpg",
              ),
            ),
            Tab(
              icon: Image.network(
                "https://ytmedia.radio.cn/CCYT%2F202407%2F23%2F20%2FJwbi4NDQ2024072320225.png",
              ),
            ),
            Tab(
              icon: Image.network(
                "https://ytmedia.radio.cn/CCYT%2F202407%2F23%2F20%2FTWUnd3Dx91UHm2024072320530.jpg",
              ),
            ),
            Tab(
              icon: Image.network(
                "https://ytmedia.radio.cn/CCYT%2F202407%2F23%2F21%2FqrAYKFsw1eT1zBqivRaAw7wqDTub9JBBRe2024072321762.PNG",
              ),
            ),
            Tab(
              icon: Image.network(
                "https://ytmedia.radio.cn/CCYT%2F202407%2F23%2F20%2F7UD3U0bncsbHFPya0MF2024072320388.jpg",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
