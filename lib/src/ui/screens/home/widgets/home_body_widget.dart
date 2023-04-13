import 'package:dacodes_dd3/src/domain/models/character_model.dart';
import 'package:dacodes_dd3/src/ui/screens/home/widgets/character_thumb_widget.dart';
import 'package:dacodes_dd3/src/utils/environment.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class HomeBodyWidget extends StatelessWidget {
  final int itemsCount;
  final List<Character> items;
  final int totalItems;
  final int pageActual;
  final dynamic Function(int) onPageChange;

  const HomeBodyWidget({
    super.key,
    required this.itemsCount,
    required this.items,
    required this.totalItems,
    required this.pageActual,
    required this.onPageChange,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final totalPages = (totalItems / prodEnv.limit).round();

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.70,
              crossAxisCount: 3,
            ),
            itemCount: itemsCount,
            itemBuilder: (context, index) {
              final character = items[index];

              return CharacterThumbWidget(
                size: width / 3 - 20,
                character: character,
              );
            },
          ),
        ),
        NumberPaginator(
          numberPages: totalPages,
          initialPage: pageActual,
          config: NumberPaginatorUIConfig(
            buttonSelectedBackgroundColor: Theme.of(context).primaryColor,
            buttonUnselectedForegroundColor: Theme.of(context).primaryColor,
            buttonSelectedForegroundColor:
                Theme.of(context).scaffoldBackgroundColor,
          ),
          onPageChange: onPageChange,
        )
      ],
    );
  }
}
