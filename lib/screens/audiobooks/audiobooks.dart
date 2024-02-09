import 'package:alisher_navoi/components/audiobook.dart';
import 'package:alisher_navoi/layouts/main.dart';
import 'package:alisher_navoi/models/audiobook.dart';
import 'package:flutter/cupertino.dart';

class AudioBooksScreen extends StatelessWidget {
  final List<Audiobook> audiobooks = [
    Audiobook(
      image: 'assets/images/doston1.png',
      title: 'Hayrat ul-abror',
      size: 4,
      chapters: 56,
      assets: 'assets/hayrat.mp3',
    ),
    Audiobook(
      image: 'assets/images/doston2.png',
      title: 'Farhod va Shirin',
      size: 4,
      chapters: 16,
      assets: 'assets/farhod.mp3',
    ),
    Audiobook(
      image: 'assets/images/doston1.png',
      title: 'Saddi Iskandariy',
      size: 4,
      chapters: 56,
      assets: 'assets/saddi.mp3',
    ),
    Audiobook(
      image: 'assets/images/doston2.png',
      title: 'Layli va Majnun',
      size: 4,
      chapters: 16,
      assets: 'assets/layli.mp3',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      label: 'Audiokitoblar',
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 16,
          mainAxisSpacing: 20,
        ),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        itemCount: audiobooks.length,
        itemBuilder: (context, index) => AudiobookComponent(
          audiobook: audiobooks[index],
        ),
      ),
    );
  }
}
