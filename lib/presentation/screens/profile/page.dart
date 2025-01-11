import 'package:flutter/material.dart';
import 'package:lakshmi_setu/presentation/screens/profile/widgets/info_cards.dart';
import 'package:lakshmi_setu/user.dart';

class ProfileScreen extends StatefulWidget {
  static const route = '/profileScreen';
  static const routeName = 'ProfileScreen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InfoCard(
            personalData: [
              InfoRowData(icon: Icons.person, label: "Name", value: user.name),
              InfoRowData(
                  icon: Icons.cake,
                  label: "Date of Birth",
                  value: user.dateOfBirth),
              InfoRowData(
                  icon: Icons.location_on,
                  label: "Location",
                  value: user.location),
              InfoRowData(
                  icon: Icons.house_rounded,
                  label: "Marital Status",
                  value: user.maritalStatus),
              InfoRowData(
                  icon: Icons.phone, label: "Mobile", value: user.mobileNumber),
              InfoRowData(
                  icon: Icons.female, label: "Gender", value: user.gender),
              InfoRowData(
                  icon: Icons.language,
                  label: "Language",
                  value: user.language),
              InfoRowData(
                  icon: Icons.child_friendly_sharp,
                  label: "Children",
                  value: user.children.toString()),
            ],
            financialData: [
              InfoRowData(icon: Icons.work, label: "Job", value: user.job),
              InfoRowData(
                  icon: Icons.money_off,
                  label: "Monthly Expenses",
                  value: user.monthlyExpensesRange.toString()),
              InfoRowData(
                  icon: Icons.savings_rounded,
                  label: "Total Savings",
                  value: user.totalSavingsRange.toString()),
              InfoRowData(
                  icon: Icons.monetization_on,
                  label: "Monthly Salary",
                  value: user.monthlySalaryRange.toString()),
              InfoRowData(
                  icon: Icons.monetization_on,
                  label: "Monthly Savings",
                  value: user.monthlySavingsRange.toString()),
            ],
            goalData: [
              InfoRowData(
                  icon: Icons.attach_money,
                  label: "Monthly Savings Goal",
                  value: user.monthlySavingGoal.toString()),
              InfoRowData(
                  icon: Icons.attach_money,
                  label: "Total Savings Goal",
                  value: user.monthlyExpensesRange.toString()),
              InfoRowData(
                  icon: Icons.grade_outlined,
                  label: "Short Term Goals",
                  value: user.shortTermGoals),
              InfoRowData(
                  icon: Icons.auto_graph_outlined,
                  label: "Long Term Goals",
                  value: user.monthlySalaryRange.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
