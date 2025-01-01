import 'package:flutter/material.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';
import 'package:pinput/pinput.dart';

class OTPInputTheme extends StatelessWidget {
  final TextEditingController controller;
  final int length;

  const OTPInputTheme({
    super.key,
    required this.controller,
    this.length = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      length: length,
      pinAnimationType: PinAnimationType.fade,
      defaultPinTheme: PinTheme(
        width: 50,
        height: 50,
        textStyle: context.textTheme.bodyMedium,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 50,
        height: 50,
        textStyle: context.textTheme.bodyMedium,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.colorScheme.primary,
            width: 1,
          ),
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 50,
        height: 50,
        textStyle: context.textTheme.bodyMedium,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.colorScheme.primary,
            width: 1,
          ),
        ),
      ),
    );
  }
}
