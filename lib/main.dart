import 'package:flutter/material.dart';
import 'package:ai_mei_jia_bussiness/common/config.dart';
import 'mine_page.dart';
import 'shop_page.dart';
import 'tool_page.dart';
import 'layout_type.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutType _selectedType = LayoutType.shop;

  Color _colorTapMatching(LayoutType layoutType) {
    return _selectedType == layoutType
        ? Config.GLOBAL_COLOR
        : Colors.grey;
  }

  BottomNavigationBarItem _buildBottomBarItem(
      {IconData icon, LayoutType layoutSelection}) {
    String itemTitle = layoutName(layoutSelection);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTapMatching(layoutSelection),
      ),
      title: Text(
        itemTitle,
        style: TextStyle(
          color: _colorTapMatching(layoutSelection),
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildBottomBarItem(icon: Icons.store, layoutSelection: LayoutType.shop),
        _buildBottomBarItem(icon: Icons.computer, layoutSelection: LayoutType.tool),
        _buildBottomBarItem(icon: Icons.account_circle, layoutSelection: LayoutType.mine),
      ],
      onTap: _onSelectTap,
    );
  }

  void _onSelectTap(int index) {
    switch (index) {
      case 0: {
        _onLayoutSelected(LayoutType.shop);
      }
        break;
      case 1:
        {
          _onLayoutSelected(LayoutType.tool);
        }
        break;
      case 2:
        {
          _onLayoutSelected(LayoutType.mine);
        }
        break;
    }
  }

  Widget _buildBody() {
    switch (_selectedType) {
      case LayoutType.shop:
        {
          return new ShopPage();
        }
        break;
      case LayoutType.tool:
        {
          return new ToolPage();
        }
        break;
      case LayoutType.mine:
        {
          return new MinePage();
        }
        break;
      default:
        break;
    }
  }

  void _onLayoutSelected(LayoutType selectedType) {
    setState(() {
      _selectedType = selectedType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}
