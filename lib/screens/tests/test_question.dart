import 'package:alisher_navoi/models/book.dart';
import 'package:alisher_navoi/screens/tests/test_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../router.dart';

class TestQuestionScreen extends StatefulWidget {
  final Book book;
  TestQuestionScreen({
    this.book,
  });

  @override
  _TestQuestionScreenState createState() => _TestQuestionScreenState();
}

class _TestQuestionScreenState extends State<TestQuestionScreen> {
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
          SvgPicture.asset(
            'assets/icons/ornament_bg.svg',
            width: double.infinity,
            color: Theme.of(context).disabledColor,
            fit: BoxFit.contain,
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xff292D36),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Question status row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1-Savol',
                              style: TextStyle(
                                  color: Color(0xffCACBCE),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  'To‘gri javoblar:',
                                  style: TextStyle(
                                      color: Color(0xffCACBCE),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' 4/20',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: 100,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xff96979C),
                          ),
                        ),
                        Text(
                            'Ushbu testning savolini yozish uchun media team’ning yordami zarur tak shto notogri tushunmaysiz degan umid gafurov'),
                        SizedBox(
                          height: 10,
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Text(
                                'A.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 1,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 3),
                                color: Color(0xffCACBCE),
                              ),
                              Flexible(
                                child: Text(
                                  'Yo‘q Kumushoyning yordami kerak deb oylayman',
                                  style: TextStyle(
                                    color: Color(0xff96979C),
                                    fontSize: 13,
                                  ),
                                  maxLines: 3,
                                  textWidthBasis: TextWidthBasis.longestLine,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Text(
                                'B.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 1,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 3),
                                color: Color(0xffCACBCE),
                              ),
                              Flexible(
                                child: Text(
                                  'Yo‘q Kumushoyning yordami kerak deb oylayman',
                                  style: TextStyle(
                                    color: Color(0xff96979C),
                                    fontSize: 13,
                                  ),
                                  maxLines: 3,
                                  textWidthBasis: TextWidthBasis.longestLine,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Text(
                                'C.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 1,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 3),
                                color: Color(0xffCACBCE),
                              ),
                              Flexible(
                                child: Text(
                                  'Yo‘q Kumushoyning yordami kerak deb oylayman',
                                  style: TextStyle(
                                    color: Color(0xff96979C),
                                    fontSize: 13,
                                  ),
                                  maxLines: 3,
                                  textWidthBasis: TextWidthBasis.longestLine,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            createRoute(
                              TestResultScreen(book: widget.book),
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
                          child: Text(
                            "Javoblarni ko‘rish",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
