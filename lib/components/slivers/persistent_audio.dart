import 'package:alisher_navoi/models/audiobook.dart';
import 'package:alisher_navoi/screens/audios/bloc/audio/audio_bloc.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SliverAudioPersistentHeader extends SliverPersistentHeaderDelegate {
  final Duration duration;
  final Duration position;
  final double sliderValue;
  final bool isPlaying;
  final AssetsAudioPlayer assetsAudioPlayer;
  final CarouselController carouselController;
  final Audiobook audiobook;
  final String title;
  SliverAudioPersistentHeader({
    this.carouselController,
    this.duration,
    this.position,
    this.sliderValue,
    this.isPlaying,
    this.assetsAudioPlayer,
    this.audiobook,
    this.title,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    print(shrinkOffset);
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 180,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        AnimatedOpacity(
          opacity: shrinkOffset > 54 ? 1 : shrinkOffset / 230,
          duration: Duration(milliseconds: 200),
          child: Container(
            margin: EdgeInsets.fromLTRB(
              (18 / 230) * shrinkOffset + 2,
              (18 / 230) * shrinkOffset + 2,
              (18 / 230) * shrinkOffset + 2,
              0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).disabledColor,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 230 - (79 / 230) * shrinkOffset,
          ),
        ),
        Positioned(
          left: 32,
          top: 32,
          child: AnimatedOpacity(
            opacity: shrinkOffset < 220 ? 0 : 1,
            duration: Duration(milliseconds: 200),
            child: Container(
              width: 76,
              height: 127,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/book1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                (18 / 230) * shrinkOffset,
                (18 / 230) * shrinkOffset + 2,
                (18 / 230) * shrinkOffset,
                0,
              ),
              height: 230 - (79 / 230) * shrinkOffset,
              width: MediaQuery.of(context).size.width -
                  (112 / 230) * shrinkOffset,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          color: Theme.of(context).textTheme.bodyText1.color,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Xamsa',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xff96979C),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity: shrinkOffset > 54
                            ? 0
                            : ((shrinkOffset - 230) * (-1)) / 230,
                        child: Container(
                          height: shrinkOffset > 229 ? 0 : 40,
                          //color: Colors.red,
                          width: MediaQuery.of(context).size.width,

                          // child:
                          //     Slider(value: sliderValue, onChanged: (double value) {}),
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Color(0xff1D212B),
                              inactiveTrackColor: Color(0xffF6F6F6),
                              trackShape: RectangularSliderTrackShape(),
                              trackHeight: 2.0,
                              thumbColor: Color(0xffFA784A),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0),
                            ),
                            child: Slider(
                              value: sliderValue,
                              onChanged: (double value) {
                                assetsAudioPlayer.seek(
                                  Duration(
                                    milliseconds:
                                        (value * duration.inMilliseconds)
                                            .toInt(),
                                  ),
                                  force: false,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 200),
                        opacity:
                            shrinkOffset > 54 ? 0 : (230 - shrinkOffset) / 230,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                position
                                        ?.toString()
                                        ?.replaceRange(7, null, '') ??
                                    '00:00',
                                style: TextStyle(
                                  color: Color(0xffCACBCE),
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                duration
                                        ?.toString()
                                        ?.replaceRange(7, null, '') ??
                                    '00:00',
                                style: TextStyle(
                                  color: Color(0xffCACBCE),
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10 + shrinkOffset * 0.01,
                    child: Container(
                      width: MediaQuery.of(context).size.width -
                          (112 / 230) * shrinkOffset,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<AudioBloc, AudioState>(
                            buildWhen: (previous, current) =>
                                previous.shouldRepeat != current.shouldRepeat,
                            builder: (context, state) {
                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  context.read<AudioBloc>().add(ToggleRepeat());
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/repeat.svg',
                                  color: state.shouldRepeat
                                      ? Color(0xff1D212B)
                                      : Color(0xffCACBCE),
                                  width: 28 - (8 / 230) * shrinkOffset,
                                  height: 28 - (8 / 230) * shrinkOffset,
                                ),
                              );
                            },
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              if (isPlaying) {
                                assetsAudioPlayer.pause();
                                assetsAudioPlayer
                                    .seek(Duration(milliseconds: 0));
                                carouselController.previousPage();
                                assetsAudioPlayer.play();
                              } else {
                                print('not playing');
                                assetsAudioPlayer
                                    .seek(Duration(milliseconds: 0));
                                carouselController.previousPage();
                              }
                            },
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: SvgPicture.asset(
                                'assets/icons/previous.svg',
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          BlocBuilder<AudioBloc, AudioState>(
                            buildWhen: (previous, current) =>
                                previous.isPlaying != current.isPlaying,
                            builder: (context, state) {
                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  if (state.isPlaying) {
                                    assetsAudioPlayer.pause();
                                  } else {
                                    assetsAudioPlayer.play();
                                  }
                                  context
                                      .read<AudioBloc>()
                                      .add(TogglePlayPause());
                                },
                                child: Container(
                                  width: 64 - (20 / 230) * shrinkOffset,
                                  height: 64 - (20 / 230) * shrinkOffset,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(
                                    left: state.isPlaying ? 0 : 5,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color,
                                  ),
                                  child: SvgPicture.asset(
                                    state.isPlaying
                                        ? 'assets/icons/pause.svg'
                                        : 'assets/icons/play.svg',
                                    width: 21 - (1 / 230) * shrinkOffset,
                                    height: 28 - (8 / 230) * shrinkOffset,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .color,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              );
                            },
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              if (isPlaying) {
                                assetsAudioPlayer.pause();
                                assetsAudioPlayer
                                    .seek(Duration(milliseconds: 0));
                                carouselController.nextPage();
                                assetsAudioPlayer.play();
                              } else {
                                print('not playing');
                                assetsAudioPlayer
                                    .seek(Duration(milliseconds: 0));
                                carouselController.nextPage();
                              }
                            },
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: SvgPicture.asset(
                                'assets/icons/next.svg',
                                color:
                                    Theme.of(context).textTheme.bodyText1.color,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                          BlocBuilder<AudioBloc, AudioState>(
                            buildWhen: (previous, current) =>
                                previous.isBookmarked != current.isBookmarked,
                            builder: (context, state) {
                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  context
                                      .read<AudioBloc>()
                                      .add(ToggleAudioBookMark());
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/bookmark.svg',
                                  color: state.isBookmarked
                                      ? Color(0xff1D212B)
                                      : Color(0xffCACBCE),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => 230;

  @override
  double get minExtent => 230;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
