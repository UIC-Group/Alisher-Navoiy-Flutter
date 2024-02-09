import 'package:flutter/material.dart';

class SliverTabbarDelegate extends SliverPersistentHeaderDelegate {
  SliverTabbarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Theme.of(context).canvasColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverTabbarDelegate oldDelegate) {
    return false;
  }
}