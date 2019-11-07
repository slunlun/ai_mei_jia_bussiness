import 'package:flutter/material.dart';

class TitleCheckBox extends StatelessWidget{
  TitleCheckBox({this.title, this.checkBoxValue, this.callBack, Key key})
      :super(key:key);
  final String title;
  final bool checkBoxValue;
  final void Function(bool) callBack;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 120.0,
        child: Row(

          children: <Widget>[
            Checkbox(
              value: checkBoxValue,
              activeColor: Colors.red,
              onChanged: (value){
                callBack(value);
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.5, right: 2.5),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      );

  }
}