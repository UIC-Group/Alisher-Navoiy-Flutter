import 'package:alisher_navoi/models/sequel.dart';

class Book {
  final int id;
  final String title;
  final String image;
  final int pageNum;
  final String lang;
  final int chapterNum;
  final String firstContent;
  final String secondContent;
  final String imageContent;
  final List<Sequel> sequels;
  final int year;
  final String asset;

  const Book({
    this.title,
    this.image,
    this.id,
    this.chapterNum,
    this.firstContent,
    this.imageContent,
    this.lang,
    this.pageNum,
    this.secondContent,
    this.sequels,
    this.year,
    this.asset,
  });
}
