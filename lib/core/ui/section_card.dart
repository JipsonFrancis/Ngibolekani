import 'package:flutter/material.dart';

import '../spec/screen_spec.dart' show SectionTone;
import '../theme/app_tokens.dart';

export '../spec/screen_spec.dart' show SectionTone;

/// Colours a section hands down to its content.
class SectionPalette {
  const SectionPalette({
    required this.background,
    required this.border,
    required this.text,
    required this.muted,
    required this.accent,
  });

  final Color background;
  final Color border;
  final Color text;
  final Color muted;
  final Color accent;

  static SectionPalette of(AppTokens tokens, SectionTone tone) {
    final c = tokens.colors;
    return switch (tone) {
      SectionTone.plain => SectionPalette(
          background: c.surface,
          border: c.border,
          text: c.ink,
          muted: c.muted,
          accent: c.primary,
        ),
      SectionTone.success => SectionPalette(
          background: c.successTint,
          border: c.success,
          text: c.ink,
          muted: c.muted,
          accent: c.success,
        ),
      SectionTone.warning => SectionPalette(
          background: c.warningTint,
          border: c.warning,
          text: c.ink,
          muted: c.muted,
          accent: c.warning,
        ),
      SectionTone.error => SectionPalette(
          background: c.dangerTint,
          border: c.danger,
          text: c.ink,
          muted: c.muted,
          accent: c.danger,
        ),
      SectionTone.dark => SectionPalette(
          background: c.navy,
          border: c.navy,
          text: c.surface,
          muted: c.primaryOnDark,
          accent: c.accent,
        ),
    };
  }
}

/// Lets descendants of a [SectionCard] read the card's tone.
class ToneScope extends InheritedWidget {
  const ToneScope({super.key, required this.tone, required super.child});

  final SectionTone tone;

  static SectionTone of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ToneScope>()?.tone ??
      SectionTone.plain;

  /// Palette for the nearest section, usable by any design-system widget.
  static SectionPalette paletteOf(BuildContext context) =>
      SectionPalette.of(context.tokens, of(context));

  @override
  bool updateShouldNotify(ToneScope oldWidget) => oldWidget.tone != tone;
}

/// The white (or tinted) card that groups related content on a screen.
class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.children,
    this.title,
    this.tone = SectionTone.plain,
  });

  /// Shown above the content. Leave null when the content starts with its own
  /// heading.
  final String? title;
  final SectionTone tone;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final palette = SectionPalette.of(tokens, tone);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(tokens.spacing.card),
      decoration: BoxDecoration(
        color: palette.background,
        borderRadius: BorderRadius.circular(tokens.radii.card),
        border: Border.all(color: palette.border),
      ),
      child: ToneScope(
        tone: tone,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (title != null) ...<Widget>[
              Text(
                title!,
                style: tokens.type.sectionTitle.copyWith(color: palette.text),
              ),
              SizedBox(height: tokens.spacing.md),
            ],
            ...children,
          ],
        ),
      ),
    );
  }
}
