import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  SectionHeader(
      {Key key, this.title, this.backgroundColor})
      : super(key: key);

  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(left: 12.0, top: 5.0, right: 5.0, bottom: 5.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
