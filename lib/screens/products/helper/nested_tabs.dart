import 'package:flutter/material.dart';



class BaseNestedTabBar extends StatefulWidget {
  final List<BaseTabPage> tabs;
  final Color? color;
  final Color? indicatorColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final bool? isScrollable;
  final TabBarIndicatorSize? indicatorSize;
  final Decoration? indicator;
  final Function(BaseTabPage page)? buildTab;

  BaseNestedTabBar(
      {required this.tabs,
        this.color,
        this.indicatorColor,
        this.labelColor,
        this.unselectedLabelColor,
        this.indicator,
        this.indicatorSize,
        this.isScrollable = false,
        this.buildTab});

  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<BaseNestedTabBar>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;

  @override
  void initState() {
    super.initState();
    _nestedTabController =
    new TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)),
                color: widget.color ,
                child: TabBar(
                  isScrollable: widget.isScrollable!,
                  controller: _nestedTabController,
                  indicatorColor: widget.indicatorColor,
                  indicatorSize: widget.indicatorSize,
                  indicator: widget.indicator,
                  labelColor: widget.labelColor ,
                  unselectedLabelColor:
                  widget.unselectedLabelColor ,
                  tabs: widget.buildTab != null
                      ? widget.tabs
                      .map<Widget>((page) => widget.buildTab!(page))
                      .toList()
                      : widget.tabs
                      .map((page) => Tab(text: page.title, icon: page.icon))
                      .toList(),
                )),
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: TabBarView(
                      controller: _nestedTabController,
                      children: widget.tabs.map<Widget>((BaseTabPage page) {
                        return page.body ??
                            Container(
                                child: const Center(
                                    child: Text('No Data found',
                                       )));
                      }).toList())))
        ]));
  }
}

class BaseTabPage {
  const BaseTabPage(
      {required this.title, this.icon, this.body, this.tabIndex});

  final int? tabIndex;
  final String title;
  final Widget? body;
  final Icon?  icon;
}