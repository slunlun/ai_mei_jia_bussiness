import 'package:flutter/material.dart';

class ToolButton extends StatelessWidget {
  ToolButton({Key key, this.icon, this.title, this.onPressed, this.iconColor})
      : super(key: key);
  final VoidCallback onPressed;
  final IconData icon;
  final String title;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.only(top: 5, bottom:5, left: 5, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 40.0,
                color: iconColor,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
