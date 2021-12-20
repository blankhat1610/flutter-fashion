import 'dart:io';

import 'package:fashion/pages/login/login_page.dart';
import 'package:fashion/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/main/main_page.dart';
import 'pages/main/store/main_provider.dart';
import 'pages/shopping_cart/store/shopping_cart_global_provider.dart';

Future<void> main() async {
  // Determine whether you have logged in
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogin = prefs.getBool('isLogin') ?? false;
  print('Are you logged in---' + isLogin.toString());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
        ChangeNotifierProvider(create: (_) => ShopingCartGlobalProvider()),
      ],
      child: MyApp(
        isLogin: isLogin,
      ),
    ),
  );
  // Transparent status bar
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  final isLogin;
  const MyApp({Key? key, this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: RefreshConfiguration(
        hideFooterWhenNotFull:
            true, // When the Viewport is not full of a screen, disable the pull-up to load more functions
        enableBallisticLoad:
            true, // Load more can be triggered by inertial sliding
        child: MaterialApp(
          title: 'Fashion Store',
          localizationsDelegates: [
            RefreshLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en'),
            const Locale('vi'),
          ],
          localeResolutionCallback:
              (Locale? locale, Iterable<Locale> supportedLocales) {
            return locale;
          },
          theme: ThemeData(
            primarySwatch: Colors.purple,
            primaryColor: AppColors.primaryColor,
            accentColor: AppColors.primaryColorAccent,
          ),
          debugShowCheckedModeBanner: false,
          home: isLogin ? MainPage() : LoginPage(),
        ),
      ),
    );
  }
}
