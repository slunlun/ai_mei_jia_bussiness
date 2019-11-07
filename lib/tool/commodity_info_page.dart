import 'package:flutter/material.dart';
import 'package:ai_mei_jia_bussiness/common/section_header.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_mei_jia_bussiness/tool/tool_button.dart';
import 'dart:async';
import 'dart:io';
import 'package:ai_mei_jia_bussiness/common/config.dart';

class CommodityInfoPage extends StatefulWidget {
  @override
  _CommodityInfoPageState createState() => _CommodityInfoPageState();
}

class _CommodityInfoPageState extends State<CommodityInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: new Text(
          '商品信息',
          style: new TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SectionHeader(
              title: '商品名称',
              backgroundColor: Colors.white10,
              titleColor: Colors.black54,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: Config.GLOBAL_LEFT_RIGHT_MARGIN,
                  right: Config.GLOBAL_LEFT_RIGHT_MARGIN,
                  top: Config.GLOBAL_TOP_BOTTOM_MARGIN),
              child: TextField(
                maxLength: 30,
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: '例如，XX地板 型号J100',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black12,
                      ),
                    )),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: Config.GLOBAL_LEFT_RIGHT_MARGIN,
                      bottom: Config.GLOBAL_TOP_BOTTOM_MARGIN),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),

                  ),
                  child: ToolButton(
                    title: "商品图",
                    icon: Icons.photo_camera,
                    iconColor: Colors.black26,
                    onPressed: getImage,
                  ),
                ),
              ],
            ),
            _image == null ? Text("a pic") : Image.file(_image),
          ],
        ),
      ),
    );
  }

  File _image;

  void getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
}
