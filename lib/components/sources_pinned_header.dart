import 'package:flutter/material.dart';

class SourcesSliverTabbarDelegate extends SliverPersistentHeaderDelegate {
  SourcesSliverTabbarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => 64;
  @override
  double get maxExtent =>64;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      height: 64,
      color: Theme.of(context).canvasColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SourcesSliverTabbarDelegate oldDelegate) {
    return false;
  }
}