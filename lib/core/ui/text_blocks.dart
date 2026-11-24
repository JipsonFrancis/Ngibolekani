import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';
import 'section_card.dart';

/// Heading inside a section card.
class SectionHeading extends StatelessWidget {
  const SectionHeading(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    return Text(
      text,
      style: tokens.type.sectionTitle.copyWith(
        color: ToneScope.paletteOf(context).text,
      ),
    );
  }
}

/// Regular supporting copy.
class BodyText extends StatelessWidget {
  const BodyText(this.text, {super.key, this.muted = true});

  final String text;

  /// Use the secondary text colour (design default).
  final bool muted;

  @override
  Widget build(BuildContext context) {
    final palette = ToneScope.paletteOf(context);
    return Text(
      text,
      style: context.tokens.type.body.copyWith(
        color: muted ? palette.muted : palette.text,
      ),
    );
  }
}

/// Small print, e.g. "Static destination" captions and legal footers.
class NoteText extends StatelessWidget {
  const NoteText(this.text, {super.key, this.center = false});

  final String text;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: center ? TextAlign.center : TextAlign.start,
      style: context.tokens.type.note.copyWith(
        color: ToneScope.paletteOf(context).muted,
      ),
    );
  }
}

/// Large money figure.
class AmountText extends StatelessWidget {
  const AmountText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.tokens.type.amount.copyWith(
        color: ToneScope.paletteOf(context).text,
      ),
    );
  }
}

/// A line in a checklist. A leading glyph sets the state:
/// `☑` checked, `☐` / `○` unchecked, anything else is shown as a tick.
class ChecklistItem extends StatelessWidget {
  const ChecklistItem(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final palette = ToneScope.paletteOf(context);

    var label = text;
    var checked = true;
    if (label.startsWith('☑')) {
      label = label.substring(1).trimLeft();
    } else if (label.startsWith('☐') || label.startsWith('○')) {
      label = label.substring(1).trimLeft();
      checked = false;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(
            checked ? Icons.check_circle : Icons.radio_button_unchecked,
            size: 16,
            color: checked ? palette.accent : palette.muted,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: tokens.type.body.copyWith(color: palette.text),
          ),
        ),
      ],
    );
  }
}
