import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Small text widget used on auth screens for sign-in/sign-up switching.
class HaveOrNotAccount extends StatelessWidget {
  /// Creates an inline text with a tappable [action] portion.
  const HaveOrNotAccount({
    super.key,
    this.onTap,
    required this.question,
    required this.action,
    this.questionStyle,
    this.actionStyle,
    this.textAlign = TextAlign.center,
    this.spacing = ' ',
  });

  /// Callback triggered when the action text is tapped.
  final void Function()? onTap;

  /// Leading question text, e.g. "Already have an account?".
  final String question;

  /// Action label, e.g. "Sign In".
  final String action;

  /// Style for the question text.
  final TextStyle? questionStyle;

  /// Style for the action text.
  final TextStyle? actionStyle;

  /// Text alignment.
  final TextAlign textAlign;

  /// Spacing between question and action text.
  final String spacing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveQuestionStyle = questionStyle ??
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.grey.shade600,
        );
    final effectiveActionStyle = actionStyle ??
        TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: theme.primaryColor,
        );

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: question,
            style: effectiveQuestionStyle,
          ),
          TextSpan(text: spacing),
          TextSpan(
            recognizer:
                onTap != null ? (TapGestureRecognizer()..onTap = onTap) : null,
            text: action,
            style: effectiveActionStyle,
          ),
        ],
      ),
      textAlign: textAlign,
    );
  }
}
