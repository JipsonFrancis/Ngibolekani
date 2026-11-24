import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../navigation/app_navigation.dart';
import '../navigation/feature_module.dart';
import '../spec/screen_spec.dart';
import '../spec/spec_renderer.dart';
import '../ui/design_system.dart';

/// Draws any [ScreenSpec] with the design system.
class ScreenSpecPage extends StatelessWidget {
  const ScreenSpecPage({
    super.key,
    required this.spec,
    this.module,
    this.renderer = const SpecRenderer(),
  });

  final ScreenSpec spec;

  /// Supplies the bottom navigation. Null hides the bar.
  final FeatureModule? module;
  final SpecRenderer renderer;

  @override
  Widget build(BuildContext context) {
    final config = AppConfigScope.of(context);
    final sampleFooter = config.sampleFooter;

    return ScreenScaffold(
      title: spec.title,
      subtitle: spec.subtitle,
      footer: sampleFooter == null ? null : '${spec.id} · $sampleFooter',
      bottomBar: _bottomBar(context),
      children: renderer.buildBody(context, spec),
    );
  }

  Widget? _bottomBar(BuildContext context) {
    final m = module;
    if (m == null || m.nav.isEmpty) return null;

    final labels = spec.navLabels;
    final items = <NavDestination>[
      for (var i = 0; i < m.nav.length; i++)
        NavDestination(
          label: (labels != null && i < labels.length)
              ? labels[i]
              : m.nav[i].label,
          icon: m.nav[i].icon,
          rootScreenId: m.nav[i].rootScreenId,
        ),
    ];

    return AppBottomNav(
      items: items,
      currentIndex: m.activeTab?.call(spec.id) ?? -1,
      onSelected: (int index) =>
          AppNavigation.openTab(context, items[index].rootScreenId),
    );
  }
}
