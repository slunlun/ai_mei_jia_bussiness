import 'package:flutter/material.dart';

class InfoTextField extends StatelessWidget {
  InfoTextField(
      {Key key,
      this.infoTitle,
      this.infoPlaceHolder,
      this.textEditingController,
      this.maxLength=10})
      : super(key: key);

  final String infoTitle;
  final String infoPlaceHolder;
  final TextEditingController textEditingController;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 5, right: 2),
        ),
        Text(
          infoTitle,
          style: TextStyle(fontSize: 16.0),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5, right: 10),
        ),
        Expanded(
          child: Container(
            child: TextField(
              maxLength: maxLength,
              maxLines: 1,
              controller: textEditingController,
              decoration: InputDecoration(labelText: infoPlaceHolder),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5, right: 10),
        ),
      ],
    );
  }
}
