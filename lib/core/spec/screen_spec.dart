/// Declarative description of a screen.
///
/// Screens in the Figma file are built from a small, repeating vocabulary
/// (section cards, headings, detail rows, badges, buttons, form fields...).
/// Each screen is therefore stored as data ([ScreenSpec]) and drawn by one
/// renderer (`SpecRenderer`) out of design-system widgets. Changing how a
/// "detail row" looks changes it on every screen at once, and new screens are
/// added by writing data, not layout code.
library;

enum SectionTone { plain, success, warning, error, dark }

enum ButtonKind { primary, secondary, tertiary, danger }

enum BadgeKind { info, success, warning, error, dark }

/// A piece of content inside a [Section].
sealed class Block {
  const Block();
}

class HeadingBlock extends Block {
  const HeadingBlock(this.text);
  final String text;
}

class ParagraphBlock extends Block {
  const ParagraphBlock(this.text);
  final String text;
}

class AmountBlock extends Block {
  const AmountBlock(this.text);
  final String text;
}

class ChecklistBlock extends Block {
  const ChecklistBlock(this.text);

  /// May start with a state glyph: ☑ (checked), ☐ or ○ (unchecked).
  final String text;
}

class NoteBlock extends Block {
  const NoteBlock(this.text);
  final String text;
}

class RowBlock extends Block {
  const RowBlock(this.label, this.value, {this.to});
  final String label;
  final String value;

  /// Screen id this row navigates to, if any.
  final String? to;
}

class BadgeBlock extends Block {
  const BadgeBlock(this.text, this.kind);
  final String text;
  final BadgeKind kind;
}

class ButtonBlock extends Block {
  const ButtonBlock(this.label, this.kind, {this.to});
  final String label;
  final ButtonKind kind;

  /// Screen id this button navigates to, if any.
  final String? to;
}

class FieldBlock extends Block {
  const FieldBlock(this.label, {this.value, this.guidance});
  final String label;
  final String? value;
  final String? guidance;
}

class ProgressBlock extends Block {
  const ProgressBlock(this.value);

  /// 0..1
  final double value;
}

/// A top-level item in a screen body.
sealed class ScreenNode {
  const ScreenNode();
}

class Section extends ScreenNode {
  const Section(this.title, this.blocks, {this.tone = SectionTone.plain});
  final String title;
  final List<Block> blocks;
  final SectionTone tone;
}

class FooterNote extends ScreenNode {
  const FooterNote(this.text);
  final String text;
}

class ScreenSpec {
  const ScreenSpec({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.nodes,
    this.navLabels,
  });

  /// Stable id used in routes and in Figma cross references (e.g. `BRW-09`).
  final String id;
  final String title;
  final String subtitle;
  final List<ScreenNode> nodes;

  /// Optional per-screen override of the bottom navigation labels.
  final List<String>? navLabels;
}
