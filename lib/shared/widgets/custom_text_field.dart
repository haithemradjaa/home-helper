import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom text field widget that maintains consistent styling across the app.
/// This widget wraps the Material TextField widget and provides additional
/// functionality and styling.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.autofocus = false,
    this.readOnly = false,
  });

  /// Controls the text being edited.
  final TextEditingController controller;

  /// The label text for the field.
  final String label;

  /// Optional hint text that appears when the field is empty.
  final String? hint;

  /// Optional icon that appears before the input area.
  final IconData? prefixIcon;

  /// Optional icon that appears after the input area.
  final Widget? suffixIcon;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// The type of action button to show on the keyboard.
  final TextInputAction? textInputAction;

  /// Whether to hide the text being edited.
  final bool obscureText;

  /// The maximum number of lines for the text field.
  final int maxLines;

  /// The minimum number of lines for the text field.
  final int? minLines;

  /// The maximum number of characters that can be entered.
  final int? maxLength;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Called when the user indicates that they are done editing the text.
  final ValueChanged<String>? onSubmitted;

  /// Optional validator function that returns an error message string.
  final String? Function(String?)? validator;

  /// Optional input formatters to control the text input.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the text field is enabled.
  final bool enabled;

  /// Whether the text field should be focused when first appearing.
  final bool autofocus;

  /// Whether the text field is read-only.
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: enabled
                        ? Theme.of(context).colorScheme.onBackground
                        : Theme.of(context).disabledColor,
                  ),
            ),
          ),
        ],
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: enabled
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).disabledColor,
                  )
                : null,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: enabled
                ? Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5)
                : Theme.of(context).disabledColor.withOpacity(0.1),
          ),
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          autofocus: autofocus,
          readOnly: readOnly,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: enabled
                    ? Theme.of(context).colorScheme.onBackground
                    : Theme.of(context).disabledColor,
              ),
        ),
      ],
    );
  }
}
