import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';
import 'section_card.dart';

/// Thin progress track (Figma: "Progress track").
class AppProgressBar extends StatelessWidget {
  const AppProgressBar({super.key, required this.value});

  /// 0..1
  final double value;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final palette = ToneScope.paletteOf(context);
    final clamped = value.clamp(0.0, 1.0);

    return Semantics(
      value: '${(clamped * 100).round()}%',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(tokens.radii.track),
        child: LinearProgressIndicator(
          value: clamped,
          minHeight: 6,
          backgroundColor: tokens.colors.border,
          valueColor: AlwaysStoppedAnimation<Color>(palette.accent),
        ),
      ),
    );
  }
}
