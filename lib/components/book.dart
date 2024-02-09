import 'package:alisher_navoi/models/book.dart';
import 'package:alisher_navoi/router.dart';
import 'package:alisher_navoi/screens/main/detailed_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookComponent extends StatelessWidget {
  final Book book;

  BookComponent({this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          createRoute(
            DetailedBookScreen(
              book: book,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 190,
                width: 134,
                child: Image.asset(
                  book.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/book.svg',
                    color: Color(0xffCACBCE),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${book.pageNum} bet',
                      style: TextStyle(
                        color: Color(0xffCACBCE),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
