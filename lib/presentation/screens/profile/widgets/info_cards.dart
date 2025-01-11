import 'package:flutter/material.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';

class InfoCard extends StatelessWidget {
  final List<InfoRowData> personalData;
  final List<InfoRowData> financialData;
  final List<InfoRowData> goalData;

  const InfoCard({
    required this.personalData,
    required this.financialData,
    required this.goalData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<InfoRowData> leftPersonalData =
        personalData.sublist(0, personalData.length ~/ 2);
    List<InfoRowData> rightPersonalData =
        personalData.sublist(personalData.length ~/ 2);

    List<InfoRowData> leftFinancialData =
        financialData.sublist(0, financialData.length ~/ 2);
    List<InfoRowData> rightFinancialData =
        financialData.sublist(financialData.length ~/ 2);

    List<InfoRowData> leftGoalData = goalData.sublist(0, goalData.length ~/ 2);
    List<InfoRowData> rightGoalData = goalData.sublist(goalData.length ~/ 2);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: "Personal Info", onEdit: () {}),
          const SizedBox(height: 8),
          _buildRows(context, leftPersonalData, rightPersonalData),
          const Divider(color: Colors.grey, height: 24),
          _SectionHeader(title: "Financial Info", onEdit: () {}),
          const SizedBox(height: 8),
          _buildRows(context, leftFinancialData, rightFinancialData),
          const Divider(color: Colors.grey, height: 24),
          _SectionHeader(title: "Goals", onEdit: () {}),
          const SizedBox(height: 8),
          _buildRows(context, leftGoalData, rightGoalData),
        ],
      ),
    );
  }

  Widget _buildRows(BuildContext context, List<InfoRowData> leftData,
      List<InfoRowData> rightData) {
    return Column(
      children: List.generate(leftData.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: InfoRow(data: leftData[index]),
              ),
              Flexible(
                flex: 1,
                child: InfoRow(data: rightData[index]),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class InfoRow extends StatelessWidget {
  final InfoRowData data;

  const InfoRow({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(data.icon, size: 24, color: Colors.blue.shade200),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.label,
                style: context.textTheme.bodySmall,
              ),
              Text(
                data.value,
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InfoRowData {
  final IconData icon;
  final String label;
  final String value;

  InfoRowData({
    required this.icon,
    required this.label,
    required this.value,
  });
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onEdit;

  const _SectionHeader({
    required this.title,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.labelSmall!
              .copyWith(color: context.colorScheme.primary),
        ),
        IconButton(
          onPressed: onEdit,
          icon: Icon(
            Icons.edit,
            color: context.colorScheme.primary,
            size: 16,
          ),
        ),
      ],
    );
  }
}
