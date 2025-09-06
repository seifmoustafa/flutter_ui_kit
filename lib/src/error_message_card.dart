import 'package:flutter/material.dart';

/// A stylized error message card used when a full screen error view isn't appropriate.
class ErrorMessageCard extends StatelessWidget {
  const ErrorMessageCard({
    super.key,
    required this.title,
    required this.message,
    this.details,
    this.onRetry,
    this.retryButtonText = 'Retry',
    this.buttonColor,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.textColor,
    this.titleStyle,
    this.messageStyle,
    this.detailsStyle,
    this.icon = Icons.error,
    this.iconSize = 48.0,
    this.borderRadius = 12.0,
    this.elevation = 6.0,
    this.padding = const EdgeInsets.all(20),
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.showIcon = true,
  });

  /// Short error title.
  final String title;

  /// Main descriptive message.
  final String message;

  /// Optional error details shown below the description.
  final String? details;

  /// Called when the retry button is tapped.
  final VoidCallback? onRetry;

  /// Text for the retry button.
  final String retryButtonText;

  /// Color of the retry button.
  final Color? buttonColor;

  /// Background color of the card.
  final Color? backgroundColor;

  /// Border color of the card.
  final Color? borderColor;

  /// Color of the error icon.
  final Color? iconColor;

  /// Text color.
  final Color? textColor;

  /// Title text style.
  final TextStyle? titleStyle;

  /// Message text style.
  final TextStyle? messageStyle;

  /// Details text style.
  final TextStyle? detailsStyle;

  /// Icon to display.
  final IconData icon;

  /// Size of the icon.
  final double iconSize;

  /// Border radius of the card.
  final double borderRadius;

  /// Elevation of the card.
  final double elevation;

  /// Padding around the content.
  final EdgeInsetsGeometry padding;

  /// Margin around the card.
  final EdgeInsetsGeometry margin;

  /// Whether to show the icon.
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveBackgroundColor = backgroundColor ?? Colors.red.shade50;
    final effectiveBorderColor = borderColor ?? Colors.redAccent;
    final effectiveIconColor = iconColor ?? Colors.redAccent;
    final effectiveTextColor = textColor ?? Colors.black87;

    return Material(
      elevation: elevation,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: effectiveBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: effectiveBorderColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showIcon) ...[
              Icon(icon, color: effectiveIconColor, size: iconSize),
              const SizedBox(height: 12),
            ],
            Text(
              title,
              style: titleStyle ??
                  theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: effectiveTextColor,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: messageStyle ??
                  theme.textTheme.bodyMedium?.copyWith(
                    color: effectiveTextColor,
                  ),
              textAlign: TextAlign.center,
            ),
            if (details != null) ...[
              const SizedBox(height: 8),
              Text(
                details!,
                style: detailsStyle ??
                    theme.textTheme.bodySmall?.copyWith(
                      color: effectiveTextColor,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor ?? theme.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(retryButtonText),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
