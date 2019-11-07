import 'package:flutter/material.dart';
import 'tool/tool_button.dart';
import 'tool/shop_info_page.dart';
import 'shop_page.dart';
import 'tool/commodity_info_page.dart';

class ToolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('工具'),
      ),
      body: ListView(
        children: <Widget>[
          _buildShopSection(context),
          _buildMarketingSection(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      color: Colors.black12,
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

  Widget _buildShopSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSectionHeader("商家"),
        Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Wrap(
            spacing: 20,
            runSpacing: 10,
            children: <Widget>[
              ToolButton(
                title: "店面信息",
                icon: Icons.store,
                iconColor: Colors.red,
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return ShopInfoPage();
                    }),
                  );
                },
              ),
              ToolButton(
                title: "商品管理",
                icon: Icons.gradient,
                iconColor: Colors.red,
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return CommodityInfoPage();
                      }),
                  );
                },
              ),
              ToolButton(
                title: "评论管理",
                icon: Icons.chat,
                iconColor: Colors.red,
                onPressed: (){
                  print("评论管理 click");
                },
              ),
              ToolButton(
                title: "人员管理",
                icon: Icons.people,
                iconColor: Colors.red,
                onPressed: (){
                  print("人员管理 click");
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildMarketingSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSectionHeader("营销"),
        Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Wrap(
            spacing: 20.0,
            runSpacing: 10.0,
            children: <Widget>[
              ToolButton(
                title: "拼单",
                icon: Icons.grain,
                iconColor: Colors.red,
                onPressed: (){
                  print("拼单 click");
                },
              ),
              ToolButton(
                title: "折扣券",
                icon: Icons.monetization_on,
                iconColor: Colors.red,
                onPressed: (){
                  print("折扣券 click");
                },
              ),
              ToolButton(
                title: "优惠券",
                icon: Icons.account_balance_wallet,
                iconColor: Colors.red,
                onPressed: (){
                  print("优惠券 click");
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
