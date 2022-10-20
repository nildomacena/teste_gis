import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:teste_gis/pages/progress/progress_page_arguments.dart';
import 'package:teste_gis/pages/tabs_page/model/goal.dart';
import 'package:teste_gis/styles/style_colors.dart';
import 'package:teste_gis/utils.dart';

class ProgressPage extends StatelessWidget {
  final ProgressPageArguments arguments;
  late GoalInfo goalInfo;
  late int currentIndex;

  ProgressPage(this.arguments, {super.key}) {
    goalInfo = arguments.goalInfo;
    currentIndex = arguments.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    Widget percentageProgress(
        {required String label, required double percentage}) {
      return SizedBox(
        width: 40,
        child: Column(
          children: [
            RotatedBox(
              quarterTurns: 3,
              child: LinearPercentIndicator(
                lineHeight: 5,
                width: 100,
                percent: percentage,
                barRadius: const Radius.circular(10),
                progressColor: Colors.white,
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: StyleColors.bgColor,
        appBar: AppBar(
          backgroundColor: StyleColors.bgColor,
          title: const Text('Progress'),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/tabs', (route) => false,
                    arguments: currentIndex);
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            PopupMenuButton(
                icon: const Icon(Icons.more_horiz),
                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                      value: '',
                      child: Text('Opções'),
                    )
                  ];
                }),
          ],
        ),
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          CircularPercentIndicator(
            radius: 75,
            animation: true,
            animationDuration: 1200,
            lineWidth: 12.0,
            percent: 0.65,
            center: SizedBox(
                width: 60,
                child: Image.asset(Utils.getImagePath(goalInfo.image))),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.white.withOpacity(.2),
            progressColor: StyleColors.activeColor,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            width: MediaQuery.of(context).size.width,
            child: Row(children: [
              Expanded(
                  child: Column(
                children: const [
                  Text(
                    '23',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'LOREM',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                children: const [
                  Text(
                    '45.2%',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'DOLOR SIT',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )),
              Expanded(
                  child: Column(
                children: const [
                  Text(
                    '234',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'AMET',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              )),
            ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'assets/images/graph.png',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.filled(
                    17,
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                percentageProgress(label: 'Mon', percentage: .8),
                percentageProgress(label: 'Tue', percentage: 1),
                percentageProgress(label: 'Wed', percentage: .5),
                percentageProgress(label: 'Thu', percentage: 1),
                percentageProgress(label: 'Fri', percentage: .7),
                percentageProgress(label: 'Sat', percentage: .6),
                percentageProgress(label: 'Sun', percentage: .4),
              ],
            ),
          ),
        ]),
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
                  onTap: (index) => Navigator.of(context)
                      .pushNamedAndRemoveUntil('/tabs', (route) => false,
                          arguments: index),
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
        ));
  }
}
