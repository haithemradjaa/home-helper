/// Customizable Button Widget for Home Helper Application
///
/// A versatile and configurable button component that provides
/// consistent styling, interaction feedback, and multiple button types.
///
/// Key Responsibilities:
/// - Create a flexible, reusable button widget
/// - Support multiple button styles and variations
/// - Provide visual and interactive feedback
/// - Maintain design system consistency
///
/// Button Types:
/// - Primary action buttons
/// - Secondary buttons
/// - Outlined buttons
/// - Text buttons
/// - Loading state buttons
///
/// Design Principles:
/// - Material Design 3 guidelines
/// - Responsive touch targets
/// - Adaptive theming
/// - Accessibility considerations
///
/// Interactive States:
/// - Default
/// - Pressed
/// - Disabled
/// - Loading
/// - Error
///
/// Performance Features:
/// - Minimal rebuild overhead
/// - Efficient state management
/// - Smooth animations
///
/// Typical Use Cases:
/// - Form submission buttons
/// - Navigation triggers
/// - Action confirmations
/// - Call-to-action elements
///
/// Example Implementations:
/// ```dart
/// // Primary action button
/// CustomButton(
///   label: 'Submit',
///   onPressed: _handleSubmit,
///   isLoading: _isProcessing,
/// )
///
/// // Secondary button
/// CustomButton(
///   label: 'Cancel',
///   onPressed: _handleCancel,
///   type: CustomButtonType.secondary,
/// )
/// ```
///
/// Future Extensibility:
/// - Custom icon support
/// - Advanced loading indicators
/// - Internationalization
/// - More granular styling options

import 'package:flutter/material.dart';

/// Enum defining the different types of buttons available
enum CustomButtonType {
  /// Primary filled button with background color
  primary,

  /// Secondary outlined button with border
  secondary,

  /// Text-only button without background or border
  text
}

/// A custom button widget that provides consistent styling across the app.
/// Supports primary, secondary, and text button variants.
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = CustomButtonType.primary,
    this.icon,
    this.isLoading = false,
    this.width = double.infinity,
    this.height = 48,
    this.margin = EdgeInsets.zero,
    this.enabled = true,
  });

  /// The text to display on the button
  final String label;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// The type of button to display
  final CustomButtonType type;

  /// Optional icon to display before the label
  final IconData? icon;

  /// Whether to show a loading indicator instead of the label
  final bool isLoading;

  /// The width of the button (defaults to full width)
  final double width;

  /// The height of the button (defaults to 48)
  final double height;

  /// Optional margin around the button
  final EdgeInsets margin;

  /// Whether the button is enabled
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Define the button's child content
    Widget buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20),
          const SizedBox(width: 8),
        ],
        Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
            color: _getTextColor(theme),
          ),
        ),
      ],
    );

    // Show loading indicator if isLoading is true
    if (isLoading) {
      buttonChild = SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            _getLoadingColor(theme),
          ),
        ),
      );
    }

    // Apply margin if specified
    Widget button = SizedBox(
      width: width,
      height: height,
      child: _buildButton(context, buttonChild),
    );

    if (margin != EdgeInsets.zero) {
      button = Padding(padding: margin, child: button);
    }

    return button;
  }

  /// Builds the appropriate button widget based on type
  Widget _buildButton(BuildContext context, Widget child) {
    final theme = Theme.of(context);

    switch (type) {
      case CustomButtonType.primary:
        return ElevatedButton(
          onPressed: enabled && !isLoading ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            disabledBackgroundColor: theme.disabledColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: child,
        );

      case CustomButtonType.secondary:
        return OutlinedButton(
          onPressed: enabled && !isLoading ? onPressed : null,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: enabled
                  ? theme.colorScheme.primary
                  : theme.disabledColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: child,
        );

      case CustomButtonType.text:
        return TextButton(
          onPressed: enabled && !isLoading ? onPressed : null,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: child,
        );
    }
  }

  /// Returns the appropriate text color based on button type and state
  Color _getTextColor(ThemeData theme) {
    if (!enabled) return theme.disabledColor;

    switch (type) {
      case CustomButtonType.primary:
        return theme.colorScheme.onPrimary;
      case CustomButtonType.secondary:
      case CustomButtonType.text:
        return theme.colorScheme.primary;
    }
  }

  /// Returns the appropriate loading indicator color based on button type
  Color _getLoadingColor(ThemeData theme) {
    switch (type) {
      case CustomButtonType.primary:
        return theme.colorScheme.onPrimary;
      case CustomButtonType.secondary:
      case CustomButtonType.text:
        return theme.colorScheme.primary;
    }
  }
}
