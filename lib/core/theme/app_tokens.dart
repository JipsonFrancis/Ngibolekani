import 'package:flutter/material.dart';

/// Design tokens extracted from the Figma file (section "01 Design System").
///
/// Everything visual in the app reads from [AppTokens]. To re-skin the app,
/// build a different [AppTokens] and pass it to `AppTheme.light(tokens)`.

@immutable
class AppColors {
  const AppColors({
    this.navy = const Color(0xFF041937),
    this.ink = const Color(0xFF102342),
    this.muted = const Color(0xFF5F6F85),
    this.primary = const Color(0xFF1461D3),
    this.primaryTint = const Color(0xFFEAF2FF),
    this.primaryOnDark = const Color(0xFFDCEAFF),
    this.surface = const Color(0xFFFFFFFF),
    this.canvas = const Color(0xFFF3F6FA),
    this.border = const Color(0xFFDBE5F3),
    this.danger = const Color(0xFFAD3540),
    this.dangerTint = const Color(0xFFFDEEF0),
    this.success = const Color(0xFF16735E),
    this.successTint = const Color(0xFFE7F5EF),
    this.warning = const Color(0xFF8C570A),
    this.warningTint = const Color(0xFFFFF3DC),
    this.accent = const Color(0xFF8AD6E8),
  });

  /// Darkest brand colour (dark cards, deep headings).
  final Color navy;

  /// Default text colour.
  final Color ink;

  /// Secondary text colour.
  final Color muted;

  /// Brand blue ("Loyal blue"): primary actions, links, focus.
  final Color primary;
  final Color primaryTint;
  final Color primaryOnDark;

  final Color surface;

  /// Screen background.
  final Color canvas;

  /// Hairlines, card outlines, inactive tracks.
  final Color border;

  final Color danger;
  final Color dangerTint;
  final Color success;
  final Color successTint;
  final Color warning;
  final Color warningTint;
  final Color accent;

  AppColors copyWith({
    Color? navy,
    Color? ink,
    Color? muted,
    Color? primary,
    Color? primaryTint,
    Color? primaryOnDark,
    Color? surface,
    Color? canvas,
    Color? border,
    Color? danger,
    Color? dangerTint,
    Color? success,
    Color? successTint,
    Color? warning,
    Color? warningTint,
    Color? accent,
  }) {
    return AppColors(
      navy: navy ?? this.navy,
      ink: ink ?? this.ink,
      muted: muted ?? this.muted,
      primary: primary ?? this.primary,
      primaryTint: primaryTint ?? this.primaryTint,
      primaryOnDark: primaryOnDark ?? this.primaryOnDark,
      surface: surface ?? this.surface,
      canvas: canvas ?? this.canvas,
      border: border ?? this.border,
      danger: danger ?? this.danger,
      dangerTint: dangerTint ?? this.dangerTint,
      success: success ?? this.success,
      successTint: successTint ?? this.successTint,
      warning: warning ?? this.warning,
      warningTint: warningTint ?? this.warningTint,
      accent: accent ?? this.accent,
    );
  }
}

@immutable
class AppRadii {
  const AppRadii({
    this.control = 10,
    this.card = 14,
    this.sheet = 20,
    this.pill = 40,
    this.track = 3,
  });

  /// Buttons and inputs.
  final double control;

  /// Cards and sections.
  final double card;
  final double sheet;
  final double pill;

  /// Progress tracks and active markers.
  final double track;
}

@immutable
class AppSpacing {
  const AppSpacing({
    this.xs = 4,
    this.sm = 8,
    this.md = 12,
    this.lg = 16,
    this.xl = 24,
    this.screen = 16,
    this.card = 18,
    this.controlHeight = 52,
  });

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  /// Horizontal padding of every screen.
  final double screen;

  /// Inner padding of section cards.
  final double card;
  final double controlHeight;
}

@immutable
class AppTypography {
  const AppTypography({
    this.displayFamily = 'Comfortaa',
    this.bodyFamily = 'DM Sans',
  });

  /// Used for brand, screen titles and section titles.
  final String displayFamily;

  /// Used for everything else.
  final String bodyFamily;

  TextStyle get brand => TextStyle(
        fontFamily: displayFamily,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      );

  TextStyle get screenTitle => TextStyle(
        fontFamily: displayFamily,
        fontSize: 25,
        fontWeight: FontWeight.w600,
        height: 1.25,
      );

  TextStyle get sectionTitle => TextStyle(
        fontFamily: displayFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.25,
      );

  TextStyle get amount => TextStyle(
        fontFamily: bodyFamily,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 1.2,
      );

  TextStyle get body => TextStyle(
        fontFamily: bodyFamily,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  TextStyle get bodyStrong => TextStyle(
        fontFamily: bodyFamily,
        fontSize: 13,
        fontWeight: FontWeight.w600,
        height: 1.5,
      );

  TextStyle get caption => TextStyle(
        fontFamily: bodyFamily,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        height: 1.4,
      );

  TextStyle get captionStrong => TextStyle(
        fontFamily: bodyFamily,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        height: 1.4,
      );

  TextStyle get note => TextStyle(
        fontFamily: bodyFamily,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.4,
      );

  TextStyle get button => TextStyle(
        fontFamily: bodyFamily,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      );

  TextStyle get navLabel => TextStyle(
        fontFamily: bodyFamily,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      );
}

/// Theme extension carrying every token. Read it with `context.tokens`.
@immutable
class AppTokens extends ThemeExtension<AppTokens> {
  const AppTokens({
    this.colors = const AppColors(),
    this.radii = const AppRadii(),
    this.spacing = const AppSpacing(),
    this.type = const AppTypography(),
  });

  final AppColors colors;
  final AppRadii radii;
  final AppSpacing spacing;
  @override
  final AppTypography type;

  @override
  AppTokens copyWith({
    AppColors? colors,
    AppRadii? radii,
    AppSpacing? spacing,
    AppTypography? type,
  }) {
    return AppTokens(
      colors: colors ?? this.colors,
      radii: radii ?? this.radii,
      spacing: spacing ?? this.spacing,
      type: type ?? this.type,
    );
  }

  @override
  AppTokens lerp(ThemeExtension<AppTokens>? other, double t) {
    if (other is! AppTokens) return this;
    return t < 0.5 ? this : other;
  }
}

extension AppTokensContext on BuildContext {
  /// Tokens from the nearest theme, falling back to the Figma defaults.
  AppTokens get tokens =>
      Theme.of(this).extension<AppTokens>() ?? const AppTokens();
}
