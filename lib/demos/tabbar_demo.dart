import 'package:flutter/material.dart';

class TabBarTemplate extends StatefulWidget {
  const TabBarTemplate({super.key});

  @override
  State<TabBarTemplate> createState() => _TabBarTemplateState();
}

class _TabBarTemplateState extends State<TabBarTemplate> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomAppBar(child: _myTabView()),
        appBar: AppBar(),
        body: _tabbarView(),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        controller: _tabController,
        tabs: _MyTabViews.values
            .map((e) => Tab(
                  child: Icon(_getIconData(e)),
                ))
            .toList());
  }

  TabBarView _tabbarView() {
    return TabBarView(physics: const NeverScrollableScrollPhysics(), controller: _tabController, children: [
      Container(color: Colors.red),
      Container(color: Colors.blue),
      Container(color: Colors.amber),
      Container(color: Colors.black)
    ]);
  }
}

enum _MyTabViews { home, settings, search, bookmark }

extension _MyTabViewExtension on _MyTabViews {}

IconData _getIconData(_MyTabViews tabName) {
  switch (tabName) {
    case _MyTabViews.home:
      return Icons.home;
    case _MyTabViews.settings:
      return Icons.settings;
    case _MyTabViews.search:
      return Icons.search_outlined;
    case _MyTabViews.bookmark:
      return Icons.bookmark_outlined;
  }
}
