import 'package:flutter/material.dart';

import '../core/navigation/app_navigation.dart';
import '../core/navigation/feature_module.dart';
import '../core/pages/gallery_page.dart';
import '../core/pages/placeholder_page.dart';
import '../core/pages/screen_spec_page.dart';
import 'pending_figma_screens.dart';

/// Resolves `/screen/<ID>` and `/gallery`.
class AppRouter {
  AppRouter(this.registry);

  final ScreenRegistry registry;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final name = settings.name ?? '/gallery';
    const prefix = '/screen/';

    if (name.startsWith(prefix)) {
      final id = name.substring(prefix.length);
      return _route(settings, _screen(id));
    }
    return _route(settings, GalleryPage(registry: registry));
  }

  Widget _screen(String id) {
    final spec = registry.spec(id);
    if (spec != null) {
      return ScreenSpecPage(spec: spec, module: registry.moduleOf(id));
    }

    final pending = pendingFrameForScreen(id);
    if (pending != null) {
      return PlaceholderPage(
        screenId: id,
        title: pending.name,
        figmaNodeId: pending.nodeId,
        reason: 'This frame exists in the Figma file but has not been '
            'imported yet. Extract it and add it to the ${pending.group} '
            'feature module.',
      );
    }

    return PlaceholderPage(
      screenId: id,
      reason: isUndesignedDestination(id)
          ? 'Other screens link here, but the Figma file has no frame for it '
              'yet. Design it, then add it to its feature module.'
          : 'No screen is registered for this id.',
    );
  }

  MaterialPageRoute<void> _route(RouteSettings settings, Widget page) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => page,
    );
  }

  /// Convenience for tests and deep links.
  static String routeFor(String screenId) => AppNavigation.routeFor(screenId);
}
