import 'package:flutter/material.dart';

class help_dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SimpleDialog(
      contentPadding:
          const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 4),
      children: <Widget>[
        SizedBox(width: MediaQuery.of(context).size.width),
        Container(
            padding: const EdgeInsets.all(16), child: Text("Keyboard shortcuts ")),
        _ActionTile(
          text: "WSAD for up,down,left,right",
          onTap: ()  {},
        ),
        _ActionTile(
          text: "R for reset",
          onTap: ()  {},
        ),
        _ActionTile(
          text: "M for mute/unmute",
          onTap: ()  {},
        ),
        _ActionTile(
          text: "X for drop",
          onTap: ()  {},
        ),
        _ActionTile(
          text: "P for play/pause",
          onTap: ()  {},
        ),
      ],
    );
  }
}

class _SingleFieldDialog extends StatelessWidget {
  final String text;

  const _SingleFieldDialog({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        child: TextField(
          maxLines: 5,
          autofocus: true,
          controller: TextEditingController(text: text),
        ),
      ),
    );
  }
}

class _ReceiptDialog extends StatelessWidget {
  final String image;

  const _ReceiptDialog({Key key, this.image}) : super(key: key);

  const _ReceiptDialog.weChat() : this(image: "assets/wechat.png");

  const _ReceiptDialog.aliPay() : this(image: "assets/alipay.jpg");

  static final borderRadius = BorderRadius.circular(5);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: ClipRRect(borderRadius: borderRadius, child: Image.asset(image)),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final VoidCallback onTap;

  final String text;

  const _ActionTile({Key key, @required this.onTap, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        child: Row(
          children: <Widget>[
            SizedBox(width: 16),
            Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}