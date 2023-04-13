// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dacodes_dd3/src/utils/environment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RemoteSource {
  final Env _env;
  RemoteSource(this._env) {
    debugPrint(' ----- Init App Api ------ ');

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final timeStamp = DateTime.now().millisecondsSinceEpoch;

          final hashStr = '$timeStamp${_env.privateKey}${_env.publicKey}';

          final params = <String, dynamic>{
            'apikey': _env.publicKey,
            'hash': generateMd5(hashStr),
            'ts': timeStamp,
          }..addAll(options.queryParameters);

          final optionsFinal = options.copyWith(queryParameters: params);

          debugPrint('🔰  URL:${optionsFinal.uri}');
          debugPrint(
            'REQUEST[${optionsFinal.method}] => PATH: ${optionsFinal.path}',
          );
          debugPrint('OPTIONS:${optionsFinal.headers}');

          return handler.next(optionsFinal);
        },
        onResponse: (response, handler) {
          debugPrint(
            '🔹 RESPONSE[${response.statusCode}] => PATH: ${response.realUri}',
          );
          //debugPrint('RESPONSE:\n${response.data}');
          return handler.next(response);
        },
        onError: (DioError err, handler) {
          debugPrint(
            '⛔️ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
          );
          return handler.next(err);
        },
      ),
    );

    dio.options.headers = {
      Headers.contentTypeHeader: Headers.jsonContentType,
      Headers.acceptHeader: Headers.jsonContentType,
    };
  }

  final Dio dio = Dio();

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
