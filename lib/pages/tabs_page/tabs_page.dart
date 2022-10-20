import 'package:flutter/material.dart';
import 'package:teste_gis/pages/tabs_page/tabs/explore_tab.dart';
import 'package:teste_gis/pages/tabs_page/tabs/goals_tab.dart';
import 'package:teste_gis/pages/tabs_page/tabs/home_tab.dart';
import 'package:teste_gis/pages/tabs_page/tabs/profile_tab.dart';
import 'package:teste_gis/styles/style_colors.dart';

class TabsPage extends StatefulWidget {
  final int? initialIndex;
  const TabsPage(this.initialIndex, {super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const ExploreTab(),
    const GoalsTab(),
    const ProfileTab(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentIndex == 0) {
          return true;
        }
        setState(() {
          currentIndex = 0;
        });
        return false;
      },
      child: Scaffold(
          body: tabs[currentIndex],
          bottomNavigationBar: Container(
            color: StyleColors.bgColor,
            child: Container(
              decoration: BoxDecoration(
                color: StyleColors.bgColor,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: BottomNavigationBar(
                    elevation: 10,
                    backgroundColor: StyleColors.bgColor,
                    showUnselectedLabels: true,
                    currentIndex: currentIndex,
                    selectedItemColor: StyleColors.activeColor,
                    unselectedItemColor: const Color(0xff324864),
                    onTap: (index) => setState(() {
                          currentIndex = index;
                          print('index: $index');
                        }),
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.explore), label: 'Explore'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.star), label: 'Goals'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: 'Profile'),
                    ]),
              ),
            ),
          )),
    );
  }
}
