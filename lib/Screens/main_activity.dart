import 'package:cryto/Screens/Chat/chat_home.dart';
import 'package:cryto/Styles/color.dart';
import 'package:flutter/material.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int pageIndex = 0;

  ///bottom nav items
  // List<Widget> bottomNavItems = [
  //   Image.asset(
  //     "assets/chat.png",
  //     width: 20,
  //     color: null,
  //   ),
  //   const Icon(Icons.group),
  //   const Icon(Icons.settings),
  // ];

  ///bottom nav pages
  List<Widget> bottomNavPages = [
    const ChatPage(),
    const ChatPage(),
    const ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavPages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          currentIndex: pageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/chat.png",
                  width: 20,
                  color: pageIndex == 0 ? black : grey,
                ),
                label: ''),
            const BottomNavigationBarItem(icon: Icon(Icons.group), label: ''),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: ''),
          ]),
    );
  }
}
