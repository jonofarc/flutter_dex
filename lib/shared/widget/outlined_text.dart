import 'package:flutter/material.dart';

/// A text widget that renders an outline (stroke) around the text.
///
/// This widget achieves the outline effect by stacking two [Text] widgets:
/// - The bottom text is drawn using a stroked [Paint].
/// - The top text is drawn normally using the provided [style].
///
/// If [style] is not provided, the widget uses the surrounding
/// [DefaultTextStyle] from the widget tree.
///
/// Example:
/// ```dart
/// OutlinedText(
///   'Hello world',
///  textAlign: TextAlign.center,
///  maxLines: 2,
///  overflow: TextOverflow.ellipsis,
///  outlineColor: Color(0xFF3561AD),
///  outlineStrokeWeight: 5.0,
///  style: const TextStyle(
///  color: Color(0xFFFFCB08),
///  fontSize: 18,
///  fontWeight: FontWeight.bold,
///  letterSpacing: 1.5,
///  ),
/// ```
///
/// The outline is rendered with a black stroke that is 3 logical pixels wide.

class OutlinedText extends StatelessWidget {
  /// Creates an outlined text widget.
  ///
  /// The [text] parameter must not be null.
  const OutlinedText(
    this.text, {
    super.key,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
    this.outlineColor,
    this.outlineStrokeWeight,
  });

  /// The text to display.
  final String text;

  /// How the text should be aligned horizontally.
  ///
  /// See [Text.textAlign].
  final TextAlign? textAlign;

  /// An optional maximum number of lines for the text to span.
  ///
  /// See [Text.maxLines].
  final int? maxLines;

  /// How visual overflow should be handled.
  ///
  /// See [Text.overflow].
  final TextOverflow? overflow;

  /// The style to use for the text.
  ///
  /// If null, the widget inherits the current [DefaultTextStyle].
  final TextStyle? style;

  /// Color used for the outline
  ///
  /// If null, the color is set to Colors.black
  final Color? outlineColor;

  /// Weight of the outline
  ///
  /// A bigger value makes a more prominent outline
  final double? outlineStrokeWeight;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? DefaultTextStyle.of(context).style;

    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: effectiveStyle.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = outlineStrokeWeight ?? 3
              ..color = outlineColor ?? Colors.black,
          ),
        ),
        Text(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: effectiveStyle,
        ),
      ],
    );
  }
}
