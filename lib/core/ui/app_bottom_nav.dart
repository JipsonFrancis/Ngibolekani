import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';

/// One tab in the bottom bar.
class NavDestination {
  const NavDestination({
    required this.label,
    required this.icon,
    required this.rootScreenId,
  });

  final String label;
  final IconData icon;

  /// Screen opened when the tab is tapped.
  final String rootScreenId;
}

/// Bottom navigation (Figma: "DS / Mobile navigation").
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onSelected,
  });

  final List<NavDestination> items;

  /// -1 when the current screen belongs to no tab.
  final int currentIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final c = tokens.colors;

    return Container(
      decoration: BoxDecoration(
        color: c.surface,
        border: Border(top: BorderSide(color: c.border)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
          child: Row(
            children: <Widget>[
              for (var i = 0; i < items.length; i++)
                Expanded(
                  child: _NavItem(
                    item: items[i],
                    active: i == currentIndex,
                    onTap: () => onSelected(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.item,
    required this.active,
    required this.onTap,
  });

  final NavDestination item;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final c = tokens.colors;
    final color = active ? c.primary : c.muted;

    return Semantics(
      button: true,
      selected: active,
      label: item.label,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(tokens.radii.control),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(item.icon, size: 23, color: color),
              const SizedBox(height: 4),
              Text(
                item.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: tokens.type.navLabel.copyWith(color: color),
              ),
              const SizedBox(height: 4),
              Container(
                width: 17,
                height: 3,
                decoration: BoxDecoration(
                  color: active ? c.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(tokens.radii.track),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
