
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tetris/gamer/gamer.dart';
import 'package:tetris/generated/i18n.dart';
import 'package:tetris/material/audios.dart';
import 'package:tetris/panel/page_portrait.dart';
import 'dart:ui';
import 'gamer/keyboard.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tetris',
      localizationsDelegates: [S.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
      navigatorObservers: [routeObserver],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColorLight:Color(0xffffffff),
        primaryColorDark:Color(0xff000000),
      ),
      home: Scaffold(
        body: Sound(child: Game(child: KeyboardController(child: _HomePage()))),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

const SCREEN_BORDER_WIDTH = 3.0;

const BACKGROUND_COLOR = Colors.black87;

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //only Android/iOS support land mode
    bool land = MediaQuery.of(context).orientation == Orientation.landscape;
    return land ? PageLand() : PagePortrait();
  }
}
