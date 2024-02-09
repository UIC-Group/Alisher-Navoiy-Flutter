import 'package:alisher_navoi/components/book.dart';
import 'package:alisher_navoi/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SliverScrollingHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<Book> books;

  SliverScrollingHeaderDelegate({this.books});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/icons/figure.svg',
              color: Theme.of(context).disabledColor,
              // height: MediaQuery.of(context).size.width/1.2,
              // width: MediaQuery.of(context).size.width/1.2,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 40, 20, 32),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).splashColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/text.svg',
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color,
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  'Alisher Navoiy',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '1441 - 1501',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 130,
                          )
                        ],
                      ),
                      Positioned(
                        right: -20,
                        bottom: -16,
                        child: Image.asset('assets/images/navoiy.png'),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Xamsa',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 256,
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(20, 0, 4, 0),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: books.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => BookComponent(
                    book: books[index],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 556;

  @override
  double get minExtent => 556;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
