import 'package:flutter/material.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';

class HomeCard extends StatelessWidget {
  final String path;
  final String title;
  final String subtitle;
  final Color color;
  final void Function()? onTap;
  const HomeCard({
    super.key,
    required this.path,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Image.asset(path),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
                Text(
                  subtitle,
                  style: context.textTheme.bodySmall!.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}