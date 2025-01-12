import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/presentation/screens/community/community_page.dart';
import 'package:lakshmi_setu/presentation/screens/learn/page.dart';
import 'package:lakshmi_setu/presentation/screens/banking/page.dart';
import 'package:lakshmi_setu/presentation/screens/budgeting/page_budgeting.dart';
import 'package:lakshmi_setu/presentation/screens/home/widgets/chatbot_dialog.dart';
import 'package:lakshmi_setu/presentation/screens/home/widgets/home_card.dart';
import 'package:lakshmi_setu/presentation/screens/micro_investments/page.dart';
import 'package:lakshmi_setu/presentation/screens/profile/page.dart';

class HomePage extends StatelessWidget {
  static const route = '/homepage';
  static const routeName = 'HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LakshmiSetu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          children: [
            HomeCard(
              path: 'assets/home/learn.png',
              title: "Learn",
              subtitle: "Explore recommended courses",
              color: Color(0xFFF8C882),
              onTap: () {
                context.push(LearnScreen.route);
              },
            ),
            HomeCard(
              path: 'assets/home/budgeting.png',
              title: "Budgeting",
              subtitle: "Budget tailored for you",
              color: Color(0xFFAAD9CD),
              onTap: () {
                context.push(BudgetingScreen.route);
              },
            ),
            HomeCard(
              path: 'assets/home/banking.png',
              title: "Banking Options",
              subtitle: "Personalized suggestions crafted just for you",
              color: Color(0xFFE9BBB5),
              onTap: () {
                context.push(BankingOptionsScreen.route);
              },
            ),
            HomeCard(
              path: 'assets/home/investment.png',
              title: "Micro Investments",
              subtitle: "Discover tailored opportunities to grow your wealth",
              color: Color(0xFFE8D595),
              onTap: () {
                context.push(MicroInvestmentsScreen.route);
              },
            ),
            HomeCard(
              path: 'assets/home/community.png',
              title: "Community",
              subtitle: "Build Connections, Share Knowledge, and Grow Together",
              color: Color(0xFFF8C882),
              onTap: () {
                context.push(AnimatedDiscordPage.route);
              },
            ),
            HomeCard(
              path: 'assets/home/profile.png',
              title: "Profile",
              subtitle: "Personal and financial profile and goals",
              color: Color(0xFFAAD9CD),
              onTap: () {
                context.push(ProfileScreen.route);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Color(0xFF8DA47E),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ChatbotDialog();
            },
          );
        },
        child: Icon(
          Icons.support_agent,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
