// ignore_for_file: lines_longer_than_80_chars

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dacodes_dd3/src/config/theme/colors_theme.dart';
import 'package:dacodes_dd3/src/domain/models/character_model.dart';
import 'package:dacodes_dd3/src/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CharacterThumbWidget extends StatelessWidget {
  final double size;
  final Character character;

  const CharacterThumbWidget({
    super.key,
    required this.size,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/detail', arguments: character);
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              width: size,
              height: size,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: DD3Colors.red,
                  boxShadow: const [
                    BoxShadow(
                      color: DD3Colors.shadow,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, progress) {
                      return LoadingAnimationWidget.dotsTriangle(
                        color: DD3Colors.accent,
                        size: 30,
                      );
                    },
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft,
                    imageUrl:
                        '${character.thumbnail.path}.${character.thumbnail.extension}',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextWidget(
              text: character.name,
              style: Theme.of(context).textTheme.displaySmall,
            )
          ],
        ),
      ),
    );
  }
}
