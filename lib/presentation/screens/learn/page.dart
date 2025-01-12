import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';

class LearnScreen extends StatefulWidget {
  static const route = '/LearnScreen';
  static const routeName = 'learnScreen';
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  final TextEditingController _cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _cont,
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.verified, color: Colors.green),
                            SizedBox(width: 8),
                            Text(
                              '2 Modules Completed !',
                              style: context.textTheme.labelSmall!.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '40 coins',
                              style: context.textTheme.labelSmall!.copyWith(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.monetization_on,
                              color: context.colorScheme.tertiary,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: List.generate(
                        7,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: index < 2 ? Colors.green : Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              ['M', 'T', 'W', 'T', 'F', 'S', 'S'][index],
                              style: context.textTheme.bodySmall!.copyWith(
                                color: index < 2 ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Continue Learning',
                style: context.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CoinChip(
                        coin: 10,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'INVESTMENT',
                        style: context.textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Grow your wealth steadily',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tailored for you',
                style: context.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CourseTile(
                    title: 'Banking',
                    subtitle: 'Master basic banking tools',
                    coins: 20,
                  ),
                  CourseTile(
                    title: 'Micro Investments',
                    subtitle: 'Small steps, big returns',
                    isSelected: true,
                    coins: 30,
                  ),
                  CourseTile(
                    title: 'Managing Budget',
                    subtitle: 'Plan and save wisely',
                    coins: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CoinChip extends StatelessWidget {
  final int coin;
  const CoinChip({
    required this.coin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: context.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            size: 14,
            color: Colors.white,
          ),
          Text(
            ' $coin coins',
            style: context.textTheme.bodySmall!.copyWith(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final int coins;
  final bool isSelected;

  const CourseTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.coins,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/learningContentScreen?topic=$title');
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoinChip(coin: coins),
                SizedBox(height: 8),
                Text(
                  title,
                  style: context.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  subtitle,
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
            if (isSelected) Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
