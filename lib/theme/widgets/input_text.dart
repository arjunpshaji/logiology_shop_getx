import 'package:flutter/material.dart';
import 'package:logiology/theme/app_theme.dart';

class InputText extends StatelessWidget {
  final void Function(String) onChanged;
  final String labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  const InputText({
    super.key,
    required this.onChanged,
    required this.labelText,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.textStyle,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: textStyle ?? TextStyle(color: appColor(context).primaryText, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
      decoration: InputDecoration(
        labelText: labelText,
        focusColor: appColor(context).primary,
        labelStyle: labelStyle ?? TextStyle(color: appColor(context).primaryText),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
