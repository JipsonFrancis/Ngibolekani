import '../core/navigation/feature_module.dart';
import '../features/borrower/borrower_module.dart';
import '../features/lender/lender_module.dart';
import '../features/onboarding/onboarding_module.dart';

/// Every feature module in the app. Add new modules here.
List<FeatureModule> buildModules() => <FeatureModule>[
      buildOnboardingModule(),
      buildBorrowerModule(),
      buildLenderModule(),
    ];

ScreenRegistry buildRegistry() => ScreenRegistry(buildModules());
