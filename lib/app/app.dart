import 'package:flutter/material.dart';

import '../core/config/app_config.dart';
import '../core/theme/app_theme.dart';
import '../core/theme/app_tokens.dart';
import 'app_router.dart';
import 'modules.dart';

/// Root widget.
///
/// Customise the look with [tokens] (colours, radii, spacing, fonts) and the
/// product behaviour with [config] (brand name, sample badge, start route).
class TransferMeApp extends StatelessWidget {
  const TransferMeApp({
    super.key,
    this.tokens = const AppTokens(),
    this.config = const AppConfig(),
  });

  final AppTokens tokens;
  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(buildRegistry());

    return AppConfigScope(
      config: config,
      child: MaterialApp(
        title: config.brandName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(tokens),
        initialRoute: config.startRoute,
        onGenerateRoute: router.onGenerateRoute,
      ),
    );
  }
}