import 'package:alisher_navoi/router.dart';
import 'package:alisher_navoi/screens/main/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> navigate;
  @override
  void initState() {
    navigate = Future.delayed(Duration(milliseconds: 2500)).then((value) {
      return true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    navigate.then(
      (value) {
        Navigator.of(context).pushAndRemoveUntil(
          createRoute(MainScreen()),
          (_) => false,
        );
      },
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              color: Theme.of(context).canvasColor,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/alisher_navoiy.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 0,
            bottom: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/name.svg',
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '1441 - 1501',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: SvgPicture.asset('assets/icons/logo.svg'),
          ),
        ],
      ),
    );
  }
}
