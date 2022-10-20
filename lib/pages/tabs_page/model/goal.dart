import 'package:flutter/material.dart';

class GoalInfo {
  String image;
  String title;
  String frequency;
  Widget moreActions;
  Color color;

  GoalInfo(
      {required this.image,
      required this.moreActions,
      required this.color,
      required this.frequency,
      required this.title});

  static List<GoalInfo> generateGoalsInfo() {
    return [
      GoalInfo(
        image: 'history',
        moreActions: PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.white.withOpacity(.4)),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: '',
                  child: Text('Opções'),
                )
              ];
            }),
        title: 'Be Active',
        frequency: '2 times a day',
        color: const Color(0xffb284fe),
      ),
      GoalInfo(
        image: 'tenis',
        moreActions: PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.white.withOpacity(.4)),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: '',
                  child: Text('Opções'),
                )
              ];
            }),
        title: 'Go for a Walk',
        frequency: '5 times a week',
        color: const Color(0xffff9a96),
      ),
      GoalInfo(
        image: 'glasses',
        moreActions: PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.white.withOpacity(.4)),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: '',
                  child: Text('Opções'),
                )
              ];
            }),
        title: 'Read at night',
        frequency: '3 times a week',
        color: const Color(0xfff1cd40),
      ),
      GoalInfo(
        image: 'dinner',
        moreActions: PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.white.withOpacity(.4)),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: '',
                  child: Text('Opções'),
                )
              ];
            }),
        title: 'Cook Dinner',
        frequency: '1 time a day',
        color: const Color(0xff74ceff),
      ),
      GoalInfo(
        image: 'paper',
        moreActions: PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.white.withOpacity(.4)),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: '',
                  child: Text('Opções'),
                )
              ];
            }),
        title: 'Organize Work',
        frequency: '1 time a day',
        color: const Color(0xff65dc98),
      ),
      GoalInfo(
        image: 'book',
        moreActions: PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.white.withOpacity(.4)),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: '',
                  child: Text('Opções'),
                )
              ];
            }),
        title: 'Practice French',
        frequency: '2 times a week',
        color: const Color(0xff69dccd),
      ),
    ];
  }
}
