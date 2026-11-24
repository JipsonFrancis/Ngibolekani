import 'package:flutter/material.dart';

import '../../app/pending_figma_screens.dart';
import '../navigation/app_navigation.dart';
import '../navigation/feature_module.dart';
import '../ui/design_system.dart';

/// Development index of every screen, grouped by feature module.
/// Set `AppConfig.startRoute` to `/screen/ONB-01` to hide it.
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key, required this.registry});

  final ScreenRegistry registry;

  @override
  Widget build(BuildContext context) {
    final unresolved = registry.unresolvedDestinations().toList()..sort();

    return ScreenScaffold(
      title: 'All screens',
      subtitle: 'Development index · tap a screen to open it',
      children: <Widget>[
        for (final module in registry.modules)
          SectionCard(
            title: '${module.title} (${module.screens.length})',
            children: <Widget>[
              for (final screen in module.screens)
                DetailRow(
                  label: screen.id,
                  value: screen.title,
                  onTap: () => AppNavigation.open(context, screen.id),
                ),
            ],
          ),
        SectionCard(
          title: 'Linked, not built yet (${unresolved.length})',
          tone: SectionTone.warning,
          children: <Widget>[
            const BodyText(
              'Destinations that imported screens link to. Route frames come '
              'from the Figma file; SUP / SHR / ST ids have no frame in it.',
            ),
            const SizedBox(height: 8),
            for (final id in unresolved)
              DetailRow(
                label: id,
                value: pendingFrameForScreen(id)?.name ??
                    (isUndesignedDestination(id)
                        ? 'No frame in Figma'
                        : 'Pending import'),
                onTap: () => AppNavigation.open(context, id),
              ),
          ],
        ),
        SectionCard(
          title: 'Earlier Small Money flows (${pendingLegacyFlows.length})',
          children: <Widget>[
            const BodyText(
              'Splash, onboarding carousel, login, register, transfer and '
              'success frames (375 × 812). Pending import.',
            ),
            const SizedBox(height: 8),
            for (final frame in pendingLegacyFlows)
              DetailRow(label: frame.group, value: '${frame.name} · ${frame.nodeId}'),
          ],
        ),
      ],
    );
  }
}
