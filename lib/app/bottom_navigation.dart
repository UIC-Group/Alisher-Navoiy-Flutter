import 'package:alisher_navoi/screens/audiobooks/audiobooks.dart';
import 'package:alisher_navoi/screens/main/main.dart';
import 'package:alisher_navoi/screens/readings/readings.dart';
import 'package:alisher_navoi/screens/settings/settings.dart';
import 'package:flutter/material.dart';

class BottomNavigationModel extends ChangeNotifier {
  BottomNavigationModel._privateConstructor();

  static final BottomNavigationModel _instance =
      BottomNavigationModel._privateConstructor();

  factory BottomNavigationModel() {
    return _instance;
  }

  List<Widget> screens = [
    MainScreen(),
    ReadingsScreen(),
    AudioBooksScreen(), //SourcesScreen(),
    SettingsScreen(),
  ];

  List<Map> labels = [
    {
      'active_icon': 'assets/icons/nav/category.svg',
      'icon': 'assets/icons/nav/category_inactive.svg',
      'icon_light': 'assets/icons/nav/category_inactive_light.svg',
      'active_icon_light': 'assets/icons/nav/category_light.svg',
      'label': 'Asosiy',
    },
    // {
    //   'active_icon': 'assets/icons/nav/document.svg',
    //   'icon': 'assets/icons/nav/document_inactive.svg',
    //   'icon_light' : 'assets/icons/nav/document_inactive_light.svg',
    //   'active_icon_light' : 'assets/icons/nav/document_light.svg',
    //   'label': 'Manbaalar',
    // },
    {
      'active_icon': 'assets/icons/nav/hourglass.svg',
      'icon': 'assets/icons/nav/hourglass_inactive.svg',
      'icon_light': 'assets/icons/nav/hourglass_inactive_light.svg',
      'active_icon_light': 'assets/icons/nav/hourglass_light.svg',
      'label': 'O‘qiyotganlarim',
    },
    {
      'active_icon': 'assets/icons/nav/headphone_active_dark.svg',
      'icon': 'assets/icons/nav/headphone_inactive_dark.svg',
      'icon_light': 'assets/icons/nav/headphone_inactive_light.svg',
      'active_icon_light': 'assets/icons/nav/headphone_active_light.svg',
      'label': 'Audiokitoblar',
    },
    {
      'active_icon': 'assets/icons/nav/settings.svg',
      'icon': 'assets/icons/nav/settings_inactive.svg',
      'icon_light': 'assets/icons/nav/settings_inactive_light.svg',
      'active_icon_light': 'assets/icons/nav/settings_light.svg',
      'label': 'Sozlamalar',
    },
  ];

  int currentIndex = 0;
  int previousIndex;

  void setIndex(int index) {
    if (index < this.screens.length) {
      this.currentIndex = index;
      notifyListeners();
    }
    notifyListeners();
  }

  void setPreviousIndex(int index) {
    this.previousIndex = index;
    notifyListeners();
    notifyListeners();
  }
}
