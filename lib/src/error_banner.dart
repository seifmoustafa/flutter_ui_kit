import 'package:flutter/material.dart';

/// Short red banner used to display non-critical errors inline.
class ErrorBanner extends StatelessWidget {
  /// Creates an error banner with the given message.
  const ErrorBanner({
    super.key,
    required this.message,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.icon = Icons.error,
    this.iconSize = 20.0,
    this.padding = const EdgeInsets.all(12),
    this.margin = const EdgeInsets.only(bottom: 16),
    this.borderRadius = 8.0,
    this.borderColor,
    this.borderWidth = 0.0,
    this.textStyle,
    this.showIcon = true,
  });

  /// Error message shown to the user.
  final String message;

  /// Background color of the banner.
  final Color? backgroundColor;

  /// Text color of the message.
  final Color? textColor;

  /// Color of the error icon.
  final Color? iconColor;

  /// Icon to display.
  final IconData icon;

  /// Size of the icon.
  final double iconSize;

  /// Padding around the content.
  final EdgeInsetsGeometry padding;

  /// Margin around the banner.
  final EdgeInsetsGeometry margin;

  /// Border radius of the banner.
  final double borderRadius;

  /// Border color.
  final Color? borderColor;

  /// Border width.
  final double borderWidth;

  /// Custom text style.
  final TextStyle? textStyle;

  /// Whether to show the icon.
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? Colors.red.shade100;
    final effectiveTextColor = textColor ?? Colors.red;
    final effectiveIconColor = iconColor ?? Colors.red;

    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderWidth > 0
            ? Border.all(
                color: borderColor ?? effectiveTextColor, width: borderWidth)
            : null,
      ),
      child: Row(
        children: [
          if (showIcon) ...[
            Icon(icon, color: effectiveIconColor, size: iconSize),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              message,
              style: textStyle ??
                  TextStyle(
                    color: effectiveTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
