import 'dart:async';
import 'dart:convert';

import 'package:alisher_navoi/app/bottom_navigation.dart';
import 'package:alisher_navoi/components/sequel.dart';
import 'package:alisher_navoi/layouts/test.dart';
import 'package:alisher_navoi/models/book.dart';
import 'package:alisher_navoi/router.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class BookLayout extends StatefulWidget {
  final BottomNavigationModel model = BottomNavigationModel();
  final Book book;
  final String asset;
  BookLayout({
    this.book,
    this.asset,
  });

  @override
  _BookLayoutState createState() => _BookLayoutState();
}

class _BookLayoutState extends State<BookLayout> with TickerProviderStateMixin {
  AutoScrollController _autoScrollController;
  TabController _tabController;
  ScrollController _scrollController;
  bool _visible = false;
  bool isMenu = false;
  bool lastStatus = true;
  bool searched = false;
  List<GlobalKey> keys = [];

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset >
            (MediaQuery.of(context).size.height / 1.6 - 56);
  }

  AnimationController _controllerA;

  var squareScaleA = 0.95;

  @override
  void initState() {
    _controllerA = AnimationController(
      vsync: this,
      lowerBound: 0.95,
      upperBound: 1.0,
      duration: Duration(milliseconds: 200),
    );

    _controllerA.addListener(() {
      setState(() {
        squareScaleA = _controllerA.value;
      });
    });

    _controllerA.forward(from: 0.0);
    _autoScrollController = AutoScrollController();
    _autoScrollController.addListener(() {
      if (_autoScrollController.offset < 496.10838968256826) {
        setState(() {
          isMenu = false;
        });
      }
    });
    _autoScrollController.addListener(_scrollListener);
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _visible = true;
      });
    });
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerA.dispose();

    _autoScrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.model,
      child: KeyboardDismisser(
        gestures: [GestureType.onTap],
        child: Stack(
          children: [
            Scaffold(
              body: Scrollbar(
                thickness: 2,
                isAlwaysShown: true,
                controller: _scrollController,
                child: CustomScrollView(
                  controller: _autoScrollController,
                  slivers: [
                    SliverAppBar(
                      floating: false,
                      automaticallyImplyLeading: true,
                      pinned: true,
                      expandedHeight: MediaQuery.of(context).size.height / 1.7,
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 200),
                          // child: SvgPicture.asset(
                          //   'assets/icons/back.svg',
                          //   color: Colors.red,
                          //   width: 100,
                          //   height: 100,
                          // ),
                          child: SvgPicture.asset(
                            'assets/icons/back.svg',
                            key: Key((isShrink).toString()),
                            color: isShrink
                                ? Theme.of(context).textTheme.bodyText1.color
                                : Colors.white,
                          ),
                        ),
                      ),
                      title: Container(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 56,
                            ),
                            Positioned(
                              left: 0,
                              right: 44,
                              bottom: 0,
                              top: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedSwitcher(
                                    duration: Duration(milliseconds: 200),
                                    // opacity: isShrink ? 1 : 0,
                                    child: Text(
                                      widget.book.title ?? '',
                                      key: Key((isShrink).toString()),
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: isShrink
                                            ? Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .color
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Image.asset(
                                      widget.book.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    top: 0,
                                    child: Container(
                                      color: Color(0xff573070).withOpacity(0.9),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: SafeArea(
                                      child: Container(
                                        padding: EdgeInsets.all(20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: 56,
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            5,
                                                    child: Image.asset(
                                                        widget.book.image),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 32,
                                                ),
                                                Text(
                                                  widget.book.title,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1,
                                                ),
                                                Text(
                                                  '${widget.book.year}-yil',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                color: Color(0xff432557)
                                                    .withOpacity(0.6),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: IntrinsicHeight(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          widget.book.lang,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          'til',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 24,
                                                    ),
                                                    Container(
                                                      width: 1,
                                                      color: Colors.white
                                                          .withOpacity(0.2),
                                                    ),
                                                    SizedBox(
                                                      width: 24,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          '${widget.book.chapterNum} ta',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          'bo‘lim',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 24,
                                                    ),
                                                    Container(
                                                      width: 1,
                                                      color: Colors.white
                                                          .withOpacity(0.2),
                                                    ),
                                                    SizedBox(
                                                      width: 24,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          widget.book.pageNum
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          'sahifa',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate.fixed(
                        [
                          widget.book.sequels != null
                              ? ListView.builder(
                                  padding: EdgeInsets.only(top: 24),
                                  itemCount: widget.book.sequels.length,
                                  itemBuilder: (context, index) =>
                                      SequelComponent(
                                    sequel: widget.book.sequels[index],
                                  ),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate.fixed(
                        [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kitob haqida',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  widget.book.firstContent,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    width: double.infinity,
                                    child: Image.asset(
                                      widget.book.imageContent,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  widget.book.secondContent,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Text(
                                  'Kitob haqida',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  widget.book.firstContent,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    width: double.infinity,
                                    child: Image.asset(
                                      widget.book.imageContent,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  widget.book.secondContent,
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                  // body: Container(
                  //   child: Scrollbar(
                  //     thickness: 2,
                  //     isAlwaysShown: true,
                  //     controller: _scrollController,
                  //     // radius: Radius.circular(1),

                  //     child: SingleChildScrollView(
                  //       //physics: NeverScrollableScrollPhysics(),
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                  //       controller: _scrollController,
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             'Kitob haqida',
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 18,
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 20,
                  //           ),
                  //           Text(
                  //             widget.book.firstContent,
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 13,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 20,
                  //           ),
                  //           ClipRRect(
                  //             borderRadius: BorderRadius.circular(8),
                  //             child: Container(
                  //               width: double.infinity,
                  //               child: Image.asset(
                  //                 widget.book.imageContent,
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 20,
                  //           ),
                  //           Text(
                  //             widget.book.secondContent,
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 13,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 32,
                  //           ),
                  //           Text('Kitob haqida'),
                  //           SizedBox(
                  //             height: 20,
                  //           ),
                  //           Text(
                  //             widget.book.firstContent,
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 13,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 20,
                  //           ),
                  //           ClipRRect(
                  //             borderRadius: BorderRadius.circular(8),
                  //             child: Container(
                  //               width: double.infinity,
                  //               child: Image.asset(
                  //                 widget.book.imageContent,
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 20,
                  //           ),
                  //           Text(
                  //             widget.book.secondContent,
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 13,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: Container(
                // color: Color(0xFAffffff),
                color:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.98),
                height: 98,
                child: Row(
                  children: [
                    Flexible(
                      flex: 60,
                      child: GestureDetector(
                        onTap: () async {
                          EpubViewer.setConfig(
                            themeColor: Theme.of(context).primaryColor,
                            identifier: "iosBook",
                            scrollDirection: EpubScrollDirection.HORIZONTAL,
                            allowSharing: false,
                            enableTts: false,
                            nightMode: false,
                          );

                          await EpubViewer.openAsset(
                            widget?.book?.asset ??
                                widget.asset ??
                                'assets/layli.epub',
                            lastLocation: EpubLocator.fromJson({
                              "bookId": "2239",
                              "href": "/OEBPS/ch06.xhtml",
                              "created": 1539934158390,
                              "locations": {
                                "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
                              }
                            }), // first page will open up if the value is null
                          );
                          EpubViewer.locatorStream.listen((locator) {
                            print(
                                'LOCATOR: ${EpubLocator.fromJson(jsonDecode(locator))}');
                            // convert locator from string to json and save to your database to be retrieved later
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          height: 44,
                          // alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xffFA784A),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "O'qishni boshlash",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/chevrons_right.svg',
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(),
                      flex: 5,
                    ),
                    Flexible(
                      flex: 25,
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.of(context).push(
                            createRoute(TestLayout(
                              book: widget.book,
                            )),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          height: 44,
                          decoration: BoxDecoration(
                            color: Color(0xff96979C),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Test",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/test.svg',
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
