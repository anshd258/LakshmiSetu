import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:lakshmi_setu/presentation/screens/micro_investments/page_calculator.dart';

class MicroInvestmentsScreen extends StatelessWidget {
  static const route = '/microInvestmentsScreen';
  static const routeName = 'MicroInvestmentsScreen';
  const MicroInvestmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Micro Investments',
          style: context.textTheme.headlineSmall,
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: const [
              InvestmentOption(
                title: 'Recurring Deposits (RDs)',
                subtitle:
                    'Minimum ₹500/month | 3-5% p.a.| Lock-in: 6months-10yrs',
              ),
              InvestmentOption(
                title: 'Systematic Investment Plans (SIPs)',
                subtitle: 'Expected returns: Flexibility, duration',
              ),
              InvestmentOption(
                title: 'Government Schemes',
                subtitle:
                    'PPF(8%), NSC(7%), Kisan VP(7%), Sukanya Samriddhi Yojana (SSY)',
              ),
            ],
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: ElevatedButton(
              onPressed: () {
                context.push(CalculatorScreen.route);
              },
              child: Text(
                'Calculator',
                style: context.textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvestmentOption extends StatelessWidget {
  final String title;
  final String subtitle;

  const InvestmentOption({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: Text(
        title,
        style:
            context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: context.textTheme.bodySmall,
      ),
      trailing: const Icon(
        Icons.chevron_right,
      ),
      onTap: () {},
    );
  }
}
