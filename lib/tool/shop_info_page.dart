import 'package:flutter/material.dart';
import 'package:ai_mei_jia_bussiness/common/info_textField.dart';
import 'package:ai_mei_jia_bussiness/common/title_checkbox.dart';
import 'package:ai_mei_jia_bussiness/common/section_header.dart';

class ShopInfoPage extends StatefulWidget {
  @override
  _ShopInfoPageState createState() => _ShopInfoPageState();
}

class _ShopInfoPageState extends State<ShopInfoPage> {
  TextEditingController _shopNameController;
  TextEditingController _shopAddressController;

  TimeOfDay _beginWorkTime;
  TimeOfDay _endWorkTime;

  bool _freeCheLiang = true;
  bool _freeDesign = true;
  bool _freeSongHuo = true;
  bool _freeAnZhuang = true;
  bool _freegift = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text(
          '店面信息',
          style: new TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),

      body: GestureDetector(
        onTap:(){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            InfoTextField(
              infoTitle: "店面名称",
              infoPlaceHolder: "",
              textEditingController: _shopNameController,
            ),
            InfoTextField(
              infoTitle: "店面地址",
              infoPlaceHolder: "",
              maxLength: 20,
              textEditingController: _shopAddressController,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: _buildWorkTimeCell(context),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            SectionHeader(
              title: "店面标签",
              backgroundColor: Colors.black12,
            ),
            _buildShopTaps(),
            SectionHeader(
              title: "店面通知",
              backgroundColor: Colors.black12,
            ),
            TextField(
              maxLength: 200,
              maxLines: 5,
            ),
            Container(
              height: 60,
              padding: EdgeInsets.only(left: 50, right: 50, top: 10),
              child:  MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                  '保  存',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                onPressed: () {

                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildWorkTimeCell(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 5),
        ),
        Text(
          "营业时间",
          style: TextStyle(fontSize: 16.0),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15),
        ),
        GestureDetector(
          onTap: () async {
            TimeOfDay initTime = TimeOfDay.now();
            _beginWorkTime =
                await showTimePicker(context: context, initialTime: initTime);
            print(_beginWorkTime.toString());
          },
          child: Text(
            "09:00 AM",
            style: TextStyle(
              fontSize: 15,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            "至",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            TimeOfDay initTime = TimeOfDay.now();
            _endWorkTime =
                await showTimePicker(context: context, initialTime: initTime);
            print(_endWorkTime.toString());
          },
          child: Text(
            "18:00 PM",
            style: TextStyle(
              fontSize: 15,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShopTaps() {
    return Container(
      child: Wrap(
        spacing: 1,
        runSpacing: 1,
        children: <Widget>[
          TitleCheckBox(
            title: "免费测量",
            checkBoxValue: _freeCheLiang,
            callBack: (bool value) {
              setState(() {
                _freeCheLiang = !_freeCheLiang;
              });
            },
          ),
          TitleCheckBox(
            title: "免费设计",
            checkBoxValue: _freeDesign,
            callBack: (bool value) {
              setState(() {
                _freeDesign = !_freeDesign;
              });
            },
          ),
          TitleCheckBox(
            title: "免费送货",
            checkBoxValue: _freeSongHuo,
            callBack: (bool value) {
              setState(() {
                _freeSongHuo = !_freeSongHuo;
              });
            },
          ),
          TitleCheckBox(
            title: "免费安装",
            checkBoxValue: _freeAnZhuang,
            callBack: (bool value) {
              setState(() {
                _freeAnZhuang = !_freeAnZhuang;
              });
            },
          ),
          TitleCheckBox(
            title: "进店有礼",
            checkBoxValue: _freegift,
            callBack: (bool value) {
              setState(() {
                _freegift = !_freegift;
              });
            },
          ),
        ],
      ),
    );
  }
}
