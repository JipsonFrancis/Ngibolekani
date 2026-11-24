import 'package:flutter/material.dart';

import '../../core/navigation/feature_module.dart';
import '../../core/ui/app_bottom_nav.dart';
import 'onboarding_screens.dart';

/// Welcome, role choice, account creation, security, consent, identity,
/// financial picture, eligibility, sign-in and recovery (Figma: ONB-xx).
FeatureModule buildOnboardingModule() {
  return FeatureModule(
    id: 'onboarding',
    title: 'Onboarding & identity',
    screens: onboardingScreens(),
    // The Figma frames show the product tab bar even before sign-in. Return
    // an empty list here to hide it for the signed-out flow.
    nav: const <NavDestination>[
      NavDestination(label: 'Home', icon: Icons.home_outlined, rootScreenId: 'BRW-01'),
      NavDestination(label: 'Marketplace', icon: Icons.storefront_outlined, rootScreenId: 'LND-04'),
      NavDestination(label: 'Loans', icon: Icons.account_balance_wallet_outlined, rootScreenId: 'BRW-08'),
      NavDestination(label: 'Activity', icon: Icons.receipt_long_outlined, rootScreenId: 'BRW-17'),
      NavDestination(label: 'Profile', icon: Icons.person_outline, rootScreenId: 'BRW-21'),
    ],
  );
}
