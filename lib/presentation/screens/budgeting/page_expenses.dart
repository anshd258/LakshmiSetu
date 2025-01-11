import 'package:flutter/material.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';

class AddExpensePage extends StatefulWidget {
  static const route = '/addExpenseScreen';
  static const routeName = 'AddExpenseScreen';
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  int? selectedIndex;
  final TextEditingController _amountCont = TextEditingController();

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.local_grocery_store, 'label': 'Food and Groceries'},
    {'icon': Icons.checkroom, 'label': 'Clothing'},
    {'icon': Icons.home, 'label': 'Housing'},
    {'icon': Icons.receipt, 'label': 'Bills/Rents'},
    {'icon': Icons.school, 'label': 'Education'},
    {'icon': Icons.work, 'label': 'Occupation/Business'},
    {'icon': Icons.medical_services, 'label': 'Medicines & Health'},
    {'icon': Icons.directions_bus, 'label': 'Transportation'},
    {'icon': Icons.event, 'label': 'Social/Cultural Activities'},
    {'icon': Icons.money, 'label': 'Loan & Debt'},
    {'icon': Icons.phone_android, 'label': 'Technology & Communication'},
  ];

  @override
  void dispose() {
    _amountCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense', style: context.textTheme.headlineSmall),
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(Icons.currency_rupee),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.clear),
                )
              ],
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _amountCont,
                decoration: InputDecoration(
                  hintText: 'Enter amount',
                  border: UnderlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 35),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: isSelected
                                ? context.colorScheme.primary
                                : Colors.grey,
                            width: 1,
                          ),
                          bottom: BorderSide(
                            color: isSelected
                                ? context.colorScheme.primary
                                : Colors.grey,
                            width: 1,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: isSelected
                            ? context.colorScheme.primary.withOpacity(0.1)
                            : Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categories[index]['icon'],
                            size: 30,
                            color: isSelected
                                ? context.colorScheme.primary
                                : Colors.black,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categories[index]['label'],
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              color: isSelected
                                  ? context.colorScheme.primary
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedIndex != null) {
                    final selectedCategory =
                        categories[selectedIndex!]['label'];
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selected: $selectedCategory')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select a category')),
                    );
                  }
                },
                child: const Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
