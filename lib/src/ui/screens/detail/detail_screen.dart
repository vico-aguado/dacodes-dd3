// ignore_for_file: lines_longer_than_80_chars

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dacodes_dd3/generated/l10n.dart';
import 'package:dacodes_dd3/src/config/theme/colors_theme.dart';
import 'package:dacodes_dd3/src/data/repositories/characters_repository.dart';
import 'package:dacodes_dd3/src/domain/models/character_model.dart';
import 'package:dacodes_dd3/src/ui/screens/detail/bloc/detail_bloc.dart';
import 'package:dacodes_dd3/src/ui/screens/detail/widgets/detail_section_widget.dart';
import 'package:dacodes_dd3/src/ui/screens/detail/widgets/story_section_widget.dart';
import 'package:dacodes_dd3/src/ui/widgets/row_text_widget.dart';
import 'package:dacodes_dd3/src/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Character character;
  const DetailScreen({
    super.key,
    required this.character,
  });

  List<Widget> getActionsIcons() {
    final actions = <Widget>[];

    for (final url in character.urls) {
      var icon = Icons.stars;

      switch (url.type) {
        case 'detail':
          icon = Icons.language;
          break;
        case 'wiki':
          icon = Icons.article;
          break;
        case 'comiclink':
          icon = Icons.menu_book;
          break;
        default:
          icon = Icons.star;
      }

      actions.add(
        IconButton(
          onPressed: () {
            final urlTMP = Uri.parse(url.url);
            launchUrl(urlTMP);
          },
          icon: Icon(icon),
        ),
      );
    }

    return actions;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final repository = RepositoryProvider.of<CharactersRepository>(context);
    final modified = DateTime.parse(character.modified);
    final dateFormat = DateFormat();

    return BlocProvider<DetailBloc>(
      create: (context) => DetailBloc(repository)
        ..add(
          GetSectionsEvent(
            character.id,
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: getActionsIcons(),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: size.width,
                    height: 300,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: DD3Colors.shadow,
                            blurRadius: 10,
                            offset: Offset(0, 10),
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.topLeft,
                          imageUrl:
                              '${character.thumbnail.path}.${character.thumbnail.extension}',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: character.name,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: character.description.isEmpty
                      ? S.current.noDescription
                      : character.description,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 10,
                ),
                if (character.comics.returned > 0)
                  DetailSectionWidget(
                    character: character,
                    title:
                        '${S.current.comics} (${character.comics.available})',
                    type: DetailType.comics,
                  ),
                if (character.events.returned > 0)
                  DetailSectionWidget(
                    character: character,
                    title:
                        '${S.current.events} (${character.events.available})',
                    type: DetailType.events,
                  ),
                if (character.series.returned > 0)
                  DetailSectionWidget(
                    character: character,
                    title:
                        '${S.current.series} (${character.series.available})',
                    type: DetailType.series,
                  ),
                if (character.stories.returned > 0)
                  StorySectionWidget(
                    character: character,
                    title:
                        '${S.current.stories} (${character.stories.available})',
                    type: DetailType.stories,
                  ),
                const SizedBox(
                  height: 10,
                ),
                RowTextWidget(
                  title: '${S.current.modified}:  ',
                  text: dateFormat.format(modified),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
