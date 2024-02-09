import 'package:alisher_navoi/components/reading.dart';
import 'package:alisher_navoi/layouts/main.dart';
import 'package:alisher_navoi/models/reading.dart';
import 'package:flutter/material.dart';

class ReadingsScreen extends StatelessWidget {
  final List<Reading> readings = [
    Reading(
      image: 'assets/images/doston1.png',
      subTitle: 'Yaxshi kishilarning hayratlanishi',
      title: 'Hayrat ul-abror',
      readPagesNum: 134,
      pagesNum: 456,
      progress: 29.3,
      asset: 'assets/hayrat.epub',
    ),
    Reading(
      image: 'assets/images/doston2.png',
      subTitle: 'Layli va majnun',
      title: 'Yetti sayyora',
      readPagesNum: 64,
      pagesNum: 354,
      progress: 18,
      asset: 'assets/layli.epub',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      label: 'O\'qiyotganlarim',
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        itemCount: readings.length,
        itemBuilder: (context, index) => ReadingComponent(
          readingBook: readings[index],
        ),
      ),
    );
  }
}
