import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lakshmi_setu/core/theme/theme_extensions.dart';

class PrimaryTextFieldWidget extends StatefulWidget {
  const PrimaryTextFieldWidget({
    super.key,
    this.controller,
    required this.label,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.focusNode,
    this.initialValue,
    this.onChanged,
    this.prefixText,
    this.inputFormatters,
    this.keyboardType,
    this.autofocus = false,
    this.maxlength,
    this.readOnly = false,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? prefixText;
  final FocusNode? focusNode;
  final String label;
  final String? initialValue;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool autofocus;
  final int? maxlength;
  final bool readOnly;
  @override
  State<PrimaryTextFieldWidget> createState() => _PrimaryTextFieldWidgetState();
}

class _PrimaryTextFieldWidgetState extends State<PrimaryTextFieldWidget> {
  late bool isVisible;

  Widget suffixWidget() => InkWell(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      borderRadius: BorderRadius.circular(50.w),
      child: Icon(
        isVisible ? Icons.visibility_off : Icons.visibility,
        color: context.colorScheme.primary,
      ));

  @override
  void initState() {
    isVisible = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black87,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: isVisible,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      style: context.textTheme.bodyMedium,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxlength,
      decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          prefixText:
              widget.prefixText != null ? "${widget.prefixText}  " : null,
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: 10.w,
          ),
          labelText: widget.label,
          labelStyle: context.textTheme.bodyMedium,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(12.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(12.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colorScheme.error,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(12.r),
          ),
          suffixIconColor: context.colorScheme.primary,
          suffixIcon: widget.obscureText ? suffixWidget() : widget.suffixIcon),
    );
  }
}

class PrimaryDropdownFieldWidget<T> extends StatefulWidget {
  const PrimaryDropdownFieldWidget({
    super.key,
    required this.items,
    required this.label,
    this.onChanged,
    this.value,
    this.validator,
    this.hint,
    this.readOnly = false,
  });

  final List<DropdownMenuItem<T>> items;
  final String label;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final T? value;
  final String? hint;
  final bool readOnly;

  @override
  State<PrimaryDropdownFieldWidget<T>> createState() =>
      _PrimaryDropdownFieldWidgetState<T>();
}

class _PrimaryDropdownFieldWidgetState<T>
    extends State<PrimaryDropdownFieldWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: widget.value,
      items: widget.items,
      onChanged: widget.readOnly ? null : widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 10.w,
        ),
        labelText: widget.label,
        labelStyle: context.textTheme.bodyMedium,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(12.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      style: context.textTheme.bodyMedium,
      icon: Icon(
        Icons.arrow_drop_down,
        color: context.colorScheme.primary,
      ),
      dropdownColor: Colors.white,
    );
  }
}