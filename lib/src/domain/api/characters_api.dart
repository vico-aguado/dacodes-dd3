import 'package:dacodes_dd3/src/domain/models/character_model.dart';
import 'package:dacodes_dd3/src/domain/models/characters_response_model.dart';
import 'package:dacodes_dd3/src/domain/models/comics_model.dart';
import 'package:dacodes_dd3/src/domain/models/event_model.dart';
import 'package:dacodes_dd3/src/domain/models/series_model.dart';
import 'package:dacodes_dd3/src/domain/models/story_model.dart';

abstract class CharactersApi {
  const CharactersApi();

  Future<CharectersResponse<Character>> getCharacters(int offset);
  Future<CharectersResponse<Comic>> getComics(String characterID, int offset);
  Future<CharectersResponse<Serie>> getSeries(String characterID, int offset);
  Future<CharectersResponse<Event>> getEvents(String characterID, int offset);
  Future<CharectersResponse<Story>> getStories(String characterID, int offset);
}

class NotFoundException implements Exception {}
