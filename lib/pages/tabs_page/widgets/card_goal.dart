import 'package:flutter/material.dart';
import 'package:teste_gis/pages/tabs_page/model/goal.dart';

class CardGoal extends StatelessWidget {
  final GoalInfo goalInfo;
  final void Function()? onTap;

  const CardGoal(this.goalInfo, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width * .5,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: goalInfo.color, borderRadius: BorderRadius.circular(20)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onTap,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        child:
                            Image.asset('assets/goals/${goalInfo.image}.png'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: Text(
                          goalInfo.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: Text(
                          goalInfo.frequency,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: goalInfo.moreActions,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
