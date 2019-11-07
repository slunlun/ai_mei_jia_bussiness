import 'package:flutter/material.dart';
import 'package:ai_mei_jia_bussiness/common/config.dart';
class SectionHeader extends StatelessWidget {
  SectionHeader(
      {Key key, this.title, this.backgroundColor, this.titleColor})
      : super(key: key);

  final String title;
  final Color backgroundColor;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
            left: Config.GLOBAL_LEFT_RIGHT_MARGIN,
            top:Config.GLOBAL_TOP_BOTTOM_MARGIN,
            bottom: Config.GLOBAL_TOP_BOTTOM_MARGIN/2),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: titleColor, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
