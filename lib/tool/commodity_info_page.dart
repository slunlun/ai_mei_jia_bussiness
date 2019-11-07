import 'package:flutter/material.dart';
import 'package:ai_mei_jia_bussiness/common/section_header.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_mei_jia_bussiness/tool/tool_button.dart';
import 'dart:async';
import 'dart:io';

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
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TextField(
                maxLength: 30,
                maxLines: 5,
                decoration: InputDecoration(
                    hintText: '例如，XX地板J100',
                    contentPadding: EdgeInsets.all(10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )),
              ),
            ),
            ToolButton(
              title: "图片",
              icon: Icons.photo_camera,
              onPressed: getImage,
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
