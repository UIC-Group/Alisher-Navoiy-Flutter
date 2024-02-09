import 'dart:ui';

import 'package:alisher_navoi/components/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.color,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                blurRadius: 25,
                spreadRadius: 4,
              ),
            ],
          ),
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SearchFieldComponent(
                      controller: controller,
                      focused: controller.text != '',
                      onSearchChanged: (_) {
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    width: 36,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      'assets/icons/cancel.svg',
                      color: Theme.of(context).textTheme.bodyText1.color,
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
      ),
    );
  }
}
