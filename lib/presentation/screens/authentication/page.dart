import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lakshmi_setu/core/bloc/auth/cubit.dart';
import 'package:lakshmi_setu/core/bloc/auth/states.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:lakshmi_setu/presentation/screens/authentication/widgets/otp_widget.dart';
import 'package:lakshmi_setu/presentation/screens/budgeting/page_budgeting.dart';
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
  void dispose() {
    _numberCont.dispose();
    _otpCont.dispose();
    super.dispose();
  }

  void _onContinue(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    if (isNumberVisible) {
      final phoneNumber = '+91${_numberCont.text.trim()}';
      authCubit.signUp(phoneNumber).then((_) {
        if (authCubit.state.errorMessage == null) {
          setState(() => isNumberVisible = false);
        }
      }).catchError((error) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Some error occurred")),
          );
        }
      });
    } else {
      if (_otpCont.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter the OTP')),
        );
        return;
      }
      authCubit.verifyOTP(_otpCont.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.user != null) {
                context.go(BudgetingScreen.route);
              } else if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage!)),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
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
                    const SizedBox(height: 30),
                    Center(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: isKeyboardVisible ? 100 : 200,
                        height: isKeyboardVisible ? 100 : 200,
                        child: Image.asset('assets/onboarding/lakshmisetu.png'),
                      ),
                    ),
                    const SizedBox(height: 50),
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
                                const SizedBox(height: 15),
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
                                Center(
                                    child: OTPInputTheme(controller: _otpCont)),
                                const SizedBox(height: 15),
                                Text(
                                  'Enter the OTP you have received',
                                  style: context.textTheme.bodySmall,
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(height: 190),
                    if (state.isLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_numberCont.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('Please enter your phone number')),
                              );
                              return;
                            }
                            _onContinue(context);
                          },
                          child: Text('Continue'),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
