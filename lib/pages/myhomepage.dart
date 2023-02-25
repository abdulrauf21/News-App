import 'package:flutter/material.dart';
import 'package:newsapp/controller/news_provider.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:provider/provider.dart';

import 'dart:developer';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    Provider.of<NewsProvider>(context, listen: false)
        .getNewsByCategory("business");
    super.initState();
  }

  String getCategoryByIndex(int index) {
    switch (index) {
      case 0:
        return "business";
      // break;
      case 1:
        return "entertainment";
        break;
      case 2:
        return "general";
        break;
      case 3:
        return "health";
        break;
      case 4:
        return "science";
        break;
      default:
        return "business";
    }
  }

  Widget _buildTabBar(String title) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xff6545DD),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Inventory'),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Business',
                ),
                Tab(
                  text: 'Entertainment',
                ),
                Tab(
                  text: 'General',
                ),
                Tab(
                  text: 'Health',
                ),
                Tab(
                  text: 'Science',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text("This is newsfeed Page"),
              ),
              Center(
                child: Text("This is favourites Page"),
              ),
              Center(
                child: Text("This is Account Page"),
              ),
            ],
          ),
        ),
      );
}
