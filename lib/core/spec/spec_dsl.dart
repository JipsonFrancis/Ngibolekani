// ignore_for_file: non_constant_identifier_names
//
// Compact builders used by the feature screen files. They mirror the layer
// names in Figma so a screen can be transcribed (or generated) line by line.

import 'screen_spec.dart';

final RegExp _arrowDestination = RegExp(r'([A-Z]{2,3}-[A-Z0-9]+)\s*→\s*$');

Block h(String text) => HeadingBlock(text);
Block p(String text) => ParagraphBlock(text);
Block amt(String text) => AmountBlock(text);
Block chk(String text) => ChecklistBlock(text);
Block note(String text) => NoteBlock(text);
Block prog(double value) => ProgressBlock(value);

/// A label/value row. Values that end in `SCREEN-ID →` link to that screen.
Block row(String label, String value, {String? to}) {
  final match = _arrowDestination.firstMatch(value);
  return RowBlock(label, value, to: to ?? match?.group(1));
}

/// [kind] is one of `ok`, `warn`, `err`, `dark`; omitted means informational.
Block badge(String text, [String? kind]) => BadgeBlock(text, _badgeKind(kind));

/// [style] is one of `primary`, `secondary`, `tertiary`, `danger`.
Block btn(String label, String style, {String? to}) =>
    ButtonBlock(label, _buttonKind(style), to: to);

Block field(String label, [String? value, String? guidance]) =>
    FieldBlock(label, value: value, guidance: guidance);

/// [tone] is one of `ok`, `warn`, `err`, `dark`; omitted means plain.
ScreenNode sec(String title, List<Block> blocks, {String? tone}) =>
    Section(title, blocks, tone: _sectionTone(tone));

ScreenNode foot(String text) => FooterNote(text);

/// One screen. [nav] is an optional comma separated list of tab labels.
ScreenSpec S(
  String id,
  String title,
  String subtitle,
  List<ScreenNode> nodes, {
  String? nav,
}) {
  return ScreenSpec(
    id: id,
    title: title,
    subtitle: subtitle,
    nodes: nodes,
    navLabels: nav?.split(','),
  );
}

BadgeKind _badgeKind(String? kind) {
  switch (kind) {
    case 'ok':
      return BadgeKind.success;
    case 'warn':
      return BadgeKind.warning;
    case 'err':
      return BadgeKind.error;
    case 'dark':
      return BadgeKind.dark;
    default:
      return BadgeKind.info;
  }
}

ButtonKind _buttonKind(String style) {
  switch (style) {
    case 'secondary':
      return ButtonKind.secondary;
    case 'tertiary':
      return ButtonKind.tertiary;
    case 'danger':
      return ButtonKind.danger;
    default:
      return ButtonKind.primary;
  }
}

SectionTone _sectionTone(String? tone) {
  switch (tone) {
    case 'ok':
      return SectionTone.success;
    case 'warn':
      return SectionTone.warning;
    case 'err':
      return SectionTone.error;
    case 'dark':
      return SectionTone.dark;
    default:
      return SectionTone.plain;
  }
}
