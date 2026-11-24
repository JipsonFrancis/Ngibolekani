import 'package:flutter/material.dart';

import '../../core/navigation/feature_module.dart';
import '../../core/ui/app_bottom_nav.dart';
import 'lender_screens.dart';

/// Lender experience: set-up, preferences, marketplace, offers, commitments,
/// portfolio, repayments, funds, withdrawals, statements (Figma: LND-xx).
FeatureModule buildLenderModule() {
  return FeatureModule(
    id: 'lender',
    title: 'Lender experience',
    screens: lenderScreens(),
    nav: const <NavDestination>[
      NavDestination(label: 'Home', icon: Icons.home_outlined, rootScreenId: 'LND-01'),
      NavDestination(label: 'Marketplace', icon: Icons.storefront_outlined, rootScreenId: 'LND-04'),
      NavDestination(label: 'Portfolio', icon: Icons.pie_chart_outline, rootScreenId: 'LND-10'),
      NavDestination(label: 'Activity', icon: Icons.receipt_long_outlined, rootScreenId: 'LND-13'),
      NavDestination(label: 'Profile', icon: Icons.person_outline, rootScreenId: 'LND-18'),
    ],
    activeTab: _activeTab,
  );
}

const Map<String, int> _tabByScreen = <String, int>{
  'LND-01': 0,
  'LND-02': 0,
  'LND-03': 0,
  'LND-04': 1,
  'LND-05': 1,
  'LND-06': 1,
  'LND-07': 1,
  'LND-08': 2,
  'LND-09': 2,
  'LND-10': 2,
  'LND-11': 2,
  'LND-12': 2,
  'LND-13': 3,
  'LND-14': 3,
  'LND-15': 3,
  'LND-16': 3,
  'LND-17': 4,
  'LND-18': 4,
};

int? _activeTab(String screenId) => _tabByScreen[screenId];
