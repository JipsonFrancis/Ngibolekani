import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';
import 'section_card.dart';

/// Label on the left, value on the right, hairline underneath
/// (Figma: "Detail row"). Give it [onTap] to turn it into a link row.
class DetailRow extends StatelessWidget {
  const DetailRow({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
    this.showDivider = true,
  });

  final String label;
  final String value;
  final VoidCallback? onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final palette = ToneScope.paletteOf(context);
    final linked = onTap != null;

    final row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 11,
            child: Text(
              label,
              style: tokens.type.body.copyWith(color: palette.muted),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 9,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: tokens.type.bodyStrong.copyWith(
                color: linked ? palette.accent : palette.text,
              ),
            ),
          ),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (linked) InkWell(onTap: onTap, child: row) else row,
        if (showDivider)
          Divider(height: 1, thickness: 1, color: palette.border),
      ],
    );
  }
}
