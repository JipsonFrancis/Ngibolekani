import 'package:flutter/material.dart';

import '../ui/design_system.dart';

/// Stand-in for a screen that is linked to but not built yet, so navigation
/// never dead-ends while screens are being imported.
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({
    super.key,
    required this.screenId,
    required this.reason,
    this.figmaNodeId,
    this.title,
  });

  final String screenId;
  final String? title;

  /// Why there is no real screen here.
  final String reason;
  final String? figmaNodeId;

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: title ?? screenId,
      subtitle: 'Screen $screenId',
      children: <Widget>[
        SectionCard(
          title: 'Not built yet',
          tone: SectionTone.warning,
          children: <Widget>[
            BodyText(reason),
            if (figmaNodeId != null) ...<Widget>[
              const SizedBox(height: 12),
              DetailRow(label: 'Figma node', value: figmaNodeId!),
            ],
          ],
        ),
      ],
    );
  }
}
