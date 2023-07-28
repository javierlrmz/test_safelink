import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final int? maxLength;
  final bool? obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint,
    this.errorMessage,
    this.maxLength = 30,
    this.obscureText,
    this.onChanged,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none
    );

    return TextFormField(
      maxLength: maxLength,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide.none,
        ),
        errorBorder: border.copyWith(
          borderSide: const BorderSide(color: Color.fromARGB(255, 255, 116, 116)),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: const BorderSide(color: Color.fromARGB(255, 255, 116, 116)),
        ),

        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMessage,
        errorStyle: const TextStyle(color: Color.fromARGB(255, 255, 172, 172), fontWeight: FontWeight.bold),
        focusColor: colors.primary,
        // icon: Icon( Icons.supervised_user_circle_outlined, color: colors.primary, )
      ),
    );
  }
}
