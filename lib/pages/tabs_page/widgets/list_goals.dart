import 'package:flutter/material.dart';
import 'package:teste_gis/pages/progress/progress_page_arguments.dart';
import 'package:teste_gis/pages/tabs_page/model/goal.dart';
import 'package:teste_gis/pages/tabs_page/widgets/card_goal.dart';

class ListGoals extends StatelessWidget {
  final int currentIndexTab;
  const ListGoals({required this.currentIndexTab, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Wrap(
          children: GoalInfo.generateGoalsInfo()
              .map((goal) => CardGoal(
                    goal,
                    onTap: () {
                      Navigator.of(context).pushNamed('/progress',
                          arguments: ProgressPageArguments(
                              goalInfo: goal, currentIndex: currentIndexTab));
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
