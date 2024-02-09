import 'package:alisher_navoi/components/profile_pinned_header.dart';
import 'package:alisher_navoi/components/sequel.dart';
import 'package:alisher_navoi/components/sources_pinned_header.dart';
import 'package:alisher_navoi/layouts/main.dart';
import 'package:alisher_navoi/models/sequel.dart';
import 'package:flutter/material.dart';

class SourcesScreen extends StatefulWidget {
  @override
  _SourcesScreenState createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen>
    with TickerProviderStateMixin {
  ScrollController _scrollController;
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  List<Sequel> sequels = [
    Sequel(
      title: 'Hayrat ul-abror',
      subTitle: 'Yaxshi kishilarning hayratlanishi',
      chapterNum: 56,
      mb: '4',
      image: 'assets/images/doston1.png',
    ),
    Sequel(
      title: 'Sab’ai Sayyor',
      subTitle: 'Yetti sayyora',
      chapterNum: 56,
      mb: '4',
      image: 'assets/images/doston2.png',
    ),
    Sequel(
      title: 'Layli va majnun',
      subTitle: 'Yetti sayyora',
      chapterNum: 56,
      mb: '4',
      image: 'assets/images/doston3.png',
    ),
    Sequel(
      title: 'Farxod va Shirin',
      subTitle: 'Yetti sayyora',
      chapterNum: 56,
      mb: '4',
      image: 'assets/images/doston4.png',
    ),
    Sequel(
      title: 'Saddi Iskandariy',
      subTitle: 'Yetti sayyora',
      chapterNum: 56,
      mb: '4',
      image: 'assets/images/doston5.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      label: 'Manbaalar',
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              delegate: SourcesSliverTabbarDelegate(
                TabBar(
                  onTap: (int pos) async {
                    // print(pos);
                    // print(keys[pos].currentContext);
                    // _scrollToIndex(pos);
                    // Scrollable.ensureVisible(
                    //   keys[pos].currentContext ?? context,
                    // );
                  },
                  isScrollable: true,
                  indicatorWeight: 0.1,
                  indicator: BoxDecoration(
                    color: Color(0xffFA784A),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  physics: BouncingScrollPhysics(),
                  controller: tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Color(0xff5D6066),
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: Color(0xff1A1A1A),
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: Color(0xff5D6066),
                  ),
                  tabs: [
                    Container(
                      decoration: BoxDecoration(
                        // color: Color(0xff292D36)
                      ),
                      child: Tab(text: 'Dostonlar'),
                    ),
                    Container(
                      child: Tab(text: 'G‘azallar'),
                    ),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListView.builder(
              padding: EdgeInsets.only(top: 24),
              itemCount: sequels.length,
              itemBuilder: (context, index) => SequelComponent(
                sequel: sequels[index],
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: 24),
              itemCount: sequels.length,
              itemBuilder: (context, index) => SequelComponent(
                sequel: sequels[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
