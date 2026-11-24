import 'package:flutter/material.dart';

import '../spec/screen_spec.dart' show ButtonKind;
import '../theme/app_tokens.dart';

export '../spec/screen_spec.dart' show ButtonKind;

/// Primary / secondary / tertiary / destructive button
/// (Figma: "DS / Primary button" and siblings, states default, pressed,
/// disabled and loading).
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.kind = ButtonKind.primary,
    this.loading = false,
    this.expand = true,
  });

  final String label;

  /// Null disables the button.
  final VoidCallback? onPressed;
  final ButtonKind kind;

  /// Shows a spinner and ignores taps.
  final bool loading;

  /// Fill the available width (the design default).
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final c = tokens.colors;
    final enabled = onPressed != null && !loading;

    Color background;
    Color foreground;
    BorderSide side = BorderSide.none;

    switch (kind) {
      case ButtonKind.primary:
        background = c.primary;
        foreground = c.surface;
      case ButtonKind.secondary:
        background = c.surface;
        foreground = c.primary;
        side = BorderSide(color: c.primary, width: 1.8);
      case ButtonKind.tertiary:
        background = Colors.transparent;
        foreground = c.primary;
      case ButtonKind.danger:
        background = c.danger;
        foreground = c.surface;
    }

    if (onPressed == null && !loading) {
      background = kind == ButtonKind.tertiary ? Colors.transparent : c.border;
      foreground = c.muted;
      side = BorderSide.none;
    }

    final radius = BorderRadius.circular(tokens.radii.control);

    final Widget content = loading
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: foreground,
            ),
          )
        : Text(
            label,
            textAlign: TextAlign.center,
            style: tokens.type.button.copyWith(color: foreground),
          );

    return SizedBox(
      height: tokens.spacing.controlHeight,
      width: expand ? double.infinity : null,
      child: Material(
        color: background,
        shape: RoundedRectangleBorder(borderRadius: radius, side: side),
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: radius,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(child: content),
          ),
        ),
      ),
    );
  }
}
