// ignore_for_file: lines_longer_than_80_chars

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dacodes_dd3/generated/l10n.dart';
import 'package:dacodes_dd3/src/config/theme/colors_theme.dart';
import 'package:dacodes_dd3/src/domain/models/comics_model.dart';
import 'package:dacodes_dd3/src/ui/widgets/row_text_widget.dart';
import 'package:dacodes_dd3/src/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ComicScreen extends StatelessWidget {
  final Comic comic;
  const ComicScreen({
    super.key,
    required this.comic,
  });

  List<Widget> getActionsIcons() {
    final actions = <Widget>[];

    for (final url in comic.urls) {
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
        case 'purchase':
          icon = Icons.paid;
          break;
        case 'reader':
          icon = Icons.auto_stories;
          break;
        case 'inAppLink':
          icon = Icons.smartphone;
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

  List<Widget> getDates() {
    final dates = <Widget>[];
    final dateFormat = DateFormat();

    for (final date in comic.dates) {
      final dateTime = DateTime.parse(date.date);
      var title = '';

      switch (date.type) {
        case 'onsaleDate':
          title = '${S.current.publised}: ';
          break;
        case 'focDate':
          title = 'FOC: ';
          break;
        case 'unlimitedDate':
          title = '${S.current.unlimited}: ';
          break;
        case 'digitalPurchaseDate':
          title = '${S.current.digitalPurchase}: ';
          break;
        default:
          title = date.type;
      }

      dates.add(
        RowTextWidget(title: title, text: dateFormat.format(dateTime)),
      );
    }

    return dates;
  }

  List<Widget> getPrices() {
    final prices = <Widget>[];

    for (final price in comic.prices) {
      var title = '';

      switch (price.type) {
        case 'printPrice':
          title = '${S.current.printPrice}: ';
          break;
        default:
          title = price.type;
      }

      prices.add(
        RowTextWidget(title: title, text: '\$${price.price}'),
      );
    }

    return prices;
  }

  List<Widget> getCharacters(BuildContext context) {
    final characters = <Widget>[];

    for (final character in comic.characters.items) {
      characters.add(
        InkWell(
          onTap: () {
            final characterID = character.resourceUri.split('/').last;
            debugPrint(characterID);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            width: double.maxFinite,
            height: 37,
            color: DD3Colors.red.withOpacity(0.2),
            alignment: Alignment.centerLeft,
            child: TextWidget(
              text: ' - ${character.name}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      );
    }

    return characters;
  }

  List<Widget> getCreators(BuildContext context) {
    final creators = <Widget>[];

    for (final creator in comic.creators.items) {
      creators.add(
        InkWell(
          onTap: () {
            final characterID = creator.resourceUri.split('/').last;
            debugPrint(characterID);
            final urlTMP = Uri.parse(creator.resourceUri);
            launchUrl(urlTMP);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            width: double.maxFinite,
            height: 50,
            color: DD3Colors.red.withOpacity(0.2),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: ' - ${creator.name}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextWidget(
                    text: creator.role,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return creators;
  }

  @override
  Widget build(BuildContext context) {
    final modified = DateTime.parse(comic.modified);

    final dateFormat = DateFormat();

    return Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 195,
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
                        fit: BoxFit.fill,
                        alignment: Alignment.topLeft,
                        imageUrl:
                            '${comic.thumbnail.path}.${comic.thumbnail.extension}',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: comic.title,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: comic.description.isEmpty
                    ? S.current.noDescription
                    : comic.description,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              if (comic.characters.items.isNotEmpty)
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: double.maxFinite,
                  height: 30,
                  color: DD3Colors.red,
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    text: '${S.current.characters}: ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ...getCharacters(context),
              const SizedBox(
                height: 20,
              ),
              if (comic.creators.items.isNotEmpty)
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: double.maxFinite,
                  height: 30,
                  color: DD3Colors.red,
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    text: '${S.current.creators}: ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ...getCreators(context),
              const SizedBox(
                height: 20,
              ),
              RowTextWidget(
                title: '${S.current.pages}:  ',
                text: comic.pageCount.toString(),
              ),
              ...getPrices(),
              ...getDates(),
              if (comic.upc.isNotEmpty)
                RowTextWidget(title: 'UOC:  ', text: comic.upc),
              if (comic.ean.isNotEmpty)
                RowTextWidget(title: 'EAN:  ', text: comic.ean),
              if (comic.issn.isNotEmpty)
                RowTextWidget(title: 'ISSN:  ', text: comic.issn),
              if (comic.isbn.isNotEmpty)
                RowTextWidget(title: 'ISBN:  ', text: comic.isbn),
              RowTextWidget(
                title: '${S.current.format}:  ',
                text: comic.format,
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
    );
  }
}
