import 'package:flutter/material.dart';

import 'app_tokens.dart';

/// Builds a Material [ThemeData] from [AppTokens].
class AppTheme {
  const AppTheme._();

  static ThemeData light([AppTokens tokens = const AppTokens()]) {
    final c = tokens.colors;
    final scheme = ColorScheme.light(
      primary: c.primary,
      onPrimary: c.surface,
      secondary: c.accent,
      onSecondary: c.navy,
      error: c.danger,
      onError: c.surface,
      surface: c.surface,
      onSurface: c.ink,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: c.canvas,
      fontFamily: tokens.type.bodyFamily,
      dividerColor: c.border,
      splashFactory: InkRipple.splashFactory,
      extensions: <ThemeExtension<dynamic>>[tokens],
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: c.navy,
        contentTextStyle: tokens.type.body.copyWith(color: c.surface),
      ),
    );
  }
}
