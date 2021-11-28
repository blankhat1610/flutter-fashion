import 'package:flutter/material.dart';

const URL = "app/conf";

class MainProvider with ChangeNotifier {
  // PageController
  final PageController tabBarPageController = PageController(
    initialPage: 0,
  );

  // tabBar selected index
  int _tabBarSelectedIndex = 0;
  int get getTabBarSelectedIndex => _tabBarSelectedIndex;
  set setTabBarSelectedIndex(int value) {
    tabBarPageController.animateToPage(value,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    _tabBarSelectedIndex = value;
    notifyListeners();
  }

  int _messageCount = 0;

  // Message displayed after processing
  String get getMessageCount =>
      _messageCount < 100 ? _messageCount.toString() : "99+";
  // Is there any news
  bool get isMessageCount => _messageCount > 0;
}
