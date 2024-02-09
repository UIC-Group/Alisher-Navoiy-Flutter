import 'dart:convert';

import 'package:alisher_navoi/models/book.dart';
import 'package:alisher_navoi/models/sequel.dart';
import 'package:alisher_navoi/router.dart';
import 'package:alisher_navoi/screens/main/detailed_book.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SequelComponent extends StatelessWidget {
  final Sequel sequel;

  SequelComponent({this.sequel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).push(
          createRoute(
            DetailedBookScreen(
              asset: sequel.asset,
              book: Book(
                image: 'assets/images/book3.png',
                title: sequel.title,
                pageNum: 45,
                year: 1484,
                firstContent:
                    'Alisher Navoiy ijodining yuksak choʻqqisi „Xamsa“ asari (1483-85)dir, shoir birinchilardan boʻlib, turkiy tilda toʻliq „Xamsa“ yaratdi va turkiy tilda shunday koʻlamdor asar yozish mumkinligini isbotlab berdi. Ushbu toʻplamni Nizomiy Ganjaviyning „Panj Ganj“ („Besh xazina“) asariga havas sifatida yozilganligini oʻquvchilarga anglatmoq maqsadida „Xamsa“ning kirish qismida:\n„Emas oson bu maydon ichra turmoq,\nNizomiy panjasigʻa panja urmoq.“deya taʼkid etadi.\n„Xamsa“ tarkibiga „Hayrat ul-abror“, „Farhod va Shirin“, „Layli va Majnun“, „Sabʼai sayyor“, „Saddi Iskandariy“ kabi dostonlar kiradi.\n"Hayratul-abror"da hamd, munojot, naʼt, hayrat boblaridan keyin shoirning Yaratganga, borliqqa, tabiatga, insonga boʻlgan falsafiy, ijtimoiy-siyosiy, iqtisodiy, ilmiy, maʼrifiy, axloqiy va estetik munosabati aks ettirilgan. Podshoh bilan ulusning insonlik nuqtai nazaridan ayirmasiz, farqsizligini, podshohning hunar, axloq, adl, insof, mantiq, taqvo yoʻlida ulusdan oʻta olmaganini anglatish bilan oʻzining adolatli shoh haqidagi qarashlarini anglatadi.\n„Farhod va Shirin“da qahramonlar sevgi sarguzashtlari orqali insonning tarix va kelajak oldidagi vazifasini belgilaydi, insonlik faqat muhabbatda emas, balki oʻsha sharafli nomning himoyasi orqali ekanini uqdiradi. Sharq tarixidagi Xusrav va Shirin voqeasini badiiy jihatdan qayta ishlab, Farhod orqali oʻzining komil inson haqidagi qarashlarini ifoda qilgan. Navoiy dostoni orqali Firdavsiy, Nizomiy, Dehlaviy anʼanalari yangilangan boʻlsa, undan keyin bu syujet turk mumtoz adabiyotining oʻzak muammolarini hal etishda asosiy oʻrin tutdi va bu yoʻnalishda Ahmad rizvon, Jaliliy, Harimiy, Bafqiy, Urfi Sheroziy, Lamiiy, Nizoriy v.b. dostonlari yaratildi.\n„Layli va Majnun“ dostonida arab ertaklari orqali maʼlum syujet oʻzining tugal shaklini topdi, unda ishq falsafasi betakror uslubda ifoda qilindi. Keyinroq yaratilajak Fuzuliy, Andalib, Sayqaliy dostonlari uchun maʼnaviy zamin boʻldi. „Xamsa“ tarkibidagi „Sabʼai sayyor“ va „Saddi Iskandariy“da shohlik bilan bogʻliq masalalarni birinchi oʻringa olib chiqdi. Bu dostonlar xamsanavislik anʼanasida oʻzining ijtimoiy-siyosiy xarakteri va originalligi bilan ajralib turadi. „Xamsa“ga ustoz Abdurahmon Jomiy (1414—1492) yuqori baho berdi.',
                secondContent:
                    'Nashri:  Xamsa (Nashrga tayyorl. R.Shamsiev). -T.: 1960;',
                imageContent: 'assets/images/book_content.png',
                lang: 'O‘zbek',
                chapterNum: 8,
              ),
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 32),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 84,
                  height: 128,
                  child: Image.asset(
                    sequel.image,
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
                      sequel.title,
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
                      sequel.subTitle,
                      style: TextStyle(
                        color: Color(0xff96979C),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/book.svg',
                              color:
                                  Theme.of(context).textTheme.bodyText2.color,
                            ),
                            Text(
                              ' ${sequel.chapterNum} bob',
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText2.color,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/headphones.svg',
                              color:
                                  Theme.of(context).textTheme.bodyText2.color,
                            ),
                            Text(
                              ' Audio',
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText2.color,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/download.svg',
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .color),
                            Text(
                              ' ${sequel.mb} MB',
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText2.color,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xff25502F),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Dostonlar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
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
