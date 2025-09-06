import 'package:flutter/material.dart';

/// Wraps any [child] in a rounded box with customizable border colors
/// based on selection state.
class SelectionBox extends StatelessWidget {
  const SelectionBox({
    super.key,
    required this.selected,
    required this.child,
    this.height = 56,
    this.backgroundColor = Colors.white,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.borderRadius = 8.0,
    this.borderWidth = 1.0,
    this.padding,
    this.margin,
    this.onTap,
    this.enabled = true,
  });

  /// Whether the box is selected.
  final bool selected;

  /// Child widget to display inside the box.
  final Widget child;

  /// Height of the selection box.
  final double height;

  /// Background color of the box.
  final Color backgroundColor;

  /// Border color when selected.
  final Color? selectedBorderColor;

  /// Border color when not selected.
  final Color? unselectedBorderColor;

  /// Border radius of the box.
  final double borderRadius;

  /// Border width.
  final double borderWidth;

  /// Padding around the child.
  final EdgeInsetsGeometry? padding;

  /// Margin around the box.
  final EdgeInsetsGeometry? margin;

  /// Callback when the box is tapped.
  final VoidCallback? onTap;

  /// Whether the box is enabled.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final effectiveSelectedColor =
        selectedBorderColor ?? Theme.of(context).primaryColor;
    final effectiveUnselectedColor =
        unselectedBorderColor ?? const Color(0xFFDCDEDE);

    Widget content = Container(
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: selected ? effectiveSelectedColor : effectiveUnselectedColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(child: child),
    );

    if (onTap != null && enabled) {
      content = GestureDetector(
        onTap: onTap,
        child: content,
      );
    }

    return content;
  }
}
