import 'package:flutter/widgets.dart';

/// Product-level switches that are not visual tokens. Change them here (or
/// pass a different instance to `TransferMeApp`) instead of editing screens.
@immutable
class AppConfig {
  const AppConfig({
    this.brandName = 'Ngibolekani',
    this.showSampleBadge = false,
    this.sampleBadgeLabel = 'SAMPLE DATA',
    this.sampleFooter =
        'Fictional sample only. Interactions not connected. No money moves.',
    this.notConnectedMessage = 'Interactions not connected · No money moves',
    this.startRoute = '/gallery',
  });

  final String brandName;

  /// The "SAMPLE DATA" pill in the header. Turn off for production builds.
  final bool showSampleBadge;
  final String sampleBadgeLabel;

  /// Printed under every screen as "<screen id> · <sampleFooter>". Null hides.
  final String? sampleFooter;

  /// Snack bar shown for actions that have no destination yet.
  final String notConnectedMessage;

  /// `/gallery` lists every screen (handy during development);
  /// use `/screen/ONB-01` to boot straight into the product.
  final String startRoute;
}

class AppConfigScope extends InheritedWidget {
  const AppConfigScope({
    super.key,
    required this.config,
    required super.child,
  });

  final AppConfig config;

  static AppConfig of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppConfigScope>()?.config ??
      const AppConfig();

  @override
  bool updateShouldNotify(AppConfigScope oldWidget) =>
      oldWidget.config != config;
}