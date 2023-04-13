import 'package:dacodes_dd3/src/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class RowTextWidget extends StatelessWidget {
  final String title;
  final String text;
  const RowTextWidget({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        TextWidget(
          text: text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
