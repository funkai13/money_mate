import 'dart:core';

import 'package:flutter/material.dart';
import 'package:money_mate/mocks/models/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../mocks/data/data.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({super.key});

  List<LineSeries<ChartData, DateTime>> _getLineSeries(List<ChartData> data) {
    final int seriesCount = data.isNotEmpty ? data.first.ys.length : 0;

    List<LineSeries<ChartData, DateTime>> seriesList = [];
    for (int i = 0; i < seriesCount; i++) {
      seriesList.add(
        LineSeries<ChartData, DateTime>(
          name: 'Balance',
          dataSource: data,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.ys[i],
          dataLabelSettings: DataLabelSettings(isVisible: true),
        ),
      );
    }
    return seriesList;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SfCartesianChart(
        primaryXAxis: const DateTimeAxis(),
        title: const ChartTitle(text: 'Balance'),
        legend: const Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: _getLineSeries(
          Data.resultsWithData,
        ),
      ),
    );
  }
}
