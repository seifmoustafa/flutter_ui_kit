import 'package:flutter/material.dart';

/// Dialog shown when the auth token is invalid/expired.
class SessionExpiredDialog extends StatelessWidget {
  const SessionExpiredDialog({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onButtonPressed,
    this.logo,
    this.backgroundColor,
    this.titleStyle,
    this.buttonColor,
    this.buttonTextStyle,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    this.width = 298.0,
    this.elevation = 6.0,
    this.shadowColor = const Color(0x3F000000),
    this.canPop = false,
  });

  /// Title text to display.
  final String title;

  /// Text for the action button.
  final String buttonText;

  /// Callback when the button is pressed.
  final VoidCallback onButtonPressed;

  /// Optional logo widget to display.
  final Widget? logo;

  /// Background color of the dialog.
  final Color? backgroundColor;

  /// Title text style.
  final TextStyle? titleStyle;

  /// Button background color.
  final Color? buttonColor;

  /// Button text style.
  final TextStyle? buttonTextStyle;

  /// Border radius of the dialog.
  final double borderRadius;

  /// Padding around the content.
  final EdgeInsetsGeometry padding;

  /// Width of the dialog.
  final double width;

  /// Elevation of the dialog.
  final double elevation;

  /// Shadow color.
  final Color shadowColor;

  /// Whether the dialog can be popped.
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor =
        backgroundColor ?? theme.scaffoldBackgroundColor;
    final effectiveTitleStyle = titleStyle ??
        const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1D241F),
        );

    return PopScope(
      canPop: canPop,
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          width: width,
          padding: padding,
          decoration: ShapeDecoration(
            color: effectiveBackgroundColor,
            shadows: [
              BoxShadow(color: shadowColor, blurRadius: elevation),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (logo != null) ...[
                logo!,
                const SizedBox(height: 16),
              ],
              Text(
                title,
                textAlign: TextAlign.center,
                style: effectiveTitleStyle,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor ?? theme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: buttonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
