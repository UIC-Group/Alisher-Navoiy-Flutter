import 'package:alisher_navoi/layouts/main.dart';
import 'package:alisher_navoi/models/lib_models_theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatefulWidget {
  final ThemeNotifier model = ThemeNotifier();

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool switchOn = false;
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      label: 'Sozlamalar',
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Keshlash',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1.color,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CupertinoSwitch(
                    activeColor: Color(0xffFA784A),
                    value: switchOn,
                    onChanged: (v) {
                      setState(() {
                        switchOn = !switchOn;
                      });
                    })
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        // DynamicTheme.of(context)
                        //     .setThemeData(ThemeData.light());
                        widget.model.setThemeMode(ThemeMode.light);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.model.getThemeMode() == ThemeMode.light
                            ? Color(0xffF6F6F6)
                            : Color(0x00F1F1F1),
                        borderRadius: BorderRadius.circular(
                          22,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 22, horizontal: 24),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/light.png'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Och rang',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                width: 1.5,
                                color: widget.model.getThemeMode() ==
                                        ThemeMode.light
                                    ? Color(0x00C4C4C4)
                                    : Color(0xffC4C4C4),
                              ),
                            ),
                            child: widget.model.getThemeMode() ==
                                    ThemeMode.light
                                ? SvgPicture.asset('assets/icons/clicked.svg')
                                : SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        widget.model.setThemeMode(ThemeMode.dark);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          22,
                        ),
                        color: widget.model.getThemeMode() == ThemeMode.dark
                            ? Color(0xff292D36)
                            : Color(0x00435269),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 22, horizontal: 24),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/dark.png'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'To’q rang',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                width: 1.5,
                                color: widget.model.getThemeMode() ==
                                        ThemeMode.dark
                                    ? Color(0x00C4C4C4)
                                    : Color(0xffC4C4C4),
                              ),
                            ),
                            child: widget.model.themeMode == ThemeMode.dark
                                ? SvgPicture.asset('assets/icons/clicked.svg')
                                : SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff364459).withOpacity(0.05),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 50,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
