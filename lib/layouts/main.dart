import 'dart:ui';

import 'package:alisher_navoi/app/bottom_navigation.dart';
import 'package:alisher_navoi/components/nav_bar.dart';
import 'package:alisher_navoi/router.dart';
import 'package:alisher_navoi/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  final BottomNavigationModel model = BottomNavigationModel();
  final Widget child;
  final bool isProfile, isNews;
  final bool showOverlay;
  final String label;

  MainLayout({
    this.child,
    this.isProfile = false,
    this.isNews = false,
    this.showOverlay = false,
    this.label,
  });

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  void initState() {
    super.initState();
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
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, 56),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.color,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        blurRadius: 25,
                        //spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/logo.svg'),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                widget.label ?? '',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                createRoute(
                                  SearchScreen(),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              'assets/icons/search.svg',
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              body: Container(
                height: double.infinity,
                child: widget.child,
              ),
              bottomNavigationBar: Consumer<BottomNavigationModel>(
                builder: (context, notifier, child) => Container(
                  color: Theme.of(context).bottomAppBarTheme.color,
                  child: SafeArea(
                    child: MyNavBarComponent(
                      notifier: notifier,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
