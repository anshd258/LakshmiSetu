import 'package:flutter/material.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:lakshmi_setu/presentation/screens/widgets/custom_fields.dart';

class CalculatorScreen extends StatefulWidget {
  static const route = '/calculatorScreen';
  static const routeName = 'CalculatorScreen';
  const CalculatorScreen({super.key});

  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _periodController = TextEditingController();
  String _expectedReturns = '₹ 100000';
  int _selectedSchemeIndex = 1;

  @override
  void dispose() {
    _amountController.dispose();
    _periodController.dispose();
    super.dispose();
  }

  void _calculateReturns() {
    setState(() {
      _expectedReturns = '₹ 100000';
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Calculator',
          style: context.textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSchemeButton('RDs', 0, context),
                  const SizedBox(width: 8),
                  _buildSchemeButton('SIPs', 1, context),
                  const SizedBox(width: 8),
                  _buildSchemeButton('Govt Schemes', 2, context),
                ],
              ),
            ),
            const SizedBox(height: 40),
            PrimaryTextFieldWidget(
              controller: _amountController,
              label: 'Investment Amount',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            PrimaryTextFieldWidget(
              controller: _amountController,
              label: 'Investment Period in years',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _calculateReturns,
                child: Text(
                  'Calculate',
                  style: context.textTheme.labelSmall,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Expected Returns',
              style: context.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 40),
            Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xFFA0D4C9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _expectedReturns,
                  style: context.textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSchemeButton(String text, int index, BuildContext context) {
    final isSelected = _selectedSchemeIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSchemeIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? context.colorScheme.primary : Colors.transparent,
          border: Border.all(
            color: isSelected ? context.colorScheme.primary : Colors.black87,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: context.textTheme.labelSmall!.copyWith(
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
