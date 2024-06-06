import 'package:education/views/account/account.dart';
import 'package:education/views/layout/homepage.dart';
import 'package:education/widgets/fab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int currentBottomBarIndex = 0;
  PageController layoutPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //physics: const NeverScrollableScrollPhysics(),
        controller: layoutPageController,
        onPageChanged: (value) {
          currentBottomBarIndex = value;
          setState(() {});
        },
        children: [
          HomePage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentBottomBarIndex,
        backgroundColor: Colors.grey.shade100,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade400,
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Anasayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Hesabım"),
        ],
        onTap: (value) {
          currentBottomBarIndex = value;
          layoutPageController.animateToPage(value, curve: Curves.linear, duration: Duration(seconds: 1));
          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const LayoutFAB(),
    );
  }
}
