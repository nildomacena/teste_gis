import 'package:flutter/material.dart';
import 'package:teste_gis/pages/tabs_page/widgets/list_goals.dart';
import 'package:teste_gis/styles/style_colors.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleColors.bgColor,
      appBar: AppBar(
        backgroundColor: StyleColors.bgColor,
        title: const Text('Explore'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/tabs', (route) => false);
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
      body: const ListGoals(currentIndexTab: 1),
    );
  }
}
