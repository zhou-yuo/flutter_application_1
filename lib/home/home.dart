import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'dynamic.dart';
import 'dynamic_mock_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, Object>> _listItems = [];

  int _currentPage = 1;
  static const int pageSize = 20;

  @override
  void initState() {
    initList();
  }

  void initList() async {
    _currentPage = 1;
    _requestNewItems();
  }

  void _load() async {
    print('home load');
    _currentPage += 1;
    _requestNewItems();
  }

  void _requestNewItems() async {
    List<Map<String, Object>> newItems =
        HomeDynamicMockData.list(_currentPage, pageSize);
    setState(() {
      if (_currentPage > 1) {
        _listItems += newItems;
      } else {
        _listItems = newItems;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
        onRefresh: () async {
          initList();
        },
        onLoad: () async {
          _load();
        },
        child: ListView.builder(
          itemCount: _listItems.length,
          itemBuilder: (context, index) {
            return HomeDynamicWidget(
              _listItems[index]['title'] as String,
              _listItems[index]['imageUrl'] as String,
              _listItems[index]['viewCount'] as int,
            );
          },
        ),
      ),
    );
  }
}
