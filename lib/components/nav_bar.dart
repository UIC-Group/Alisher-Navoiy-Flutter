import 'package:alisher_navoi/app/bottom_navigation.dart';
import 'package:alisher_navoi/models/lib_models_theme_data.dart';
import 'package:alisher_navoi/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyNavBarComponent extends StatelessWidget {
  final BottomNavigationModel notifier;
  final ThemeNotifier model = ThemeNotifier();

  MyNavBarComponent({this.notifier});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarTheme.color,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color(0xff242A37).withOpacity(0.05),
          ),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -4),
            blurRadius: 30,
            color: Color.fromARGB(12, 0, 0, 0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: this.notifier.labels.map((el) {
          int i = this.notifier.labels.indexOf(el);
          return _drawNav(
            context: context,
            label: el['label'],
            icon: notifier.currentIndex == i
                ? model.getThemeMode() == ThemeMode.light
                    ? el['active_icon_light']
                    : el['active_icon']
                : model.getThemeMode() == ThemeMode.light
                    ? el['icon_light']
                    : el['icon'],
            isCart: i == 3,
            onTap: () {
              if (notifier.currentIndex != i) {
                // if (i == 3) {
                //   Navigator.push(
                //     context,
                //     createRoute(
                //       ChatScreen(),
                //     ),
                //   );
                // } else {
                notifier.setIndex(i);
                Navigator.pushReplacement(
                  context,
                  createRoute(
                    notifier.screens[i],
                  ),
                );
                // }
              }
            },
            active: notifier.currentIndex == i,
          );
        }).toList(),
      ),
    );
  }
}

Widget _drawNav({
  String icon,
  bool active,
  String label,
  Function() onTap,
  bool helperOn = false,
  bool isCart = false,
  BuildContext context,
}) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        icon,
                        fit: BoxFit.scaleDown,
                        // color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: isCart ? 5.3 : 4,
                ),
                Row(
                  children: [
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            MediaQuery.of(context).size.width < 370 ? 9 : 11,
                        color: active
                            ? Theme.of(context).textTheme.bodyText1.color
                            : Theme.of(context).textTheme.bodyText2.color,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
