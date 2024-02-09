import 'package:alisher_navoi/models/book.dart';
import 'package:alisher_navoi/screens/tests/test_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../router.dart';

class TestResultScreen extends StatefulWidget {
  final Book book;
  TestResultScreen({
    this.book,
  });
  @override
  _TestResultScreenState createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 40,
                      child: SvgPicture.asset('assets/icons/back_arrow.svg'),
                    ),
                  ),
                  Text(
                    'Test',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: 40,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                SvgPicture.asset(
                  'assets/icons/ornament_bg.svg',
                  width: double.infinity,
                  color: Theme.of(context).disabledColor,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    child: Image.asset(
                                      widget.book.image,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                widget.book.title,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                '${widget.book.title}',
                                style: TextStyle(
                                  color: Color(0xff96979C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          //info widget
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Color(0xffF6F6F6),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                '8 ta',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .color,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'savol',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .color,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 1,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 3),
                                            color: Color(0xffCACBCE),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                '16 ta',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .color,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'noto\'g\'ri',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .color,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '5 kundan so‘ng qayta urunib ko‘rishingiz mumkin',
                                        style: TextStyle(
                                          color: Color(0xff96979C),
                                          fontSize: 13,
                                        ),
                                        maxLines: 3,
                                        textWidthBasis:
                                            TextWidthBasis.longestLine,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    createRoute(
                                      TestQuestionScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  width: double.infinity,
                                  height: 44,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xff96979C),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Testni boshlash",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16),
                                        child: SvgPicture.asset(
                                          'assets/icons/chevrons_right.svg',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}
