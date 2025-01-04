import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:lakshmi_setu/data/models/bank_comparison_model.dart';

class BankComparisonChart extends StatelessWidget {
  final List<BankComparisonModel> banks;

  const BankComparisonChart({super.key, required this.banks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Overall Score Comparison
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 10,
              barTouchData: BarTouchData(enabled: true),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() >= banks.length) return const Text('');
                      return Transform.rotate(
                        angle: -0.5,
                        child: Text(
                          banks[value.toInt()].bankName,
                          style: context.textTheme.bodySmall!
                              .copyWith(fontSize: 10),
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: banks
                  .asMap()
                  .entries
                  .map(
                    (entry) => BarChartGroupData(
                      x: entry.key,
                      barRods: [
                        BarChartRodData(
                          toY: entry.value.overallScore,
                          color: Colors.blue,
                          width: 20,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        SizedBox(height: 40),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Interest rate comparison",
            style: context.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 10),
        // Interest Rate Comparison
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() >= banks.length) return const Text('');
                      return Transform.rotate(
                        angle: -0.5,
                        child: Text(
                          banks[value.toInt()].bankName,
                          style: context.textTheme.bodySmall!
                              .copyWith(fontSize: 10),
                        ),
                      );
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: banks
                      .asMap()
                      .entries
                      .map((entry) => FlSpot(
                            entry.key.toDouble(),
                            entry.value.interestRate * 100,
                          ))
                      .toList(),
                  color: Colors.green,
                  dotData: FlDotData(show: true),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
