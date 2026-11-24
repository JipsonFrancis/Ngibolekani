import 'package:flutter/material.dart';

import '../navigation/app_navigation.dart';
import '../theme/app_tokens.dart';
import '../ui/design_system.dart';
import 'screen_spec.dart';

/// Turns [ScreenNode]s into design-system widgets.
///
/// This is the one place that decides which widget draws which block. To
/// customise a block everywhere, either edit the widget in `core/ui`, or
/// subclass [SpecRenderer], override [buildBlock] and hand the subclass to
/// `ScreenSpecPage`.
class SpecRenderer {
  const SpecRenderer();

  /// Widgets for the whole body of a screen.
  List<Widget> buildBody(BuildContext context, ScreenSpec spec) {
    return <Widget>[
      for (final node in spec.nodes) buildNode(context, node),
    ];
  }

  Widget buildNode(BuildContext context, ScreenNode node) {
    return switch (node) {
      Section s => buildSection(context, s),
      FooterNote f => NoteText(f.text, center: true),
    };
  }

  Widget buildSection(BuildContext context, Section section) {
    final spacing = context.tokens.spacing;
    final children = <Widget>[];

    // When the content opens with its own heading equal to the section title
    // the card must not print the title twice.
    final hasInlineTitle = section.blocks.any(
      (Block b) => b is HeadingBlock && b.text == section.title,
    );
    final title = hasInlineTitle || section.title.isEmpty ? null : section.title;

    Block? previous;
    for (final block in section.blocks) {
      if (previous != null) {
        children.add(SizedBox(height: _gap(previous, block, spacing)));
      }
      children.add(buildBlock(context, block));
      previous = block;
    }

    return SectionCard(
      title: title == 'Actions' ? null : title,
      tone: section.tone,
      children: children,
    );
  }

  double _gap(Block before, Block after, AppSpacing spacing) {
    if (before is RowBlock && after is RowBlock) return 0;
    if (before is ButtonBlock && after is ButtonBlock) return spacing.md;
    if (before is ChecklistBlock && after is ChecklistBlock) return spacing.sm;
    return spacing.md;
  }

  Widget buildBlock(BuildContext context, Block block) {
    return switch (block) {
      HeadingBlock b => SectionHeading(b.text),
      ParagraphBlock b => BodyText(b.text),
      AmountBlock b => AmountText(b.text),
      ChecklistBlock b => ChecklistItem(b.text),
      NoteBlock b => NoteText(b.text),
      RowBlock b => DetailRow(
          label: b.label,
          value: b.value,
          onTap: b.to == null ? null : () => AppNavigation.open(context, b.to!),
        ),
      BadgeBlock b => Align(
          alignment: Alignment.centerLeft,
          child: StatusBadge(text: b.text, kind: b.kind),
        ),
      ButtonBlock b => AppButton(
          label: b.label,
          kind: b.kind,
          onPressed: () {
            if (b.to == null) {
              AppNavigation.notConnected(context);
            } else {
              AppNavigation.open(context, b.to!);
            }
          },
        ),
      FieldBlock b => _buildField(b),
      ProgressBlock b => AppProgressBar(value: b.value),
    };
  }

  /// Form fields are described by the glyphs Figma uses in their sample value:
  /// `⌄` marks a dropdown and `◉` marks a password with a visibility toggle.
  Widget _buildField(FieldBlock b) {
    final value = b.value ?? '';
    if (value.contains('⌄')) {
      return AppSelectField(
        label: b.label,
        value: value.replaceAll('⌄', '').trim(),
        helper: b.guidance,
      );
    }
    if (value.contains('◉')) {
      return AppTextField(
        label: b.label,
        hint: value.replaceAll('◉', '').trim(),
        helper: b.guidance,
        obscure: true,
      );
    }
    return AppTextField(
      label: b.label,
      initialValue: value,
      helper: b.guidance,
    );
  }
}
