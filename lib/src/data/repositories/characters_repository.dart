import 'package:dacodes_dd3/src/domain/api/characters_api.dart';
import 'package:dacodes_dd3/src/domain/models/character_model.dart';
import 'package:dacodes_dd3/src/domain/models/characters_response_model.dart';
import 'package:dacodes_dd3/src/domain/models/comics_model.dart';
import 'package:dacodes_dd3/src/domain/models/event_model.dart';
import 'package:dacodes_dd3/src/domain/models/series_model.dart';
import 'package:dacodes_dd3/src/domain/models/story_model.dart';

class CharactersRepository {
  const CharactersRepository({
    required CharactersApi charactersApi,
  }) : _charactersApi = charactersApi;

  final CharactersApi _charactersApi;

  Future<CharectersResponse<Character>> getCharacters(int offset) =>
      _charactersApi.getCharacters(offset);

  Future<CharectersResponse<Comic>> getComics(String characterID, int offset) =>
      _charactersApi.getComics(characterID, offset);

  Future<CharectersResponse<Serie>> getSeries(String characterID, int offset) =>
      _charactersApi.getSeries(characterID, offset);

  Future<CharectersResponse<Event>> getEvents(String characterID, int offset) =>
      _charactersApi.getEvents(characterID, offset);

  Future<CharectersResponse<Story>> getStories(
    String characterID,
    int offset,
  ) =>
      _charactersApi.getStories(characterID, offset);
}
