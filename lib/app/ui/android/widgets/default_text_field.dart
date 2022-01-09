import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  final void Function(String) onChanged;
  final String Function(String) validator;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final String initialValue;
  final bool autoFocus;
  final List<TextInputFormatter> inputFormatters;

  const DefaultTextField({
    Key key,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.textCapitalization,
    this.initialValue,
    this.inputFormatters = const [],
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      initialValue: initialValue ?? '',
      keyboardType: keyboardType ?? TextInputType.text,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
        border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
