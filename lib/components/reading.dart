import 'dart:convert';

import 'package:alisher_navoi/models/reading.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';

class ReadingComponent extends StatelessWidget {
  final Reading readingBook;

  ReadingComponent({this.readingBook});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          readingBook.asset,
          lastLocation: EpubLocator.fromJson({
            "bookId": "2239",
            "href": "/OEBPS/ch06.xhtml",
            "created": 1539934158390,
            "locations": {"cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"}
          }), // first page will open up if the value is null
        );
        EpubViewer.locatorStream.listen((locator) {
          print('LOCATOR: ${EpubLocator.fromJson(jsonDecode(locator))}');
          // convert locator from string to json and save to your database to be retrieved later
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 32),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 84,
                  height: double.infinity,
                  child: Image.asset(
                    readingBook.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      readingBook.title,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      readingBook.subTitle,
                      style: TextStyle(
                        color: Color(0xff96979C),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 1,
                      width: 34,
                      color: Color(0xff292D36),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      '${readingBook.readPagesNum}/${readingBook.pagesNum} bet',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Stack(
                      children: [
                        Positioned(
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: Theme.of(context).disabledColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: (MediaQuery.of(context).size.width - 140) *
                                  readingBook.progress /
                                  100,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Color(0xffFA784A),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
