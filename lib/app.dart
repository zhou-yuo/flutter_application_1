import 'package:flutter/material.dart';
import 'home/home.dart';
import 'message/message.dart';
import 'category/category.dart';
import 'user/user.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _tabbarIndex = 0;

  List<Widget> _homeWidgets = [
    HomePage(),
    MessagePage(),
    CategoryPage(),
    UserPage(),
  ];

  void _onBottomNavigationBarTapped(int index) {
    print('_AppPageState ~ void_onBottomNavigationBarTapped ~ index: $index');

    setState(() {
      _tabbarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter')),
      body: IndexedStack(
        index: _tabbarIndex,
        children: _homeWidgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabbarIndex,
        onTap: _onBottomNavigationBarTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            // 图标
            icon: Icon(Icons.home),
            // 文字内容
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: '消息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: '分类',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '我的',
          ),
        ],
      ),
    );
  }
}
