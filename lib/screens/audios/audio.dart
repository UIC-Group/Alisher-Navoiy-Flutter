import 'package:alisher_navoi/components/slivers/persistent_audio.dart';
import 'package:alisher_navoi/layouts/book.dart';
import 'package:alisher_navoi/models/audiobook.dart';
import 'package:alisher_navoi/models/book.dart';
import 'package:alisher_navoi/screens/audios/bloc/audio/audio_bloc.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AudiosScreen extends StatefulWidget {
  final Audiobook audiobook;
  const AudiosScreen({Key key, this.audiobook}) : super(key: key);

  @override
  _AudiosScreenState createState() => _AudiosScreenState();
}

class _AudiosScreenState extends State<AudiosScreen> {
  Book book = const Book(
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
  );
  CarouselController _carouselController;
  AssetsAudioPlayer assetsAudioPlayer;
  ScrollController _scrollController;
  Duration duration;
  Duration position;
  double sliderValue = 0;
  bool isPlaying = true;
  int index = 0;
  final List<String> carouselImages = const [
    'assets/images/doston4.png',
    'assets/images/doston1.png',
    'assets/images/doston3.png',
    'assets/images/doston2.png',
    'assets/images/doston5.png',
  ];

  final List<String> titles = const [
    'Farhod va Shirin',
    'Hayrat ul-abror',
    'Layli va Majnun',
    "Sab'ai Sayyor",
    "Saddi Iskandariy",
  ];

  @override
  void initState() {
    _carouselController = CarouselController();

    assetsAudioPlayer = AssetsAudioPlayer.newPlayer();

    assetsAudioPlayer.open(
      Audio(widget.audiobook.assets),
      showNotification: false,
    );
    assetsAudioPlayer.current.listen((event) {
      print(event);
    });
    assetsAudioPlayer.currentPosition.listen((Duration p) {
      setState(() {
        position = p;
        sliderValue = position.inMilliseconds / duration.inMilliseconds;
      });
    });

    assetsAudioPlayer.isPlaying.listen((bool v) {
      setState(() {
        isPlaying = v;
      });
    });

    assetsAudioPlayer.current.listen((d) {
      setState(() {
        duration = d.audio.duration;
      });
    });
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioBloc(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  blurRadius: 25,
                  //spreadRadius: 4,
                ),
              ],
            ),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 40,
                        child: SvgPicture.asset('assets/icons/back_arrow.svg'),
                      ),
                    ),
                    Text(
                      'Xamsa',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1.color,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: 40,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Scrollbar(
            thickness: 2,
            isAlwaysShown: true,
            controller: _scrollController,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      Column(
                        children: [
                          CarouselSlider(
                            carouselController: _carouselController,
                            options: CarouselOptions(
                                //height: 297.0,
                                viewportFraction: 0.52,
                                enlargeCenterPage: true,
                                aspectRatio: 297 / 235,
                                onPageChanged: (int page, _) {
                                  setState(() {
                                    index = page;
                                  });
                                }),
                            items: carouselImages.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        i,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: SliverAudioPersistentHeader(
                    title: titles[index],
                    audiobook: widget.audiobook,
                    duration: duration,
                    position: position,
                    carouselController: _carouselController,
                    sliderValue: sliderValue,
                    isPlaying: isPlaying,
                    assetsAudioPlayer: assetsAudioPlayer,
                  ),
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kitob haqida',
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              book.firstContent,
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: double.infinity,
                                child: Image.asset(
                                  book.imageContent,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              book.secondContent,
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Text(
                              'Kitob haqida',
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              book.firstContent,
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: double.infinity,
                                child: Image.asset(
                                  book.imageContent,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              book.secondContent,
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
