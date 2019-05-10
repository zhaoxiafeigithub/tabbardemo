import 'package:flutter/material.dart';
import 'FirstPage.dart';
import 'SecondPage.dart';
import 'ThirdPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bodyList = [FirstPage(), SecondPage(), ThirdPage()];
  final pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('first')),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('second')),
          BottomNavigationBarItem(icon: Icon(Icons.more), title: Text('third'))
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            pageController.jumpToPage(index);
          });
        },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: bodyList,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
