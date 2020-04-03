import 'package:flutter/material.dart';
import 'package:tetris/generated/i18n.dart';
import 'package:tetris/income/donation_dialog.dart';
import 'package:tetris/help_dialog.dart';
import 'package:tetris/main.dart';
import 'package:tetris/panel/controller.dart';
import 'package:tetris/panel/screen.dart';
import 'dart:ui';
part 'page_land.dart';


class PagePortrait extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenW = size.width * 0.8;

    return SizedBox.expand(
      child: Container(
        color: BACKGROUND_COLOR,
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  FlatButton(
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (context) => help_dialog());


                            },
                             child: Text("HELP"),textColor: Color(0xffffffff),color: Colors.transparent),
                  Spacer(),
                  FlatButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => DonationDialog());

                      },
                      child: Text(S.of(context).reward),textColor: Color(0xffffffff),color: Colors.grey,)
                ],
              ),
              Spacer(),
              _ScreenDecoration(child: Screen(width: screenW)),
              Spacer(flex: 2),
              GameController(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScreenDecoration extends StatelessWidget {
  final Widget child;

  const _ScreenDecoration({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: Colors.grey , width: SCREEN_BORDER_WIDTH),
          left: BorderSide(
              color: Colors.grey, width: SCREEN_BORDER_WIDTH),
          right: BorderSide(
              color: Colors.grey, width: SCREEN_BORDER_WIDTH),
          bottom: BorderSide(
              color: Colors.grey, width: SCREEN_BORDER_WIDTH),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        child: Container(
          padding: const EdgeInsets.all(3),
          color: SCREEN_BACKGROUND,
          child: child,
        ),
      ),
    );
  }
}
