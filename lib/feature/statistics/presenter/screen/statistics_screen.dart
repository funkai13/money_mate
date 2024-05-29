import 'package:flutter/material.dart';
import 'package:money_mate/feature/statistics/presenter/screen/widgets/statistics_card.dart';

import '../../../../core/mobile_design_system/shared/widgets/navigation_bottom_bar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [];
    for (int i = 0; i < 5; i++) {
      cards.add(
        StatisticsCard(
          title: 'Random title $i',
          value: 'Random value $i',
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Estadisticas',
          style: TextStyle(),
        ),
      ),
      bottomNavigationBar: const NavigationBottomBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: cards,
        ),
      ),
    );
  }
}
