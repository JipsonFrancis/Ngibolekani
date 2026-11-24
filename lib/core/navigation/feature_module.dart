import '../spec/screen_spec.dart';
import '../ui/app_bottom_nav.dart';

/// A self-contained slice of the product (onboarding, borrower, lender...).
///
/// A module owns its screens and decides which bottom-navigation tabs they
/// show. To add a new area of the app, create a module and add it to
/// `buildModules()` in `lib/app/modules.dart`; nothing else has to change.
class FeatureModule {
  const FeatureModule({
    required this.id,
    required this.title,
    required this.screens,
    required this.nav,
    this.activeTab,
  });

  final String id;
  final String title;
  final List<ScreenSpec> screens;

  /// Tabs shown at the bottom of this module's screens.
  final List<NavDestination> nav;

  /// Which tab a screen highlights; null / -1 means none.
  final int? Function(String screenId)? activeTab;
}

/// Lookup of every screen by id.
class ScreenRegistry {
  ScreenRegistry(List<FeatureModule> modules) : _modules = modules {
    for (final module in modules) {
      for (final screen in module.screens) {
        _specs[screen.id] = screen;
        _owners[screen.id] = module;
      }
    }
  }

  final List<FeatureModule> _modules;
  final Map<String, ScreenSpec> _specs = <String, ScreenSpec>{};
  final Map<String, FeatureModule> _owners = <String, FeatureModule>{};

  List<FeatureModule> get modules => _modules;

  ScreenSpec? spec(String id) => _specs[id];

  FeatureModule? moduleOf(String id) => _owners[id];

  bool contains(String id) => _specs.containsKey(id);

  /// Every `to:` destination used by imported screens that has no screen yet.
  Set<String> unresolvedDestinations() {
    final missing = <String>{};
    for (final spec in _specs.values) {
      for (final node in spec.nodes) {
        if (node is! Section) continue;
        for (final block in node.blocks) {
          final String? to = switch (block) {
            RowBlock b => b.to,
            ButtonBlock b => b.to,
            _ => null,
          };
          if (to != null && !_specs.containsKey(to)) missing.add(to);
        }
      }
    }
    return missing;
  }
}
