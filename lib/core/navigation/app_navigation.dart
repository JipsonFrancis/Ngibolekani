import 'package:flutter/material.dart';

import '../config/app_config.dart';

/// Route helpers. Every screen lives at `/screen/<ID>`.
class AppNavigation {
  const AppNavigation._();

  static String routeFor(String screenId) => '/screen/$screenId';

  /// Open another screen on top of the current one.
  static void open(BuildContext context, String screenId) {
    Navigator.of(context).pushNamed(routeFor(screenId));
  }

  /// Switch tab: replace everything above the first route.
  static void openTab(BuildContext context, String screenId) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      routeFor(screenId),
      (Route<dynamic> route) => route.isFirst,
    );
  }

  /// Feedback for buttons that have no destination in the Figma file.
  static void notConnected(BuildContext context) {
    final message = AppConfigScope.of(context).notConnectedMessage;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
