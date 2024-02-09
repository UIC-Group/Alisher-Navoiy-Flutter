import 'package:alisher_navoi/components/profile_pinned_header.dart';
import 'package:alisher_navoi/components/profile_scrolling_header.dart';
import 'package:alisher_navoi/components/sequel.dart';
import 'package:alisher_navoi/constants/colors.dart';
import 'package:alisher_navoi/layouts/main.dart';
import 'package:alisher_navoi/models/book.dart';
import 'package:alisher_navoi/models/sequel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  ScrollController _scrollController;
  TabController tabController;
  List<Book> books = [
    Book(
      image: 'assets/images/book1.png',
      title: 'Hayrat ul-abror',
      pageNum: 74,
      year: 1484,
      firstContent:
          'Alisher Navoiy ijodining yuksak choʻqqisi „Xamsa“ asari (1483-85)dir, shoir birinchilardan boʻlib, turkiy tilda toʻliq „Xamsa“ yaratdi va turkiy tilda shunday koʻlamdor asar yozish mumkinligini isbotlab berdi. Ushbu toʻplamni Nizomiy Ganjaviyning „Panj Ganj“ („Besh xazina“) asariga havas sifatida yozilganligini oʻquvchilarga anglatmoq maqsadida „Xamsa“ning kirish qismida:\n„Emas oson bu maydon ichra turmoq,\nNizomiy panjasigʻa panja urmoq.“deya taʼkid etadi.\n„Xamsa“ tarkibiga „Hayrat ul-abror“, „Farhod va Shirin“, „Layli va Majnun“, „Sabʼai sayyor“, „Saddi Iskandariy“ kabi dostonlar kiradi.\n"Hayratul-abror"da hamd, munojot, naʼt, hayrat boblaridan keyin shoirning Yaratganga, borliqqa, tabiatga, insonga boʻlgan falsafiy, ijtimoiy-siyosiy, iqtisodiy, ilmiy, maʼrifiy, axloqiy va estetik munosabati aks ettirilgan. Podshoh bilan ulusning insonlik nuqtai nazaridan ayirmasiz, farqsizligini, podshohning hunar, axloq, adl, insof, mantiq, taqvo yoʻlida ulusdan oʻta olmaganini anglatish bilan oʻzining adolatli shoh haqidagi qarashlarini anglatadi.\n„Farhod va Shirin“da qahramonlar sevgi sarguzashtlari orqali insonning tarix va kelajak oldidagi vazifasini belgilaydi, insonlik faqat muhabbatda emas, balki oʻsha sharafli nomning himoyasi orqali ekanini uqdiradi. Sharq tarixidagi Xusrav va Shirin voqeasini badiiy jihatdan qayta ishlab, Farhod orqali oʻzining komil inson haqidagi qarashlarini ifoda qilgan. Navoiy dostoni orqali Firdavsiy, Nizomiy, Dehlaviy anʼanalari yangilangan boʻlsa, undan keyin bu syujet turk mumtoz adabiyotining oʻzak muammolarini hal etishda asosiy oʻrin tutdi va bu yoʻnalishda Ahmad rizvon, Jaliliy, Harimiy, Bafqiy, Urfi Sheroziy, Lamiiy, Nizoriy v.b. dostonlari yaratildi.\n„Layli va Majnun“ dostonida arab ertaklari orqali maʼlum syujet oʻzining tugal shaklini topdi, unda ishq falsafasi betakror uslubda ifoda qilindi. Keyinroq yaratilajak Fuzuliy, Andalib, Sayqaliy dostonlari uchun maʼnaviy zamin boʻldi. „Xamsa“ tarkibidagi „Sabʼai sayyor“ va „Saddi Iskandariy“da shohlik bilan bogʻliq masalalarni birinchi oʻringa olib chiqdi. Bu dostonlar xamsanavislik anʼanasida oʻzining ijtimoiy-siyosiy xarakteri va originalligi bilan ajralib turadi. „Xamsa“ga ustoz Abdurahmon Jomiy (1414—1492) yuqori baho berdi.',
      secondContent: 'Nashri:  Xamsa (Nashrga tayyorl. R.Shamsiev). -T.: 1960;',
      imageContent: 'assets/images/book_content.png',
      lang: 'O‘zbek',
      chapterNum: 8,
      asset: 'assets/hayrat.epub',
    ),
    Book(
      asset: 'assets/farhod.epub',
      image: 'assets/images/book2.png',
      title: 'Farhod va Shirin',
      pageNum: 21,
      year: 1484,
      sequels: [
        Sequel(
          title: 'Hayrat ul-abror',
          subTitle: 'Yaxshi kishilarning hayratlanishi',
          chapterNum: 56,
          mb: '4',
          image: 'assets/images/doston1.png',
          asset: 'assets/hayrat.epub',
        ),
        Sequel(
          title: 'Sab’ai Sayyor',
          subTitle: 'Yetti sayyora',
          chapterNum: 56,
          mb: '4',
          image: 'assets/images/doston2.png',
          asset: 'assets/sabiy.epub',
        ),
        Sequel(
          title: 'Layli va majnun',
          subTitle: 'Yetti sayyora',
          chapterNum: 56,
          mb: '4',
          image: 'assets/images/doston3.png',
          asset: 'assets/layli.epub',
        ),
        Sequel(
          title: 'Farxod va Shirin',
          subTitle: 'Yetti sayyora',
          chapterNum: 56,
          mb: '4',
          image: 'assets/images/doston4.png',
          asset: 'assets/farhod.epub',
        ),
        Sequel(
          title: 'Saddi Iskandariy',
          subTitle: 'Yetti sayyora',
          chapterNum: 56,
          mb: '4',
          image: 'assets/images/doston5.png',
          asset: 'assets/saddi.epub',
        ),
      ],
      firstContent:
          'Alisher Navoiy ijodining yuksak choʻqqisi „Xamsa“ asari (1483-85)dir, shoir birinchilardan boʻlib, turkiy tilda toʻliq „Xamsa“ yaratdi va turkiy tilda shunday koʻlamdor asar yozish mumkinligini isbotlab berdi. Ushbu toʻplamni Nizomiy Ganjaviyning „Panj Ganj“ („Besh xazina“) asariga havas sifatida yozilganligini oʻquvchilarga anglatmoq maqsadida „Xamsa“ning kirish qismida:\n„Emas oson bu maydon ichra turmoq,\nNizomiy panjasigʻa panja urmoq.“deya taʼkid etadi.\n„Xamsa“ tarkibiga „Hayrat ul-abror“, „Farhod va Shirin“, „Layli va Majnun“, „Sabʼai sayyor“, „Saddi Iskandariy“ kabi dostonlar kiradi.\n"Hayratul-abror"da hamd, munojot, naʼt, hayrat boblaridan keyin shoirning Yaratganga, borliqqa, tabiatga, insonga boʻlgan falsafiy, ijtimoiy-siyosiy, iqtisodiy, ilmiy, maʼrifiy, axloqiy va estetik munosabati aks ettirilgan. Podshoh bilan ulusning insonlik nuqtai nazaridan ayirmasiz, farqsizligini, podshohning hunar, axloq, adl, insof, mantiq, taqvo yoʻlida ulusdan oʻta olmaganini anglatish bilan oʻzining adolatli shoh haqidagi qarashlarini anglatadi.\n„Farhod va Shirin“da qahramonlar sevgi sarguzashtlari orqali insonning tarix va kelajak oldidagi vazifasini belgilaydi, insonlik faqat muhabbatda emas, balki oʻsha sharafli nomning himoyasi orqali ekanini uqdiradi. Sharq tarixidagi Xusrav va Shirin voqeasini badiiy jihatdan qayta ishlab, Farhod orqali oʻzining komil inson haqidagi qarashlarini ifoda qilgan. Navoiy dostoni orqali Firdavsiy, Nizomiy, Dehlaviy anʼanalari yangilangan boʻlsa, undan keyin bu syujet turk mumtoz adabiyotining oʻzak muammolarini hal etishda asosiy oʻrin tutdi va bu yoʻnalishda Ahmad rizvon, Jaliliy, Harimiy, Bafqiy, Urfi Sheroziy, Lamiiy, Nizoriy v.b. dostonlari yaratildi.\n„Layli va Majnun“ dostonida arab ertaklari orqali maʼlum syujet oʻzining tugal shaklini topdi, unda ishq falsafasi betakror uslubda ifoda qilindi. Keyinroq yaratilajak Fuzuliy, Andalib, Sayqaliy dostonlari uchun maʼnaviy zamin boʻldi. „Xamsa“ tarkibidagi „Sabʼai sayyor“ va „Saddi Iskandariy“da shohlik bilan bogʻliq masalalarni birinchi oʻringa olib chiqdi. Bu dostonlar xamsanavislik anʼanasida oʻzining ijtimoiy-siyosiy xarakteri va originalligi bilan ajralib turadi. „Xamsa“ga ustoz Abdurahmon Jomiy (1414—1492) yuqori baho berdi.',
      secondContent: 'Nashri:  Xamsa (Nashrga tayyorl. R.Shamsiev). -T.: 1960;',
      imageContent: 'assets/images/book_content.png',
      lang: 'O‘zbek',
      chapterNum: 8,
    ),
    Book(
      asset: 'assets/layli.epub',
      image: 'assets/images/book3.png',
      title: 'Layli va Majnun',
      pageNum: 45,
      year: 1484,
      firstContent:
          'Alisher Navoiy ijodining yuksak choʻqqisi „Xamsa“ asari (1483-85)dir, shoir birinchilardan boʻlib, turkiy tilda toʻliq „Xamsa“ yaratdi va turkiy tilda shunday koʻlamdor asar yozish mumkinligini isbotlab berdi. Ushbu toʻplamni Nizomiy Ganjaviyning „Panj Ganj“ („Besh xazina“) asariga havas sifatida yozilganligini oʻquvchilarga anglatmoq maqsadida „Xamsa“ning kirish qismida:„Emas oson bu maydon ichra turmoq, Nizomiy panjasigʻa panja urmoq.“deya taʼkid etadi.„Xamsa“ tarkibiga „Hayrat ul-abror“, „Farhod va Shirin“, „Layli va Majnun“, „Sabʼai sayyor“, „Saddi Iskandariy“ kabi dostonlar kiradi. "Hayratul-abror"da hamd, munojot, naʼt, hayrat boblaridan keyin shoirning Yaratganga, borliqqa, tabiatga, insonga boʻlgan falsafiy, ijtimoiy-siyosiy, iqtisodiy, ilmiy, maʼrifiy, axloqiy va estetik munosabati aks ettirilgan. Podshoh bilan ulusning insonlik nuqtai nazaridan ayirmasiz, farqsizligini, podshohning hunar, axloq, adl, insof, mantiq, taqvo yoʻlida ulusdan oʻta olmaganini anglatish bilan oʻzining adolatli shoh haqidagi qarashlarini anglatadi. „Farhod va Shirin“da qahramonlar sevgi sarguzashtlari orqali insonning tarix va kelajak oldidagi vazifasini belgilaydi, insonlik faqat muhabbatda emas, balki oʻsha sharafli nomning himoyasi orqali ekanini uqdiradi. Sharq tarixidagi Xusrav va Shirin voqeasini badiiy jihatdan qayta ishlab, Farhod orqali oʻzining komil inson haqidagi qarashlarini ifoda qilgan. Navoiy dostoni orqali Firdavsiy, Nizomiy, Dehlaviy anʼanalari yangilangan boʻlsa, undan keyin bu syujet turk mumtoz adabiyotining oʻzak muammolarini hal etishda asosiy oʻrin tutdi va bu yoʻnalishda Ahmad rizvon, Jaliliy, Harimiy, Bafqiy, Urfi Sheroziy, Lamiiy, Nizoriy v.b. dostonlari yaratildi. „Layli va Majnun“ dostonida arab ertaklari orqali maʼlum syujet oʻzining tugal shaklini topdi, unda ishq falsafasi betakror uslubda ifoda qilindi. Keyinroq yaratilajak Fuzuliy, Andalib, Sayqaliy dostonlari uchun maʼnaviy zamin boʻldi. „Xamsa“ tarkibidagi „Sabʼai sayyor“ va „Saddi Iskandariy“da shohlik bilan bogʻliq masalalarni birinchi oʻringa olib chiqdi. Bu dostonlar xamsanavislik anʼanasida oʻzining ijtimoiy-siyosiy xarakteri va originalligi bilan ajralib turadi. „Xamsa“ga ustoz Abdurahmon Jomiy (1414—1492) yuqori baho berdi.',
      secondContent: 'Nashri:  Xamsa (Nashrga tayyorl. R.Shamsiev). -T.: 1960;',
      imageContent: 'assets/images/book_content.png',
      lang: 'O‘zbek',
      chapterNum: 8,
    ),
  ];

  List<Sequel> sequels = [
    Sequel(
      title: 'Hayrat ul-abror',
      subTitle: 'Yaxshi kishilarning hayratlanishi',
      chapterNum: 56,
      mb: '4',
      image: 'assets/images/doston1.png',
      asset: 'assets/hayrat.epub',
    ),
    Sequel(
      title: 'Sab’ai Sayyor',
      subTitle: 'Yetti sayyora',
      chapterNum: 56,
      mb: '4',
      image: 'assets/images/doston2.png',
      asset: 'assets/sabiy.epub',
    ),
    Sequel(
      title: 'Layli va majnun',
      subTitle: 'Yetti sayyora',
      chapterNum: 56,
      mb: '4',
      image: 'assets/images/doston3.png',
      asset: 'assets/layli.epub',
    ),
    Sequel(
      title: 'Farxod va Shirin',
      subTitle: 'Yetti sayyora',
      chapterNum: 56,
      mb: '4',
      image: 'assets/images/doston4.png',
      asset: 'assets/farhod.epub',
    ),
    Sequel(
      title: 'Saddi Iskandariy',
      subTitle: 'Yetti sayyora',
      chapterNum: 56,
      mb: '4',
      image: 'assets/images/doston5.png',
      asset: 'assets/saddi.epub',
    ),
  ];

  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      label: 'Xush kelibsiz!',
      child: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              delegate: SliverScrollingHeaderDelegate(books: books),
              pinned: false,
            ),
            SliverPersistentHeader(
              delegate: SliverTabbarDelegate(
                TabBar(
                  onTap: (int pos) async {
                    // print(pos);
                    // print(keys[pos].currentContext);
                    // _scrollToIndex(pos);
                    // Scrollable.ensureVisible(
                    //   keys[pos].currentContext ?? context,
                    // );
                  },
                  isScrollable: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  controller: tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: Theme.of(context).textTheme.bodyText1.color,
                  unselectedLabelColor:
                      Theme.of(context).textTheme.bodyText2.color,
                  labelStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: Color(0xffC0C4CA),
                  ),
                  tabs: [
                    Tab(text: 'Dostonlar'),
                    Tab(text: 'G‘azallar'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListView.builder(
              padding: EdgeInsets.only(top: 24),
              itemCount: sequels.length,
              itemBuilder: (context, index) => SequelComponent(
                sequel: sequels[index],
              ),
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: 24),
              itemCount: sequels.length,
              itemBuilder: (context, index) => SequelComponent(
                sequel: sequels[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
