// ignore_for_file: lines_longer_than_80_chars

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dacodes_dd3/generated/l10n.dart';
import 'package:dacodes_dd3/src/config/theme/colors_theme.dart';
import 'package:dacodes_dd3/src/domain/models/character_model.dart';
import 'package:dacodes_dd3/src/domain/models/comics_model.dart';
import 'package:dacodes_dd3/src/domain/models/event_model.dart';
import 'package:dacodes_dd3/src/domain/models/series_model.dart';
import 'package:dacodes_dd3/src/domain/models/story_model.dart';
import 'package:dacodes_dd3/src/ui/screens/detail/bloc/detail_bloc.dart';
import 'package:dacodes_dd3/src/ui/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailSectionWidget extends StatelessWidget {
  const DetailSectionWidget({
    super.key,
    required this.character,
    required this.type,
    required this.title,
  });

  final Character character;
  final DetailType type;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 250,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    DD3Colors.red,
                    DD3Colors.red.withOpacity(0),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 10,
              child: InkWell(
                onTap: () {},
                child: ColoredBox(
                  color: Colors.transparent,
                  child: TextWidget(
                    text: '${S.current.viewAll} >',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 10,
              child: TextWidget(
                text: title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Positioned(
              top: 35,
              left: 0,
              bottom: 10,
              right: 0,
              child: BlocBuilder<DetailBloc, DetailState>(
                buildWhen: (previous, current) {
                  return current.section == type;
                },
                builder: (context, state) {
                  var items = <dynamic>[];
                  switch (type) {
                    case DetailType.comics:
                      items = state.model.comics;
                      break;
                    case DetailType.series:
                      items = state.model.series;
                      break;
                    case DetailType.events:
                      items = state.model.events;
                      break;
                    case DetailType.stories:
                      items = state.model.stories;
                      break;
                    case DetailType.none:
                      break;
                  }

                  return state is GetDataLoadingState
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: LoadingAnimationWidget.halfTriangleDot(
                              color: DD3Colors.accent,
                              size: 100,
                            ),
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            var imageURL = '';
                            var tmpURL = '';

                            switch (type) {
                              case DetailType.comics:
                                final item = items[index] as Comic;
                                tmpURL = item.urls[0].url;
                                imageURL =
                                    '${item.thumbnail.path}.${item.thumbnail.extension}';
                                break;
                              case DetailType.series:
                                final item = items[index] as Serie;
                                tmpURL = item.urls[0].url;
                                imageURL =
                                    '${item.thumbnail.path}.${item.thumbnail.extension}';
                                break;
                              case DetailType.events:
                                final item = items[index] as Event;
                                tmpURL = item.urls[0].url;
                                imageURL =
                                    '${item.thumbnail.path}.${item.thumbnail.extension}';
                                break;
                              case DetailType.stories:
                                final item = items[index] as Story;
                                tmpURL = item.resourceUri;
                                imageURL = item.thumbnail != null
                                    ? '${item.thumbnail?.path}.${item.thumbnail?.extension}'
                                    : 'https://static8.depositphotos.com/1009634/988/v/450/depositphotos_9883921-stock-illustration-no-user-profile-picture.jpg';
                                break;
                              case DetailType.none:
                                break;
                            }

                            return InkWell(
                              onTap: () {
                                switch (type) {
                                  case DetailType.comics:
                                    final item = items[index] as Comic;
                                    Navigator.of(context)
                                        .pushNamed('/comic', arguments: item);
                                    break;
                                  // ignore: no_default_cases
                                  default:
                                    final urlTMP = Uri.parse(tmpURL);
                                    launchUrl(urlTMP);
                                }
                              },
                              child: Container(
                                width: 130,
                                margin: EdgeInsets.fromLTRB(
                                  index == 0 ? 10 : 5,
                                  5,
                                  8,
                                  8,
                                ),
                                decoration: BoxDecoration(
                                  color: DD3Colors.red,
                                  border: Border.all(color: DD3Colors.red),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.contain,
                                    imageUrl: imageURL,
                                    imageBuilder: (context, imageProvider) {
                                      return Image(
                                        alignment: Alignment.centerLeft,
                                        image: imageProvider,
                                        //fit: BoxFit.cover,
                                      );
                                    },
                                    progressIndicatorBuilder:
                                        (context, url, progress) {
                                      return LoadingAnimationWidget
                                          .dotsTriangle(
                                        color: DD3Colors.accent,
                                        size: 30,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
