import 'package:flutter/material.dart';

import '../../core/navigation/feature_module.dart';
import '../../core/ui/app_bottom_nav.dart';
import 'borrower_screens.dart';

/// Borrower experience: profile, requests, offers, funding, repayment,
/// history, settlement, disputes, notifications, account (Figma: BRW-xx).
FeatureModule buildBorrowerModule() {
  return FeatureModule(
    id: 'borrower',
    title: 'Borrower experience',
    screens: borrowerScreens(),
    nav: const <NavDestination>[
      NavDestination(label: 'Home', icon: Icons.home_outlined, rootScreenId: 'BRW-01'),
      NavDestination(label: 'Marketplace', icon: Icons.storefront_outlined, rootScreenId: 'LND-04'),
      NavDestination(label: 'Loans', icon: Icons.account_balance_wallet_outlined, rootScreenId: 'BRW-08'),
      NavDestination(label: 'Activity', icon: Icons.receipt_long_outlined, rootScreenId: 'BRW-17'),
      NavDestination(label: 'Profile', icon: Icons.person_outline, rootScreenId: 'BRW-21'),
    ],
    activeTab: _activeTab,
  );
}

const Map<String, int> _tabByScreen = <String, int>{
  'BRW-01': 0,
  'BRW-03': 0,
  'BRW-04': 2,
  'BRW-05': 2,
  'BRW-06': 2,
  'BRW-07': 2,
  'BRW-08': 2,
  'BRW-09': 2,
  'BRW-10': 2,
  'BRW-11': 2,
  'BRW-12': 2,
  'BRW-13': 2,
  'BRW-14': 2,
  'BRW-15': 2,
  'BRW-16': 3,
  'BRW-17': 3,
  'BRW-18': 3,
  'BRW-19': 3,
  'BRW-20': 3,
  'BRW-02': 4,
  'BRW-21': 4,
};

int? _activeTab(String screenId) => _tabByScreen[screenId];
