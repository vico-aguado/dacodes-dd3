import 'package:dacodes_dd3/src/data/sources/remote/remote_source.dart';
import 'package:dacodes_dd3/src/domain/api/characters_api.dart';
import 'package:dacodes_dd3/src/domain/models/character_model.dart';
import 'package:dacodes_dd3/src/domain/models/characters_response_model.dart';
import 'package:dacodes_dd3/src/domain/models/comics_model.dart';
import 'package:dacodes_dd3/src/domain/models/event_model.dart';
import 'package:dacodes_dd3/src/domain/models/series_model.dart';
import 'package:dacodes_dd3/src/domain/models/story_model.dart';
import 'package:dacodes_dd3/src/utils/apis.dart';
import 'package:dacodes_dd3/src/utils/environment.dart';

class CharacterRemoteSource extends CharactersApi {
  final RemoteSource _source;
  final Env _env;

  CharacterRemoteSource(this._source, this._env);

  @override
  Future<CharectersResponse<Character>> getCharacters(int offset) async {
    try {
      final result = await _source.dio.get<dynamic>(
        _env.endpoint + CHARACTERS_URL,
        queryParameters: {
          'limit': _env.limit,
          'offset': offset,
        },
      );

      final characters = CharectersResponse<Character>.fromMap(
        result.data as Map<String, dynamic>,
        Character.fromMap,
      );
      return characters;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CharectersResponse<Comic>> getComics(
    String characterID,
    int offset,
  ) async {
    try {
      final result = await _source.dio.get<dynamic>(
        '${_env.endpoint}$CHARACTERS_URL/$characterID/$COMICS_URL',
        queryParameters: {
          'limit': _env.limit,
          'offset': offset,
        },
      );

      final comics = CharectersResponse<Comic>.fromMap(
        result.data as Map<String, dynamic>,
        Comic.fromMap,
      );
      return comics;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CharectersResponse<Serie>> getSeries(
    String characterID,
    int offset,
  ) async {
    try {
      final result = await _source.dio.get<dynamic>(
        '${_env.endpoint}$CHARACTERS_URL/$characterID/$SERIES_URL',
        queryParameters: {
          'limit': _env.limit,
          'offset': offset,
        },
      );

      final series = CharectersResponse<Serie>.fromMap(
        result.data as Map<String, dynamic>,
        Serie.fromMap,
      );
      return series;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CharectersResponse<Event>> getEvents(
    String characterID,
    int offset,
  ) async {
    try {
      final result = await _source.dio.get<dynamic>(
        '${_env.endpoint}$CHARACTERS_URL/$characterID/$EVENTS_URL',
        queryParameters: {
          'limit': _env.limit,
          'offset': offset,
        },
      );

      final events = CharectersResponse<Event>.fromMap(
        result.data as Map<String, dynamic>,
        Event.fromMap,
      );
      return events;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CharectersResponse<Story>> getStories(
    String characterID,
    int offset,
  ) async {
    try {
      final result = await _source.dio.get<dynamic>(
        '${_env.endpoint}$CHARACTERS_URL/$characterID/$STORIES_URL',
        queryParameters: {
          'limit': _env.limit,
          'offset': offset,
        },
      );

      final stories = CharectersResponse<Story>.fromMap(
        result.data as Map<String, dynamic>,
        Story.fromMap,
      );
      return stories;
    } catch (e) {
      rethrow;
    }
  }
}
