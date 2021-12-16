import 'package:fashion/pages/main/store/main_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyNavigator {
  // Set the context once to facilitate later
  static late BuildContext ctx;

  // push new page
  static Future<T>? push<T extends Object>(Widget page,
      {BuildContext? context}) {
    final _ctx = context ?? ctx;
    FocusScope.of(_ctx).requestFocus(FocusNode());
    Navigator.of(_ctx).push(
      MaterialPageRoute(builder: (_ctx) => page),
    );
  }

  // pop return
  static pop<T extends Object>({BuildContext? context, T? data}) {
    final _ctx = context ?? ctx;
    return Navigator.pop(_ctx, data);
  }

  /// Return to the root page
  static void popToRoot({BuildContext? context}) {
    final _ctx = context ?? ctx;
    Navigator.popUntil(_ctx, (predicate) {
      return predicate.isFirst;
    });
  }

  /// Back to home page
  static void popToHome({BuildContext? context}) {
    final _ctx = context ?? ctx;
    final mainProvder = Provider.of<MainProvider>(_ctx, listen: false);
    mainProvder.setTabBarSelectedIndex = 0;
    Navigator.popUntil(_ctx, (predicate) {
      return predicate.isFirst;
    });
  }

  /// Go back and delete the page
  static void pushAndRemove(Widget page,
      {int removeCount = 1, BuildContext? context}) {
    var index = 0;
    final _ctx = context ?? ctx;
    Navigator.of(_ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) {
        index++;
        return index > removeCount ? true : false;
      },
    );
  }

  // iOS page coming out from the bottom up
  static present(Widget page, {BuildContext? context}) {
    final _ctx = context ?? ctx;
    Navigator.of(_ctx).push(
        MaterialPageRoute(fullscreenDialog: true, builder: (context) => page));
  }
}
