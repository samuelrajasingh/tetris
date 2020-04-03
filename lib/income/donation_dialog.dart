import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';

const upi_ID = "rssambbb0123@okaxis";

class DonationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding:
          const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 4),
      children: <Widget>[
        SizedBox(width: MediaQuery.of(context).size.width),
        Container(
            padding: const EdgeInsets.all(16), child: Text("It's not easy to develop, sponsor the developers. show your love")),
        _ActionTile(
          text: "Google pay ",
          onTap: () async {
            await showDialog(
                context: context,
                builder: (context) => _ReceiptDialog.gpay());
            Navigator.pop(context);
          },
        ),
        _ActionTile(
          text: "Paytm donation",
          onTap: () async {
            await showDialog(
                context: context,
                builder: (context) => _ReceiptDialog.paytm
            ());
            Navigator.pop(context);
          },
        ),
        _ActionTile(
          text: "UPI  >>",
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: upi_ID));
            final data = await Clipboard.getData(Clipboard.kTextPlain);
            if (data.text == upi_ID) {
              showSimpleNotification(context, Text("UPI- ID Copied to clipboard)"));
            } else {
              await showDialog(
                  context: context,
                  builder: (context) => _SingleFieldDialog(text: upi_ID));
            }
            Navigator.of(context).pop();
          },
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

  const _ReceiptDialog.gpay() : this(image: "assets/gpay.jpg");

  const _ReceiptDialog.paytm() : this(image: "assets/paytm.jpg");

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
