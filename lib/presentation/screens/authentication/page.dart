import 'package:flutter/material.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:lakshmi_setu/presentation/screens/authentication/widgets/otp_widget.dart';
import 'package:lakshmi_setu/presentation/screens/widgets/custom_fields.dart';

class AuthenticationScreen extends StatefulWidget {
  static const route = '/authenticationScreen';
  static const routeName = 'AuthenticationScreen';
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isNumberVisible = true;
  final TextEditingController _numberCont = TextEditingController();
  final TextEditingController _otpCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LakshmiSetu',
                style: context.textTheme.headlineLarge!.copyWith(
                  color: context.colorScheme.primary,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Building Bridges, Creating Opportunities',
                style: context.textTheme.bodySmall,
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: isKeyboardVisible ? 100 : 200,
                  height: isKeyboardVisible ? 100 : 200,
                  child: Image.asset(
                    'assets/onboarding/lakshmisetu.png',
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                child: isNumberVisible
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        key: ValueKey('form'),
                        children: [
                          PrimaryTextFieldWidget(
                            label: 'Mobile Number',
                            prefixText: '+91',
                            controller: _numberCont,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Enter the mobile number to get the OTP',
                            style: context.textTheme.bodySmall,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        key: ValueKey('otp'),
                        children: [
                          Center(child: OTPInputTheme(controller: _otpCont)),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Enter the OTP you have received',
                            style: context.textTheme.bodySmall,
                          ),
                        ],
                      ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isNumberVisible = false;
                    });
                  },
                  child: Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
