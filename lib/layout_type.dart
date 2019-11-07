import 'package:flutter/material.dart';

enum LayoutType {
  shop,
  tool,
  mine,
}

String layoutName(LayoutType layoutType) {
  switch(layoutType) {
    case LayoutType.shop:
      return '店铺';
    case LayoutType.tool:
      return '工具';
    case LayoutType.mine:
      return '我的';
    default:
      return '';
  }
}