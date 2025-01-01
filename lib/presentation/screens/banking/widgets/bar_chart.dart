import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(3, (index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                    width: 30,
                    height: 60 + (index * 10).toDouble(),
                    color: index == 0
                        ? Color(0xFFABD9CE)
                        : index == 1
                            ? Color(0xFFF8C882)
                            : Color(0xFFEABBB5)),
              ),
              const SizedBox(height: 4),
              Text(
                'Bank ${index + 1}',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          );
        }),
      ),
    );
  }
}
