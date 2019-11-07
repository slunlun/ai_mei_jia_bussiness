import 'package:flutter/material.dart';


class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('店铺'),
      ),
      body: ListView(
        children: <Widget>[
          ShopDataMenuItem(
            title: "交易数据",
            subTitle1: "本月成交额",
            subValue1: "￥5123.5",
            subTitle2: "本月成交数",
            subValue2: "123",
            onPressed: () {
              print("1  pressed!!!!!!!");
            },
          ),
          ShopDataMenuItem(
            title: "订单管理",
            subTitle1: "本月下订",
            subValue1: "34",
            subTitle2: "本月成交数",
            subValue2: "14",
            onPressed: () {
              print("2  pressed!!!!!!!");
            },
          ),
        ],
      ),
    );
  }
}

class ShopDataMenuItem extends StatelessWidget {
  ShopDataMenuItem(
      {Key key,
      this.title,
      this.subTitle1,
      this.subValue1,
      this.subTitle2,
      this.subValue2,
      this.onPressed})
      : super(key: key);

  final String title;
  final String subTitle1;
  final String subValue1;
  final String subTitle2;
  final String subValue2;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:
          _buildDateMenuItem(title, subTitle1, subValue1, subTitle2, subValue2),
    );
  }

  Widget _buildDataMenuHeader(String title) {
    return Container(
      color: Colors.black12,
      child: Padding(
        padding:
            EdgeInsets.only(left: 12.0, top: 5.0, right: 5.0, bottom: 5.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                title,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataContentCell(String title, String value) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text(
              value,
              style: TextStyle(
                fontSize: 23,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black26,
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateMenuItem(String title, String subTitle1, String subValue1,
      String subTitle2, String subValue2) {
    return Column(
      children: <Widget>[
        _buildDataMenuHeader(title),
        Row(
          children: <Widget>[
            Expanded(
              child:_buildDataContentCell(subTitle1, subValue1),
            ),
            Container(
              width: 1.0, height: 40.0, color: Colors.black12,
            ),
            Expanded(
              child:_buildDataContentCell(subTitle2, subValue2),
            ),
          ],
        )
      ],
    );
  }
}
