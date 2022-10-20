import 'package:flutter/material.dart';
import 'package:teste_gis/pages/tabs_page/widgets/list_goals.dart';
import 'package:teste_gis/styles/style_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleColors.bgColor,
      appBar: AppBar(
        backgroundColor: StyleColors.bgColor,
        title: const Text('Home'),
        centerTitle: true,
        elevation: 0,
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
      body: const ListGoals(currentIndexTab: 0),
    );
  }
}
