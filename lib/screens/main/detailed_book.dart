import 'package:alisher_navoi/layouts/book.dart';
import 'package:alisher_navoi/models/book.dart';
import 'package:flutter/material.dart';

class DetailedBookScreen extends StatelessWidget {
  final Book book;
  final String asset;
  DetailedBookScreen({
    this.asset = 'asset/layli.epub',
    this.book = const Book(
      image: 'assets/images/book3.png',
      title: 'Layli va Majnun',
      pageNum: 45,
      year: 1484,
      firstContent:
          'Alisher Navoiy ijodining yuksak choʻqqisi „Xamsa“ asari (1483-85)dir, shoir birinchilardan boʻlib, turkiy tilda toʻliq „Xamsa“ yaratdi va turkiy tilda shunday koʻlamdor asar yozish mumkinligini isbotlab berdi. Ushbu toʻplamni Nizomiy Ganjaviyning „Panj Ganj“ („Besh xazina“) asariga havas sifatida yozilganligini oʻquvchilarga anglatmoq maqsadida „Xamsa“ning kirish qismida:\n„Emas oson bu maydon ichra turmoq,\nNizomiy panjasigʻa panja urmoq.“deya taʼkid etadi.\n„Xamsa“ tarkibiga „Hayrat ul-abror“, „Farhod va Shirin“, „Layli va Majnun“, „Sabʼai sayyor“, „Saddi Iskandariy“ kabi dostonlar kiradi.\n"Hayratul-abror"da hamd, munojot, naʼt, hayrat boblaridan keyin shoirning Yaratganga, borliqqa, tabiatga, insonga boʻlgan falsafiy, ijtimoiy-siyosiy, iqtisodiy, ilmiy, maʼrifiy, axloqiy va estetik munosabati aks ettirilgan. Podshoh bilan ulusning insonlik nuqtai nazaridan ayirmasiz, farqsizligini, podshohning hunar, axloq, adl, insof, mantiq, taqvo yoʻlida ulusdan oʻta olmaganini anglatish bilan oʻzining adolatli shoh haqidagi qarashlarini anglatadi.\n„Farhod va Shirin“da qahramonlar sevgi sarguzashtlari orqali insonning tarix va kelajak oldidagi vazifasini belgilaydi, insonlik faqat muhabbatda emas, balki oʻsha sharafli nomning himoyasi orqali ekanini uqdiradi. Sharq tarixidagi Xusrav va Shirin voqeasini badiiy jihatdan qayta ishlab, Farhod orqali oʻzining komil inson haqidagi qarashlarini ifoda qilgan. Navoiy dostoni orqali Firdavsiy, Nizomiy, Dehlaviy anʼanalari yangilangan boʻlsa, undan keyin bu syujet turk mumtoz adabiyotining oʻzak muammolarini hal etishda asosiy oʻrin tutdi va bu yoʻnalishda Ahmad rizvon, Jaliliy, Harimiy, Bafqiy, Urfi Sheroziy, Lamiiy, Nizoriy v.b. dostonlari yaratildi.\n„Layli va Majnun“ dostonida arab ertaklari orqali maʼlum syujet oʻzining tugal shaklini topdi, unda ishq falsafasi betakror uslubda ifoda qilindi. Keyinroq yaratilajak Fuzuliy, Andalib, Sayqaliy dostonlari uchun maʼnaviy zamin boʻldi. „Xamsa“ tarkibidagi „Sabʼai sayyor“ va „Saddi Iskandariy“da shohlik bilan bogʻliq masalalarni birinchi oʻringa olib chiqdi. Bu dostonlar xamsanavislik anʼanasida oʻzining ijtimoiy-siyosiy xarakteri va originalligi bilan ajralib turadi. „Xamsa“ga ustoz Abdurahmon Jomiy (1414—1492) yuqori baho berdi.',
      secondContent: 'Nashri:  Xamsa (Nashrga tayyorl. R.Shamsiev). -T.: 1960;',
      imageContent: 'assets/images/book_content.png',
      lang: 'O‘zbek',
      chapterNum: 8,
    ),
  });
  @override
  Widget build(BuildContext context) {
    return BookLayout(
      book: book,
      asset: asset,
    );
  }
}
