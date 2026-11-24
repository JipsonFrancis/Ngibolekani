import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../theme/app_tokens.dart';

/// Page frame shared by every screen: brand bar, title, subtitle, scrolling
/// body and an optional bottom bar (Figma: "Screen header" + "Screen body").
class ScreenScaffold extends StatelessWidget {
  const ScreenScaffold({
    super.key,
    required this.title,
    required this.children,
    this.subtitle,
    this.footer,
    this.bottomBar,
  });

  final String title;
  final String? subtitle;
  final List<Widget> children;

  /// Small print shown under the body.
  final String? footer;
  final Widget? bottomBar;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final c = tokens.colors;
    final config = AppConfigScope.of(context);
    final canGoBack = Navigator.of(context).canPop();

    return Scaffold(
      backgroundColor: c.canvas,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(
                  tokens.spacing.screen,
                  tokens.spacing.md,
                  tokens.spacing.screen,
                  tokens.spacing.xl,
                ),
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      if (canGoBack)
                        InkWell(
                          onTap: () => Navigator.of(context).maybePop(),
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.chevron_left,
                              color: c.primary,
                              semanticLabel: 'Back',
                            ),
                          ),
                        ),
                      Text(
                        config.brandName,
                        style: tokens.type.brand.copyWith(color: c.primary),
                      ),
                      const Spacer(),
                      if (config.showSampleBadge)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(tokens.radii.pill),
                            border: Border.all(color: c.border),
                          ),
                          child: Text(
                            config.sampleBadgeLabel,
                            style: tokens.type.note.copyWith(
                              color: c.muted,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: tokens.spacing.lg),
                  Text(
                    title,
                    style: tokens.type.screenTitle.copyWith(color: c.navy),
                  ),
                  if (subtitle != null && subtitle!.isNotEmpty) ...<Widget>[
                    const SizedBox(height: 6),
                    Text(
                      subtitle!,
                      style: tokens.type.body.copyWith(color: c.muted),
                    ),
                  ],
                  SizedBox(height: tokens.spacing.lg),
                  for (var i = 0; i < children.length; i++) ...<Widget>[
                    if (i > 0) SizedBox(height: tokens.spacing.lg),
                    children[i],
                  ],
                  if (footer != null) ...<Widget>[
                    SizedBox(height: tokens.spacing.lg),
                    Text(
                      footer!,
                      textAlign: TextAlign.center,
                      style: tokens.type.note.copyWith(color: c.muted),
                    ),
                  ],
                ],
              ),
            ),
            if (bottomBar != null) bottomBar!,
          ],
        ),
      ),
    );
  }
}
