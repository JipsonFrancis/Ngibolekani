import 'package:flutter/material.dart';

import '../spec/screen_spec.dart' show BadgeKind;
import '../theme/app_tokens.dart';

export '../spec/screen_spec.dart' show BadgeKind;

/// Pill used for statuses ("Figma: Status badge").
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.text, this.kind = BadgeKind.info});

  final String text;
  final BadgeKind kind;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final c = tokens.colors;

    final (Color background, Color foreground) = switch (kind) {
      BadgeKind.info => (c.primaryTint, c.primary),
      BadgeKind.success => (c.successTint, c.success),
      BadgeKind.warning => (c.warningTint, c.warning),
      BadgeKind.error => (c.dangerTint, c.danger),
      BadgeKind.dark => (c.navy, c.surface),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(tokens.radii.pill),
      ),
      child: Text(
        text,
        style: tokens.type.captionStrong.copyWith(color: foreground),
      ),
    );
  }
}
