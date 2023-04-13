import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle? style;

  const TextWidget({
    super.key,
    this.textAlign = TextAlign.left,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ?? Theme.of(context).textTheme.labelMedium,
    );
  }
}
