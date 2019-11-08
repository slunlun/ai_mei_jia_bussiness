import 'package:flutter/material.dart';
import 'package:ai_mei_jia_bussiness/common/section_header.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_mei_jia_bussiness/tool/tool_button.dart';
import 'dart:io';
import 'package:ai_mei_jia_bussiness/common/config.dart';

class ImageView extends StatelessWidget {
  ImageView({Key key, this.image, this.callBack}) : super(key: key);
  final VoidCallback callBack;
  final File image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      fit: StackFit.loose,
      overflow: Overflow.visible,
      children: <Widget>[
        Image.file(
          image,
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        GestureDetector(
          onTap: callBack,
          child: Icon(Icons.remove_circle, color: Colors.red, size: 30.0,),
        ),
      ],
    );
  }
}

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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _buildCommodityImageViewList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var _commodityImgList = List<File>();
  void getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _commodityImgList.add(image);
      });
    }
  }

  void removeImage(File image) {
    setState(() {
      _commodityImgList.remove(image);
    });
  }

  List<Widget> _buildCommodityImageViewList() {
    var commodityImageViewList = List<Widget>();
    commodityImageViewList.add(
      Padding(
        padding: EdgeInsets.only(
            left: Config.GLOBAL_LEFT_RIGHT_MARGIN,
            bottom: Config.GLOBAL_TOP_BOTTOM_MARGIN),
      ),
    );

    for (File image in _commodityImgList) {
      commodityImageViewList.add(
        Container(
          margin: EdgeInsets.all(5.0),
          child: ImageView(image: image,
            callBack: (){
              removeImage(image);
            },
          ),
        ),
      );
    }

    commodityImageViewList.add(
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
    );
    return commodityImageViewList;
  }
}
