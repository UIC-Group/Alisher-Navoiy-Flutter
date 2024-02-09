import 'package:alisher_navoi/layouts/test.dart';
import 'package:alisher_navoi/models/audiobook.dart';
import 'package:alisher_navoi/models/book.dart';
import 'package:alisher_navoi/router.dart';
import 'package:alisher_navoi/screens/audios/audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AudiobookComponent extends StatelessWidget {
  final Audiobook audiobook;

  AudiobookComponent({this.audiobook});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).push(
          createRoute(AudiosScreen(
            audiobook: audiobook,
          )),
        );
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: double.infinity,
                        child: Image.asset(
                          audiobook.image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xCFEE3333).withOpacity(0.7),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 3),
                      child: SvgPicture.asset(
                        'assets/icons/audiobook_play.svg',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    audiobook.title,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/headphones.svg',
                        color: Color(0xffCACBCE),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${audiobook.chapters} bob',
                        style: TextStyle(
                          color: Color(0xffCACBCE),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      SvgPicture.asset(
                        'assets/icons/download.svg',
                        color: Color(0xffCACBCE),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${audiobook.size} MB',
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
          )),
    );
  }
}
