import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';
import 'section_card.dart';

InputDecoration _decoration(
  BuildContext context, {
  String? hint,
  String? error,
  Widget? suffix,
}) {
  final tokens = context.tokens;
  final c = tokens.colors;

  OutlineInputBorder border(Color color, [double width = 1]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(tokens.radii.control),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  return InputDecoration(
    hintText: hint,
    hintStyle: tokens.type.body.copyWith(color: c.muted),
    errorText: error,
    errorStyle: tokens.type.caption.copyWith(color: c.danger),
    filled: true,
    fillColor: c.surface,
    isDense: false,
    suffixIcon: suffix,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    enabledBorder: border(c.border),
    disabledBorder: border(c.border),
    focusedBorder: border(c.primary, 2),
    errorBorder: border(c.danger),
    focusedErrorBorder: border(c.danger, 2),
  );
}

class _FieldFrame extends StatelessWidget {
  const _FieldFrame({required this.label, required this.child, this.helper});

  final String label;
  final String? helper;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final palette = ToneScope.paletteOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: tokens.type.bodyStrong.copyWith(color: palette.text),
        ),
        SizedBox(height: tokens.spacing.xs + 2),
        child,
        if (helper != null) ...<Widget>[
          SizedBox(height: tokens.spacing.xs + 2),
          Text(
            helper!,
            style: tokens.type.caption.copyWith(color: palette.muted),
          ),
        ],
      ],
    );
  }
}

/// Labelled text input (Figma: "DS / Text input", states default, focus,
/// error and disabled). Set [obscure] for a password input with the
/// show / hide toggle ("DS / Password input").
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.initialValue,
    this.hint,
    this.helper,
    this.error,
    this.obscure = false,
    this.enabled = true,
    this.keyboardType,
    this.controller,
    this.onChanged,
  });

  final String label;
  final String? initialValue;
  final String? hint;
  final String? helper;

  /// When non-null the field is drawn in its error state.
  final String? error;
  final bool obscure;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _hidden = widget.obscure;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final c = tokens.colors;

    return _FieldFrame(
      label: widget.label,
      helper: widget.error == null ? widget.helper : null,
      child: TextFormField(
        controller: widget.controller,
        initialValue:
            widget.controller == null ? widget.initialValue : null,
        enabled: widget.enabled,
        obscureText: _hidden,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        style: tokens.type.body.copyWith(
          color: widget.enabled ? c.ink : c.muted,
        ),
        decoration: _decoration(
          context,
          hint: widget.hint,
          error: widget.error,
          suffix: widget.obscure
              ? IconButton(
                  tooltip: _hidden ? 'Show password' : 'Hide password',
                  icon: Icon(
                    _hidden
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: c.muted,
                    size: 20,
                  ),
                  onPressed: () => setState(() => _hidden = !_hidden),
                )
              : null,
        ),
      ),
    );
  }
}

/// Dropdown-style field (Figma: "DS / Dropdown"). When [options] is empty the
/// field only displays [value].
class AppSelectField extends StatefulWidget {
  const AppSelectField({
    super.key,
    required this.label,
    required this.value,
    this.options = const <String>[],
    this.helper,
    this.onChanged,
  });

  final String label;
  final String value;
  final List<String> options;
  final String? helper;
  final ValueChanged<String>? onChanged;

  @override
  State<AppSelectField> createState() => _AppSelectFieldState();
}

class _AppSelectFieldState extends State<AppSelectField> {
  late String _value = widget.value;

  Future<void> _pick() async {
    if (widget.options.isEmpty) return;
    final picked = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext sheetContext) {
        return SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              for (final String option in widget.options)
                ListTile(
                  title: Text(option),
                  selected: option == _value,
                  onTap: () => Navigator.of(sheetContext).pop(option),
                ),
            ],
          ),
        );
      },
    );
    if (picked != null && mounted) {
      setState(() => _value = picked);
      widget.onChanged?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final c = tokens.colors;
    final radius = BorderRadius.circular(tokens.radii.control);

    return _FieldFrame(
      label: widget.label,
      helper: widget.helper,
      child: Material(
        color: c.surface,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(color: c.border),
        ),
        child: InkWell(
          onTap: _pick,
          borderRadius: radius,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _value,
                    style: tokens.type.body.copyWith(color: c.ink),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: c.muted, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
