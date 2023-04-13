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

class StorySectionWidget extends StatelessWidget {
  const StorySectionWidget({
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
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            var title = '';
                            var tmpURL = '';

                            switch (type) {
                              case DetailType.comics:
                                final item = items[index] as Comic;
                                tmpURL = item.urls[0].url;
                                title = item.title;
                                break;
                              case DetailType.series:
                                final item = items[index] as Serie;
                                tmpURL = item.urls[0].url;
                                title = item.title;
                                break;
                              case DetailType.events:
                                final item = items[index] as Event;
                                tmpURL = item.urls[0].url;
                                title = item.title;
                                break;
                              case DetailType.stories:
                                final item = items[index] as Story;
                                tmpURL = item.resourceUri;
                                title = item.title;
                                break;
                              case DetailType.none:
                                break;
                            }

                            return InkWell(
                              onTap: () {
                                debugPrint(tmpURL);
                              },
                              child: Container(
                                height: 25,
                                decoration: BoxDecoration(
                                  color: DD3Colors.red.withOpacity(0.5),
                                ),
                                alignment: Alignment.centerLeft,
                                child: TextWidget(
                                  text: '  - $title',
                                  style: Theme.of(context).textTheme.titleLarge,
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
