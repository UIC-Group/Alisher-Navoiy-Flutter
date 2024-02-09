import 'package:alisher_navoi/constants/routes.dart';
import 'package:alisher_navoi/models/lib_models_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'router.dart' as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final themeNotifier = ThemeNotifier();
  themeNotifier.identifyThemeMode();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent, // Color for Android
        statusBarBrightness:
            Brightness.light // dark == white status bar -- for IOS.
        ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //initializeDateFormatting();
  runApp(
    MyApp(),
  );
}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.light,
      ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final themeNotifier = ThemeNotifier();

    return ChangeNotifierProvider.value(
      value: themeNotifier,
      child: Consumer<ThemeNotifier>(builder: (context, model, child) {
        return MaterialApp(
          navigatorKey: _navigatorKey,
          color: Color(0xff1D212B),
          title: 'Alisher Navoiy',
          debugShowCheckedModeBanner: false,
          initialRoute: splashRoute,
          onGenerateRoute: router.generateRoute,
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          themeMode: model.themeMode,
        );
      }),
    );
  }
}
